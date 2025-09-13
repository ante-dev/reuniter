import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoundItemReportPage extends StatelessWidget {
  FoundItemReportPage({super.key});

  // Controllers to capture text input for each field
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Method to save the found item details to Firestore
  Future<void> _submitFoundItem(BuildContext context) async {
    final description = _descriptionController.text;
    final category = _categoryController.text;
    final locationFound = _locationController.text;

    // Check if all fields are filled before submission
    if (description.isNotEmpty && category.isNotEmpty && locationFound.isNotEmpty) {
      try {
        // Add a new document to the 'items' collection
        await FirebaseFirestore.instance.collection('items').add({
          'description': description,
          'category': category,
          'location_found': locationFound,
          'timestamp': DateTime.now(),
          'status': 'found', // Mark this as a found item
        });

        // Clear the fields after successful submission
        _descriptionController.clear();
        _categoryController.clear();
        _locationController.clear();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Found item reported successfully!')),
        );

        // Navigate back after submission
        Navigator.pop(context);
      } catch (e) {
        // Handle Firestore submission error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting found item: $e')),
        );
      }
    } else {
      // Show error if fields are missing
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Found Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter item description',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Category:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter item category',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            const Text('Location Found:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Enter location where item was found',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _submitFoundItem(context), // Pass context to handle submission
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
