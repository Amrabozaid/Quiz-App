import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  
  final String question;
  final List<String> answers;
  final String correctAnswer;
  final String questionNumber;
  final ValueChanged<bool> onAnswerSelected;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.questionNumber,
    required this.onAnswerSelected,
    
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xffb8e893),
          borderRadius: BorderRadius.circular(20)
        ),
        width: 350,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text("${widget.questionNumber}/3",style: const TextStyle(fontSize: 16),),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(widget.question,style: const TextStyle(fontSize: 16),),
              ),
              Container(
                width: constraints.maxWidth * .75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: RadioListTile<String>(
                  title: Text(widget.answers[0]), value: widget.answers[0], groupValue: selectedAnswer, onChanged: (value){setState((){selectedAnswer=value;});}
                ),
              ),
              Container(
                width: constraints.maxWidth * .75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(
                  child: RadioListTile<String>(
                    title: Text(widget.answers[1]), value: widget.answers[1], groupValue: selectedAnswer, onChanged: (value){setState((){selectedAnswer=value;});}
                  ),
                ),
              ),
              Container(
                width: constraints.maxWidth * .75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: RadioListTile<String>(
                  title: Text(widget.answers[2]), value: widget.answers[2], groupValue: selectedAnswer, onChanged: (value){setState((){selectedAnswer=value;});}
                ),
              ),
              Container(
                width: constraints.maxWidth * .75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: RadioListTile<String>(
                  title: Text(widget.answers[3]), value: widget.answers[3], groupValue: selectedAnswer, onChanged: (value){setState((){selectedAnswer=value;});}
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedAnswer != null) {
                    bool isCorrect = selectedAnswer == widget.correctAnswer;
                    widget.onAnswerSelected(isCorrect);
                  }
                },
                child: const Text("NEXT")
              )
            ],
          ),
        ),
      );
    });
  }
}