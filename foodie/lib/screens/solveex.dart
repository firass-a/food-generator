import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:foodie/main.dart';
import 'package:image_picker/image_picker.dart';

class SolveExercisePage extends StatefulWidget {
  const SolveExercisePage({super.key});

  @override
  State<SolveExercisePage> createState() => _SolveExercisePageState();
}

class _SolveExercisePageState extends State<SolveExercisePage> {
  File? _imageFile;
  final _picker = ImagePicker();
  pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle solve exercise action
                      pickImage();
                    },
                    child: Text('Drop your exercise here !'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
