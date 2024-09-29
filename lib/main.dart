import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/signup_Screen.dart';

void main() {
  runApp(const MyApp());
}

class SharedData {
  String signupData = '';
  int quizData =0;
}

final SharedData sharedData = SharedData();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return 
    //  Placeholder();
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (ctx)=> SignupScreen(),
        "quiz": (ctx)=>const QuizScreen(),
        "result": (ctx)=>const ResultScreen()
      },
    );
  }
}