import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  File? imageFile;

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Edit Profile',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Gap(30),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : const AssetImage('asset/images/IMG_4364-Photoroom.png'),
              ),
              TextButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text('Add Image')),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'name', border: OutlineInputBorder()),
                    ),
                    Gap(20),
                    TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                          hintText: 'age', border: OutlineInputBorder()),
                    ),
                    Gap(20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'email', border: OutlineInputBorder()),
                    ),
                    Gap(20),
                    TextField(
                      controller: addressController,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: 'address', border: OutlineInputBorder()),
                    ),
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
