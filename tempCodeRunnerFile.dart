import 'package:flutter/material.dart';

class DoctorReportedIssueScreen extends StatefulWidget {
  const DoctorReportedIssueScreen({super.key});

  @override
  State<DoctorReportedIssueScreen> createState() =>
      _DoctorReportedIssueScreenState();
}

class _DoctorReportedIssueScreenState extends State<DoctorReportedIssueScreen> {
  // Replace with your actual data fetching logic for reported issues
  final List<ReportedIssue> _reportedIssues = [
    ReportedIssue(
      description: 'Leak in front of the building',
      location: 'Main Street, near the park',
      imageUrl: 'path/to/image.jpg',
      status: IssueStatus.pending,
    ),
    // Add more reported issues here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reported Issues',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(226, 5, 55, 121),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _reportedIssues.length,
          itemBuilder: (context, index) {
            final reportedIssue = _reportedIssues[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   
 [
                    Text(
                      'Description:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height:   
 10),
                    Text(reportedIssue.description),
                    const SizedBox(height: 10),
                    Text(
                      'Location:',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(reportedIssue.location),
                    const SizedBox(height: 10),
                    reportedIssue.imageUrl != null
                        ? Image.network(reportedIssue.imageUrl!, height: 150)
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reportedIssue.status == IssueStatus.pending
                              ? 'Status: Pending'
                              : 'Status: Resolved',
                          style: const TextStyle(fontSize: 16),
                        ),
                        ElevatedButton(
                          onPressed: () => _markIssueResolved(index),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: reportedIssue.status == IssueStatus.pending
                                ? Colors.green
                                : Colors.grey,
                          ),
                          child: Text(
                            reportedIssue.status == IssueStatus.pending
                                ? 'Mark Resolved'
                                : 'Marked Resolved',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
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

  void _markIssueResolved(int index) {
    setState(() {
      _reportedIssues[index].status = IssueStatus.resolved;
    });
    // Add logic to update the issue status on your server (if applicable)
  }
}

// Define classes to represent reported issues and their status
enum IssueStatus { pending, resolved }

class ReportedIssue {
  final String description;
  final String location;
  final String? imageUrl;
  IssueStatus status;

  ReportedIssue({
    required this.description,
    required this.location,
    this.imageUrl,
    this.status = IssueStatus.pending,
  });
}