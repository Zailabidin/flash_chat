import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/app/pages/auth/sign_up_page.dart';
import 'package:flash_chat/app/pages/auth/signinpage.dart';
import 'package:flash_chat/components/registerwidget.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText(
                      'Flicker Frenzy',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    FlickerAnimatedText(
                      'Night Vibes On',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    FlickerAnimatedText(
                      "C'est La Vie !",
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Flash Chat',
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            SizedBox(
              height: 40,
            ),
            RegisterWidget(
              title: 'Sign In',
              onTap: () {
                // context.go('/sign_in_page');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            RegisterWidget(
              title: 'Sign Up',
              containerColor: Color(0xff2571B6),
              onTap: () {
                // context.go('/sign_up_page');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
