
import 'package:day_tracker/Screens/login.dart';
import 'package:day_tracker/functions/profileFunction.dart';
import 'package:day_tracker/models/modelProfile.dart';
import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyRegister extends StatelessWidget {
  final TextEditingController fullNamecontroller= TextEditingController();
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passwordController=TextEditingController();
   MyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'asset/images/hand-painted-watercolor-background-with-sky-clouds-shape.jpg'),
                fit: BoxFit.fill)),
              child: SafeArea(               
                child: Center(    
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('Register',style: TextStyle( fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 76, 70, 70))),
                        SizedBox(height: 100,),
                          
                        customText(hintText: 'Full Name', controller: fullNamecontroller),
                        Gap(25),
                        customText(hintText: 'Email', controller: emailController),
                        Gap(25),
                        customText(hintText: 'Password', controller: passwordController),
                        Gap(25),
                       
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                          onPressed: (){
                            mySignup(context);

                          }, child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: const Color.fromARGB(255, 88, 85, 85)),)),
                          SizedBox(height: 50,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyLogin()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Do you have account?',style: TextStyle(fontWeight: FontWeight.bold),),
                                  Gap(5),
                                  Text('Sign Up',style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),)
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
  Future<void> mySignup(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String username = fullNamecontroller.text;
    String password = passwordController.text;
    String email = emailController.text;



    pref.setBool('key_login', true);

    if (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty) {
      await pref.setString('userid', username);
      await pref.setString('pass', password);
      await pref.setString('email', email);

         final save = UserDatas(username: fullNamecontroller.text, email: emailController.text);
    addUser(save);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Register Sccessfully')));
          
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('invalid username and password')));
    }}}