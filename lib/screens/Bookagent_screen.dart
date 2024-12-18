import 'package:flutter/material.dart';

class BookAgentScreen extends StatelessWidget {
  const BookAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List data agen
    final List<Map<String, dynamic>> agents = [
      {
        "name": "Thomas Gunawan",
        "rating": 4.5,
        "jobs": 124,
        "image": "assets/images/agent1.png",
      },
      {
        "name": "Ridho Rahmat",
        "rating": 4.8,
        "jobs": 97,
        "image": "assets/images/agent2.png",
      },
      {
        "name": "Thomas Gunawan",
        "rating": 4.5,
        "jobs": 103,
        "image": "assets/images/agent3.png",
      },
      {
        "name": "Ali Hartanto",
        "rating": 4.7,
        "jobs": 116,
        "image": "assets/images/agent4.png",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Book Agent',
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
              // Notifikasi action
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: agents.length,
        itemBuilder: (context, index) {
          final agent = agents[index];
          return AgentCard(
            name: agent['name'],
            rating: agent['rating'],
            jobs: agent['jobs'],
            imagePath: agent['image'],
          );
        },
      ),
      backgroundColor: const Color(0xFFF8F9FB),
    );
  }
}

class AgentCard extends StatelessWidget {
  final String name;
  final double rating;
  final int jobs;
  final String imagePath;

  const AgentCard({
    super.key,
    required this.name,
    required this.rating,
    required this.jobs,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto Agent
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 180,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Informasi Agent
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pick up Agent',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Rating
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Total Jobs
                    Text(
                      'Total Jobs: $jobs',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
