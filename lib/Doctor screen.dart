import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorScreen({required this.doctor, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${doctor.name}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${doctor.specialty}',   

              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Location: ${doctor.location}'),
            const SizedBox(height: 10),
            Text('Availability: ${doctor.availability}'),
            // Add more details about the doctor as needed
          ],
        ),
      ),
    );
  }
}