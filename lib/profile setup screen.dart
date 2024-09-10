import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen>   
 {
  final   
 _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _medicalHistoryController = TextEditingController();
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(   

          'Profile Setup',
          style: TextStyle(color: Colors.white),   

        ),
        backgroundColor: const Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(   

                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller:   
 _contactController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),   

              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller:   
 _medicalHistoryController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Medical History',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedLanguage,
              items: [
                DropdownMenuItem(
                  value: 'English',
                  child: Text('English'),
                ),
                // Add other languages as needed
              ],
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate and save user information
                // Navigate to the next screen or home screen
              },
              child: const Text('Save Profile'),
            ),
          ],
        ),
      ),
    );
  }
}