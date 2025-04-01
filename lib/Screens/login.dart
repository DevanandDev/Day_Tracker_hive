import 'package:day_tracker/Screens/home.dart';
import 'package:day_tracker/Screens/register.dart';
import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              'asset/images/hand-painted-watercolor-background-with-sky-clouds-shape.jpg'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: 500,
              child: SingleChildScrollView(
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
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(100, 40)),
                        onPressed: () {
                          getLogin(context);
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 50),
                      child: Row(
                        children: [
                          Text("Don't you have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => MyRegister()));
                              },
                              child: const Text(
                                "Sign up Here!",
                                style: TextStyle(color: Colors.red),
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
      ),
    );
  }

  Future<void> getLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('key_value', true);

    String? getRegId = prefs.getString('userid');
    String? getPass = prefs.getString('pass');

    String logName = usernameController.text;
    String? logPass = passwordController.text;

    if (getRegId == logName && getPass == logPass) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => MyHome()));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login Successfully')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login failed')));
    }
  }
}
