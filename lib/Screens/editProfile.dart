import 'dart:io';

import 'package:day_tracker/Screens/profile.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/functions/profileFunction.dart';
import 'package:day_tracker/models/modelProfile.dart';
import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';


class Editprofile extends StatefulWidget {
 final String username;
 final String email;
 final String image;
 
   Editprofile({super.key,required this.username,required this.email,required this.image});

  @override
  State<Editprofile> createState() => _MyProfileState();
}

class _MyProfileState extends State<Editprofile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  File? imageFile;
 
    
  @override
  void initState() {
    super.initState();
    nameController.text = widget.username;
    emailController.text = widget.email;
   
  }

  Future<void> pickImage() async {
    final pickFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickFile != null) {
      setState(() {
        imageFile = File(pickFile.path);
      });
    }
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
                    passTextfield(controller: nameController, hint: 'name'),
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
                         updateBtn();
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
  void updateBtn(){
    final eUser= nameController.text.trim();
    final eEmail= emailController.text.trim();
    final img = imageFile?.path??'';

    if(eUser.isEmpty || eEmail.isEmpty )
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill all fields')));
      return;
    }

    final updated = UserDatas(username: eUser, email: eEmail,images: img);

   updateUser(updated);
   Navigator.pop(context);
  }
}
