import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;
  String _language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: _darkMode,
                onChanged: (value) {
                  setState(() {
                    _darkMode = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Notifications'),
              trailing: Switch(
                value: _notifications,
                onChanged: (value) {
                  setState(() {
                    _notifications = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: _language,
                onChanged: (value) {
                  setState(() {
                    _language = value!;
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: 'English',
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: 'Spanish',
                    child: Text('Spanish'),
                  ),
                  DropdownMenuItem(
                    value: 'French',
                    child: Text('French'),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Clear Cache'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Clear cache logic here
                },
                child: const Text('Clear'),
              ),
            ),
            ListTile(
              title: const Text('Reset Settings'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Reset settings logic here
                },
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}