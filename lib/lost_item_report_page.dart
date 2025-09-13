import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LostItemReportPage extends StatefulWidget {
  const LostItemReportPage({super.key});

  @override
  _LostItemReportPageState createState() => _LostItemReportPageState();
}

class _LostItemReportPageState extends State<LostItemReportPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Function to submit lost item details to Firestore
  Future<void> _submitLostItem() async {
    final description = _descriptionController.text;
    final category = _categoryController.text;
    final location = _locationController.text;

    if (description.isEmpty || category.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('items').add({
        'description': description,
        'category': category,
        'location': location,
        'timestamp': FieldValue.serverTimestamp(), // For sorting by time if needed
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lost item reported successfully')),
      );

      Navigator.pop(context); // Go back after submission
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error reporting lost item: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Lost Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Description:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter item description',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Category:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter item category',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Location Lost:', style: TextStyle(fontSize: 16)),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter location where item was lost',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitLostItem,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
