import 'package:flutter/material.dart';
import 'package:login_app/loggedIn.dart';
import 'package:login_app/signupPage.dart';
import './loginPage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login_app',
      initialRoute: '/',
      routes: {
        '/': (context) => homePage(context),
        '/login': (context) => loginPage(context),
        '/signup': (context) => signupPage(context),
        '/loggedin': (context) => loggedIn(context),
      },
    );
  }
}

homePage(context) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('Welcome to home page'),
          ),
          InkWell(
            child: Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          InkWell(
            child: Text('SignUP'),
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
          )
        ],
      ),
    ),
  );
}
