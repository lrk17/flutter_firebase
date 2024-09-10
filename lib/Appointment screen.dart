import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen>   
  
 {
  // Sample data for appointments
  final List<Appointment> _appointments = [
    Appointment(
      doctorName: 'Dr. John Smith',
      specialty: 'Cardiology',
      date: DateTime.now().add(Duration(days: 7)),
      time: '10:00 AM',
      status: AppointmentStatus.upcoming,
      doctorContact: '555-555-5555',
      doctorLocation: '123 Main Street, City, State',
    ),
    // Add more appointments
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appointments',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const   
 Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _appointments.length,
          itemBuilder: (context, index) {
            final appointment = _appointments[index];
            return   
 Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${appointment.doctorName}   
 - ${appointment.specialty}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date:   
 ${appointment.date.toIso8601String()}'),
                        Text('Time: ${appointment.time}'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status: ${appointment.status.toString().split('.').last}',
                          style: TextStyle(
                            fontSize: 16,
                            color: appointment.status == AppointmentStatus.upcoming
                                ? Colors.blue
                                : Colors.green,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _cancelAppointment(index),
                              icon: const Icon(Icons.cancel),
                            ),
                            IconButton(
                              onPressed: () => _rescheduleAppointment(index),
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Doctor Contact: ${appointment.doctorContact}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Doctor Location: ${appointment.doctorLocation}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _cancelAppointment(int index) {
    // Implement logic to cancel the appointment
    setState(() {
      _appointments[index].status = AppointmentStatus.cancelled;
    });
  }

  void _rescheduleAppointment(int index) {
    // Implement logic to reschedule the appointment
    // You might want to show a dialog or a new screen for the user to select a new date and time
  }
}