import 'package:flutter/material.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import '../screens/pickup_detail_screen.dart';

class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({super.key});

  @override
  _LocationSelectionScreen createState() => _LocationSelectionScreen();
}

class _LocationSelectionScreen extends State<LocationSelectionScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Location',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
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
              // Handle notification action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // TextField for pickup location
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Where to pickup?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Location ListView
            Expanded(
              child: ListView(
                children: const [
                  _LocationTile(
                    title: 'Telkom University Land Mark Tower',
                    address:
                        'Jl. Telekomunikasi No.1 Sukapura, Dayeuhkolot, Bandung, Jawa Barat',
                  ),
                  _LocationTile(
                    title: 'Pondok Fajar Citeureup',
                    address:
                        'Jl. Sukabirus No.52, Citeureup, Dayeuhkolot, Bandung, Jawa Barat',
                  ),
                  _LocationTile(
                    title: "McDonald's Podomoro Park",
                    address:
                        'Jl. Podomoro Boulevard Utara no.1, Bojong Soang, Bandung, Jawa Barat',
                  ),
                  _LocationTile(
                    title: 'Mr Four Residence',
                    address:
                        'Jl. H.Umayah 1, Citeureup, Dayeuhkolot, Bandung, Jawa Barat',
                  ),
                ],
              ),
            ),
            // Help Section
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                'Need Help?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Row(
              children: [
                Icon(Icons.camera_alt_outlined, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'If you haven’t decided where to pick up, select a pick up with metered fare.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.map_outlined, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Copy the place’s plus code from Google Maps and search it here.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
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
}

class _LocationTile extends StatelessWidget {
  final String title;
  final String address;

  const _LocationTile({
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 2.0,
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: Colors.red,
          size: 28.0,
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(address),
        onTap: () {
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
              return PickupDetailScreen(
                title: title,
                address: address,
              );
            },
          );
        },
      ),
    );
  }
}
