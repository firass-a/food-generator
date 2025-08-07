import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/providers/exercisesprovider.dart';

class ShowSolution extends ConsumerStatefulWidget {
  const ShowSolution({super.key});

  @override
  ConsumerState<ShowSolution> createState() => _ShowSolutionState();
}

class _ShowSolutionState extends ConsumerState<ShowSolution> {
  @override
  Widget build(BuildContext context) {
    final solution = ref.watch(exerciseNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.file(File(solution.last.imagePath)),
          Text(solution.last.extractedText),
        ],
      ),
    );
  }
}
