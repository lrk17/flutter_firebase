import 'package:flutter/material.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState()   
 => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen>   
 {
  // Replace with your actual data fetching logic for patient information
  final Patient _patient = Patient(
    name: 'John Doe',
    email: 'johndoe@example.com',
    // Add other patient details
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome,   
 ${_patient.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Display patient information
            Text('Email: ${_patient.email}'),
            // Add other patient details
            const SizedBox(height: 20),
            // Add buttons for appointments, messages, and other features
          ],
        ),
      ),
    );
  }
}

class Patient {
  final String name;
  final String email;
  // Add other patient details

  Patient({
    required this.name,
    required this.email,
    // Add other details
  });
}