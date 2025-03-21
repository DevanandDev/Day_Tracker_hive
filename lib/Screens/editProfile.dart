import 'dart:io';

import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State< Editprofile> createState() => _MyProfileState();
}

class _MyProfileState extends State< Editprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  
  File? imageFile;
  String? saveImage;

  @override 
  void initState()
  {
    super.initState();
    profDetails();
  }


  Future<void> pickImage() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickFile != null) {
      setState(() {
        imageFile = File(pickFile.path);
      });
    }
  }

 
  Future<void> profDetails()async{
    final prefer = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefer.getString('userid') ?? 'no data';
      emailController.text = prefer.getString('email') ?? 'no email';
      

    });
  }

  Future<void> saveEdit()async{
    final pref = await SharedPreferences.getInstance();
    await pref.setString('userid', nameController.text);
    await pref.setString('email', emailController.text);

    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 248, 254),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 60,
          ),
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
       
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)]),
        ),
        child: SafeArea(
          child: Column(
            children: [
              
              Gap(20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : const AssetImage('asset/images/person.webp'),
              ),
              TextButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('Add Image')),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Column(
                  children: [
                    passTextfield(controller: nameController,hint: 'name'),
                  
                
                    Gap(20),
                   passTextfield(controller: emailController, hint: 'email'),
                   
                    Gap(20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 146, 208, 255),
                            shadowColor: const Color.fromARGB(255, 76, 0, 255),
                            overlayColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            foregroundColor: Colors.black,
                           
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                            saveEdit();
                           
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
