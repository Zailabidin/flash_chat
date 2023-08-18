import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/app/pages/auth/signinpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app/pages/auth/sign_up_page.dart';

import 'app/pages/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize

  runApp(const FlashChat());
//...
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'sign_in_page',
          builder: (BuildContext context, GoRouterState state) {
            return const SignInPage();
          },
        ),
        GoRoute(
          path: 'sign_up_page',
          builder: (BuildContext context, GoRouterState state) {
            return SignUpPage();
          },
        ),
        // GoRoute(
        //   path: 'home_page',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return  HomePage();
        //   },
        // ),
      ],
    ),
  ],
);

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
