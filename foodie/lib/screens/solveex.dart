import 'package:flutter/material.dart';

class SolveExercisePage extends StatelessWidget {
  const SolveExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle solve exercise action
                },
                child: Text('Drop your exercise here !'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
