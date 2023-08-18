import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/app/pages/home_page.dart';
import 'package:flash_chat/components/registerwidget.dart';

import 'package:flutter/material.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;

  String? password;

  Future<void> signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign In',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              onChanged: (Value) {
                email = Value;
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
              onChanged: (Value) {
                password = Value;
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    // context.go('/sign_up_page');
                  },
                  child: Text(
                    'Sign Up',
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
                  if (email!.isNotEmpty && password!.isNotEmpty) {
                    signIn(context);
                  }
                  // context.go('/home_page');
                },
                title: 'Sign In'),
          ],
        ),
      ),
    );
  }
}
