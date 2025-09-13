import 'package:flutter/material.dart';
import 'lost_item_report_page.dart'; // Import the LostItemReportPage
import 'found_item_report_page.dart'; // Import the FoundItemReportPage

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the Lost Item Reporting Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LostItemReportPage()),
                );
              },
              child: const Text('Report Lost Item'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Found Item Reporting Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoundItemReportPage()),
                );
              },
              child: const Text('Report Found Item'),
            ),
          ],
        ),
      ),
    );
  }
}