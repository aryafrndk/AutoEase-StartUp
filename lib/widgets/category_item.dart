import 'package:flutter/material.dart';
import '../screens/pick_up_screen.dart';
import '../screens/service_screen.dart';
import '../screens/reservation_screen.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;

  const CategoryItem({Key? key, required this.imagePath, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to different screens based on the title
        if (title == 'Pickup') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PickUpScreen()),
          );
        } else if (title == 'Service') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ServiceScreen()),
          );
        } else if (title == 'Reservation') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReservationScreen()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F4F7), // Background color
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the left
          children: [
            Image.asset(
              imagePath, // Image for the category
              width: 30, // Set the width of the image as per your requirement
              height: 30, // Set the height of the image as per your requirement
            ),
            const SizedBox(width: 10), // Space between the image and text
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
