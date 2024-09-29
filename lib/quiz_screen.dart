import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'main.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  
  int score = 0;
  int currentQuestion = 0;

  final List<Map<String, dynamic>> questions = [
  {
    'question': 'What color do you get by mixing yellow and blue?',
    'answers': ['Green', 'Purple', 'Orange', 'Brown'],
    'correctAnswer': 'Green',
    'questionNumber': "1"
  },
  {
    'question': 'Which planet is known as the Red Planet?',
    'answers': ['Earth', 'Mars', 'Jupiter', 'Venus'],
    'correctAnswer': 'Mars',
    'questionNumber': "2"
  },
  {
    'question': 'What do bees produce?',
    'answers': ['Honey', 'Milk', 'Eggs', 'Butter'],
    'correctAnswer': 'Honey',
    'questionNumber': "3"
  },
];

  void onAnswerSelected(bool isCorrect) {
    if (isCorrect) {
      score++;
    }
    setState(() {
      sharedData.quizData=score;
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        Navigator.pushReplacementNamed(context,"result");
      }
    });
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xff86948f),
        title: const Text("QUIZ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset('assets/quiz_icon.png'),
            const SizedBox(height: 20),

             QuestionWidget(
              question: questions[currentQuestion]['question'],
              answers: List<String>.from(questions[currentQuestion]['answers']),
              correctAnswer: questions[currentQuestion]['correctAnswer'],
              questionNumber: questions[currentQuestion]['questionNumber'],
              onAnswerSelected: onAnswerSelected,
            )
          ],
        ),
      ),
    );
  }
}