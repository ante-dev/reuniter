import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const SingleChildScrollView( // Added SingleChildScrollView
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
          children: [

            SizedBox(height: 20),
            Text(
              'Welcome to Reuniter, the mobile lost and found app!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Our mission is to help people reunite with their lost items and bring communities together.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'How it works:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Report a lost item: Share a description and photo of the item you lost.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Search for lost items: Browse through reported lost items in your area.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Reunite with your item: Connect with the person who found your item and arrange a meetup.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our Team:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/team_member.jpg'),
                  radius: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Ian Peter',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: [support@reuniter.com](mailto:support@reuniter.com)',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: 0717671091',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}