// ignore_for_file: must_be_immutable
import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyRegister extends StatelessWidget {
  TextEditingController fullNamecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordVerifyController = TextEditingController();
  MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/hand-painted-watercolor-background-with-sky-clouds-shape.jpg'),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('Register',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 76, 70, 70))),
                  SizedBox(
                    height: 100,
                  ),
                  customText(
                      hintText: 'Full Name', controller: fullNamecontroller),
                  Gap(25),
                  customText(hintText: 'Email', controller: emailController),
                  Gap(25),
                  customText(
                      hintText: 'Password', controller: passwordController),
                  Gap(25),
                  customText(
                      hintText: 'Password Verification',
                      controller: passwordVerifyController),
                  Gap(25),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 88, 85, 85)),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have account?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Gap(5),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
