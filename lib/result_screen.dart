import 'package:flutter/material.dart';

import 'main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
      return Scaffold(
        backgroundColor: const Color(0xff86948f),
        body: Center(
          
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: constraints.maxWidth*.85,
                height: constraints.maxHeight*.25,
                decoration: BoxDecoration(
                  color: const Color(0xffabbfb8),
                  borderRadius: BorderRadius.circular(20)
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(),
                    Text("HELLO ${sharedData.signupData} YOUR SCORE IS"),
                    Text("${sharedData.quizData}/3",style: const TextStyle(fontSize: 26)),
                    ElevatedButton(
                            onPressed: () {
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                              Navigator.pushReplacementNamed(context, '/');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                            ),
                            child: const Text('FINISH'),
                          )
                  ],
                ),
              ),
              Positioned(
                top: -25,
                right: 40,
                left: 40,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      color: const Color(0xffb8e893),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'CONGRATULATIONS!!!!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      );
    });
  }
}