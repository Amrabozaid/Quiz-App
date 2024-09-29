import 'package:flutter/material.dart';
import 'main.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController=TextEditingController();
  String? validateName(String? value){
    if (value == null || value.isEmpty){return "Name is required";}else{return null;}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff86948f),
      body: Center(
        child: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("QUIZ", style: TextStyle(fontSize: 50, color: Colors.white,fontWeight: FontWeight.w500),),
              const SizedBox(height: 40),

              Image.asset('assets/quiz_icon.png'),
              const SizedBox(height: 80),
              
              Stack(
                clipBehavior: Clip.none,
                children: [
                  
                  Form(
                    key: _formKey,
                    child: Container(
                      width: constraints.maxWidth*.85,
                      height: constraints.maxHeight*.25,
                      decoration: BoxDecoration(
                        color: const Color(0xffabbfb8),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                    
                          const SizedBox(height: 15),
                          const Text(
                            'Please Enter Your Name',
                            style: TextStyle(fontSize: 15),
                          ),
                    
                          const SizedBox(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 248, 250, 252),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder()
                                ),
                                controller: nameController,
                                validator: validateName,
                              ),
                            ),
                          ),
                          
                          ElevatedButton(
                            onPressed: () {
                              sharedData.signupData=nameController.text;
                              if(_formKey.currentState!.validate() ){
                                Navigator.pushNamed(context, "quiz");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                            ),
                            child: const Text('SUBMIT'),
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: -25,
                    right: 50,
                    left: 50,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                          color: const Color(0xffb8e893),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'WELCOME',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        }),

      ),
    );
  }
}