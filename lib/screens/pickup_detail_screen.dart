import 'package:flutter/material.dart';

class PickupDetailScreen extends StatefulWidget {
  final String title;
  final String address;

  const PickupDetailScreen({
    super.key,
    required this.title,
    required this.address,
  });

  @override
  _PickupDetailScreenState createState() => _PickupDetailScreenState();
}

class _PickupDetailScreenState extends State<PickupDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets, // Untuk keyboard overlap
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pickup Info
            Center(
              child: const Text(
                'Pickup Detail',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10), // Spacing between title and Card
            Card(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_pin, color: Colors.blue),
                title: Text(
                  widget.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                subtitle: Text(
                  widget.address,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Input Field for Pickup Details
            TextField(
              decoration: InputDecoration(
                hintText: 'Add pickup detail (e.g. near the gate)',
                prefixIcon: const Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Terms of Service
            const Text(
              'By ordering, you agree to our Booking Terms of Service. Need Help?',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            // Choose Pickup Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for choosing pickup
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 40.0),
                ),
                child: const Text(
                  'Choose This Pickup',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
