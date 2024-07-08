import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';
import 'package:file_picker/file_picker.dart';

class SharingScreen extends StatefulWidget {
  const SharingScreen({super.key});

  @override
  State<SharingScreen> createState() {
    return _SharingScreenState();
  }
}

class _SharingScreenState extends State<SharingScreen> {
  String fileName = "No file yet";
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    setState(() {
      if (result != null) {
        fileName = result.files.single.name.toString();
      }
    });
  }

  late NearbyService nearbyService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: _pickFile, child: const Text("Pick a file")),
            Text(fileName)
          ],
        ),
      ),
    );
  }
}
