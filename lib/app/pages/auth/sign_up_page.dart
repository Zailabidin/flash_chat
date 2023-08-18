import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/app/pages/home_page.dart';
import 'package:flash_chat/components/registerwidget.dart';
import 'package:flash_chat/models/user_model.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _fullName = '';
  String _email = '';

  String _password = '';
  String? userPhoto;

  final _picker = ImagePicker();

  XFile? photo;
  CollectionReference userprofile =
      FirebaseFirestore.instance.collection('userprofile');

  void pickImageFromCamera() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
      );
      setState(() {
        photo = pickedImage;
      });
    } catch (e) {
      throw e;
    }
  }

  void pickImageFromGallery() async {
    try {
      final pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(() {
        photo = pickedImage;
      });
    } catch (e) {
      throw e;
    }
  }

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      firebase_storage.Reference reference = firebase_storage
          .FirebaseStorage.instance
          .ref('auth-profile/$_email.jpg');
      final _uid = FirebaseAuth.instance.currentUser!.uid;
      await reference.putFile(
        File(photo!.path),
      );
      userPhoto = await reference.getDownloadURL();
      final userModel = UserModel(
        name: _fullName,
        email: _email,
        passsword: _password,
        photo: userPhoto,
      );
      userprofile.doc(_uid).set(userModel.toJson()).then((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    userModel: userModel,
                  )),
        );
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: photo == null
                              ? null
                              : FileImage(
                                  File(photo!.path),
                                ),
                          radius: 60,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  pickImageFromCamera();
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  pickImageFromGallery();
                                },
                                icon: Icon(
                                  Icons.photo,
                                  size: 30,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _fullName = value;
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'full name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _email = value;
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _password = value;
                      },
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: 'password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'already have account?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            // context.go('/sign_in_page');
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RegisterWidget(
                        onTap: () {
                          if (_fullName.isNotEmpty &&
                              _email.isNotEmpty &&
                              _password.isNotEmpty) {
                            signUp();
                          }

                          // context.go('/home_page');
                        },
                        title: 'Sign Up'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
