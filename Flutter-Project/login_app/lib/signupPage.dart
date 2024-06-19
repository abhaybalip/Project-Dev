import 'package:flutter/material.dart';
import './dataBase.dart';

signupPage(context) {
  var usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      option = false;

  showConfirmationDialog(BuildContext context) {
    final yesButton = TextButton(
      child: const Text("Create Account"), // Optional: More specific message
      onPressed: () {
        Navigator.pop(context);
        option = true;
      },
    );

    final noButton = TextButton(
      child: const Text("No"),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Alert box"),
      actions: [yesButton, noButton],
    );

    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  return Scaffold(
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
        Container(
          child: Text('Welcome to signup page'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Username:'),
            Container(
              height: 25,
              width: 150,
              child: TextField(
                controller: usernameController,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Password:'),
            Container(
              height: 25,
              width: 150,
              child: TextField(
                controller: passwordController,
                obscureText: true,
              ),
            ),
          ],
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: () {
            if (usernameController.text.isEmpty ||
                passwordController.text.isEmpty) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Missing Details'),
                  content:
                      const Text('Please enter both username and password.'),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            } else {
              showConfirmationDialog(context);
              if (option) {
                final user =
                    User(usernameController.text, passwordController.text);
                DatabaseHelper().saveUser(user);

                Navigator.pushNamed(context, '/loggedin');
              }
              option = false;
            }
          },
        )
      ])));
}
