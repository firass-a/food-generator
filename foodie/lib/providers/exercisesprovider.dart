import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/modules/exercise.dart';

class ExerciseNotifier extends Notifier<List<Exercise>> {
  @override
  List<Exercise> build() {
    // TODO: implement build
    return [];
  }

  void addExercise(String imagePath, String extractedText) {
    state = [
      ...state,
      Exercise(imagePath: imagePath, extractedText: extractedText),
    ];
  }
}

final exerciseNotifierProvider = NotifierProvider<ExerciseNotifier, List<Exercise>>(
  () => ExerciseNotifier(),
);
