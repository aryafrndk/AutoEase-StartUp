import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  final String location;
  final String description;
  final String imagePath;

  const LocationItem({
    Key? key,
    required this.location,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath, width: 40, height: 40),
      title: Text(location),
      subtitle: Text(description),
    );
  }
}
