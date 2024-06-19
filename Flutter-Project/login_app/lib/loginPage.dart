import 'package:flutter/material.dart';
import 'package:login_app/dataBase.dart';

loginPage(context) {
  var username = TextEditingController(), password = TextEditingController();
  var option = false;

  showConfirmationDialog(BuildContext context) {
    final yesButton = TextButton(
      child: const Text("Yes"), // Optional: More specific message
      onPressed: () {
        option = true;
        Navigator.pop(context);
      },
    );

    final noButton = TextButton(
      child: const Text("No"),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Enter ?"),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text('Enter login details'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('username'),
                Container(
                  height: 20,
                  width: 150,
                  child: TextField(
                    controller: username,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('password'),
                Container(
                  height: 20,
                  width: 150,
                  child: TextField(
                    controller: password,
                  ),
                )
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (username.text !='' && password.text != '') {
                    final user = User(username.text, password.text);
                    Navigator.pushNamed(context,'/logedin');
                  } else {
                    final button = ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('ok'));
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Enter Details !'),
                              actions: [button],
                            ));
                  }
                },
                child: Text('Login'))
          ],
        )
      ],
    )),
  );
}
