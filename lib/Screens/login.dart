import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class MyLogin extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
              'assets/images/hand-painted-watercolor-background-with-sky-clouds-shape.jpg'),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 76, 70, 70)),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  customText(
                      hintText: 'username', controller: usernameController),
                  SizedBox(
                    height: 25,
                  ),
                  customText(
                      hintText: 'password', controller: passwordController),
                  Gap(25),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 88, 85, 85)),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 69, 59, 59)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                          thickness: 2,
                          height: 2,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Or',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.white,
                          thickness: 2,
                          height: 2,
                        )),
                      ],
                    ),
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
