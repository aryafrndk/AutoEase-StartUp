import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../screens/location_selection_screen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  // Track the selected service
  String? selectedService;
  int currentIndex = 0; // Track the current index for the BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Service',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {
              // Notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Choose any Service\nyou need',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildServiceItem(
                    imagePath: 'assets/images/repair.png',
                    label: 'Repair',
                    service: 'repair',
                  ),
                  _buildServiceItem(
                    imagePath: 'assets/images/maintainance.png',
                    label: 'Maintanance',
                    service: 'maintanance',
                  ),
                  _buildServiceItem(
                    imagePath: 'assets/images/customization.png',
                    label: 'Customizations',
                    service: 'customizations',
                  ),
                  _buildServiceItem(
                    imagePath: 'assets/images/tire_replacement.png',
                    label: 'Tire Replacement',
                    service: 'tire_replacement',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Check if a service is selected
                  if (selectedService != null) {
                    // Navigate to LocationSelectionScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationSelectionScreen(),
                      ),
                    );
                  } else {
                    // Show an alert if no service is selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please select a service first')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE9EDF2),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Continue',
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
    );
  }

  Widget _buildServiceItem({
    required String imagePath,
    required String label,
    required String service,
  }) {
    bool isSelected = selectedService == service;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedService = isSelected ? null : service; // Toggle selection
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE9EDF2),
          borderRadius: BorderRadius.circular(16.0),
          border: isSelected
              ? Border.all(color: Color(0xFF3E6398), width: 3)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 100,
              height: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
