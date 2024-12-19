import 'package:flutter/material.dart';

class VehicleTrackingScreen extends StatelessWidget {
  const VehicleTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vehicle Transport Tracking',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Pengangkutan
              const Text(
                'Transport Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Stepper Tracking Status
              Column(
                children: [
                  _buildStep(
                    context,
                    title: 'Order Placed',
                    subtitle: 'Your transport request has been received.',
                    isCompleted: true,
                  ),
                  _buildStep(
                    context,
                    title: 'Vehicle Picked Up',
                    subtitle: 'Your vehicle has been picked up by the driver.',
                    isCompleted: true,
                  ),
                  _buildStep(
                    context,
                    title: 'In Transit',
                    subtitle: 'Your vehicle is on the way.',
                    isCompleted: true,
                  ),
                  _buildStep(
                    context,
                    title: 'Near Destination',
                    subtitle: 'The driver is approaching the destination.',
                    isCompleted: false,
                  ),
                  _buildStep(
                    context,
                    title: 'Delivered',
                    subtitle: 'Your vehicle has been delivered.',
                    isCompleted: false,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Vehicle Information Section
              const Text(
                'Vehicle Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildVehicleCard(
                vehicleImageUrl: 'assets/images/motor.jpg',
                vehicleModel: 'Yamaha Aerox',
                vehicleDetails: 'License Plate: B 1234 ABC',
              ),
              const SizedBox(height: 20),
              // Driver Information Section
              const Text(
                'Driver Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDriverDetails(
                driverName: 'John Doe',
                contact: '+62 812-3456-7890',
                vehicleType: 'Flatbed Truck',
              ),
              const SizedBox(height: 20),
              // Destination Details
              const Text(
                'Destination Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Recipient: Jane Smith',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Address: Jl. Sudirman No. 10, Jakarta Pusat, DKI Jakarta',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Phone: +62 812-9876-5432',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF8F9FB),
    );
  }

  Widget _buildStep(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step Indicator
        Column(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? Colors.green : Colors.grey,
              size: 24,
            ),
            Container(
              width: 2,
              height: 40,
              color: isCompleted ? Colors.green : Colors.grey,
            ),
          ],
        ),
        const SizedBox(width: 12),
        // Step Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVehicleCard({
    required String vehicleImageUrl,
    required String vehicleModel,
    required String vehicleDetails,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Vehicle Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              vehicleImageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Vehicle Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicleModel,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  vehicleDetails,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverDetails({
    required String driverName,
    required String contact,
    required String vehicleType,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Driver: $driverName',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'Contact: $contact',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Text(
            'Transport Vehicle: $vehicleType',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
