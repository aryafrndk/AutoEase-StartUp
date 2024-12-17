import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../screens/DatePickerBottomSheet.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Reservations',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Action for notifications
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Illustration Image
            Center(
              child: Image.asset(
                'assets/images/reservation2.png', // Your image path
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            // List of Reservation Features
            const ReservationFeatureItem(
              icon: Icons.calendar_today,
              title: 'Plan ahead, stress free',
              description: 'Book from 1 hour 15 min to 7 days in reservation',
            ),
            const SizedBox(height: 12),
            const ReservationFeatureItem(
              icon: Icons.access_time,
              title: 'On-time pick assurance',
              description: 'Book from 1 hour 15 min to 7 days in reservation',
            ),
            const SizedBox(height: 12),
            const ReservationFeatureItem(
              icon: Icons.watch_later_outlined,
              title: 'Extended wait time',
              description:
                  'Just in case, your agent can wait up to 15 minutes after your scheduled pickup time',
            ),
            const SizedBox(height: 12),
            const ReservationFeatureItem(
              icon: Icons.cancel_outlined,
              title: 'Cancel for free up to one hour before',
              description:
                  'If you cancel last minutes, you’ll be charged Rp20.000.',
            ),
            const SizedBox(height: 30),
            // Get Started Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    isScrollControlled: true,
                    builder: (context) {
                      return const DatePickerBottomSheet();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE9F5FF),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100, vertical: 14), // Button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index; // Update the selected index
          });
        },
      ),
      backgroundColor: const Color(0xFFF8F9FB), // Page background color
    );
  }
}

// Widget for each reservation feature item
class ReservationFeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ReservationFeatureItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Container
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFE9F5FF),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.black,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        // Title and Description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
