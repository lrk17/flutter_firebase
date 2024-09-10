import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState()   
 => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   
 const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:   
 const Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Notifications'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;   

                });
              },
            ),
            const SizedBox(height: 20),
            // Add other settings options here
            // For example:
            // ListTile(
            //   title: const Text('Change Password'),
            //   onTap: () {
            //     // Navigate to change password screen
            //   },
            // ),
            // ListTile(
            //   title: const Text('About'),
            //   onTap: () {
            //     // Navigate to about screen
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}  