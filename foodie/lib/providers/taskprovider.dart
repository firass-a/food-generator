import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodie/modules/tasks.dart';
import 'package:foodie/screens/planning.dart';
import 'package:foodie/screens/quiz.dart';
import 'package:foodie/screens/resumepage.dart';

import '../screens/solveex.dart';

final taskProvider = Provider<List<Tasks>>((ref) {
  return [
    Tasks(title: "Solve exercises", description: "solve any exercise you want",route : SolveExercisePage(), ),
    Tasks(title: "Have a quiz !", description: "Revise with quick quizes",route :QuizPage()),
    Tasks(
      title: "Prepare a resume",
      description: "Prepare resumes to revise your knowledge",
      route :ResumePage()
    ),
    Tasks(
      title: "Plan for my next exam !",
      description: "Plan your next exam with us ",
     route : PlanningPage()
    ),
  ];
});
