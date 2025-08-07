import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/providers/exercisesprovider.dart';
import 'package:foodie/screens/showsolution.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class SolveExercisePage extends ConsumerStatefulWidget {
  const SolveExercisePage({super.key});

  @override
  ConsumerState<SolveExercisePage> createState() => _SolveExercisePageState();
}

class _SolveExercisePageState extends ConsumerState<SolveExercisePage> {
  File? _imageFile;
  final _picker = ImagePicker();
  String? _recognizedText; // <-- Store extracted text

  // Pick image from camera
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
    await preformTextRecognition(_imageFile!.path);

    ref
        .read(exerciseNotifierProvider.notifier)
        .addExercise(_imageFile!.path, _recognizedText!);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowSolution()),
    );
  }

  Future<void> preformTextRecognition(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    // ignore: deprecated_member_use
    final textRecognizer = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );
    setState(() {
      _recognizedText = recognizedText.text;
    });
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    final exercise = ref.watch(exerciseNotifierProvider);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: pickImage,
          child: const Icon(Icons.camera_alt),
        ),
        appBar: AppBar(title: const Text("Your exercises")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imageFile == null
                ? Center(
                    child: Text(
                      "No exercises yet !",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: exercise.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          final item = exercise[index];
                          return GestureDetector(
                            onLongPress: () {
                              
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    File(item.imagePath),
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
