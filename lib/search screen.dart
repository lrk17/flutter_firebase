import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState()   
 => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final   
 _specialtyController = TextEditingController();
  final _locationController = TextEditingController();
  final _availabilityController = TextEditingController();
  List<Doctor> _filteredDoctors = [];

  // Replace with your actual data fetching logic for doctors
  final List<Doctor> _allDoctors = [
    Doctor(
      name: 'Dr. John Smith',
      specialty: 'Cardiology',
      location: 'City Hospital',
      availability: 'Monday-Friday, 9AM-5PM',
    ),
    // Add more doctors
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Doctors',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _specialtyController,
              decoration: const InputDecoration(
                labelText: 'Specialty',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),   

            TextField(
              controller: _availabilityController,
              decoration: const InputDecoration(
                labelText: 'Availability',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchDoctors,
              child: const Text('Search'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredDoctors.length,
                itemBuilder: (context, index) {
                  final doctor = _filteredDoctors[index];
                  return   
 ListTile(
                    title: Text(doctor.name),
                    subtitle: Text('${doctor.specialty} - ${doctor.location}'),
                    onTap: () {
                      // Navigate to Doctor Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorScreen(doctor: doctor),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchDoctors() {
    setState(() {
      _filteredDoctors = _allDoctors.where((doctor) {
        final specialtyMatch = doctor.specialty
            .toLowerCase()
            .contains(_specialtyController.text.toLowerCase());
        final locationMatch = doctor.location
            .toLowerCase()
            .contains(_locationController.text.toLowerCase());
        final availabilityMatch = doctor.availability
            .toLowerCase()
            .contains(_availabilityController.text.toLowerCase());
        return specialtyMatch && locationMatch && availabilityMatch;
      }).toList();
    });
  }
}