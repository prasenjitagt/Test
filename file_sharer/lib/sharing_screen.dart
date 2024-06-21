import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

class SharingScreen extends StatefulWidget {
  const SharingScreen({super.key});

  @override
  State<SharingScreen> createState() {
    return _SharingScreenState();
  }
}

class _SharingScreenState extends State<SharingScreen> {
  late NearbyService nearbyService;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("hi"),
      ),
    );
  }
}
