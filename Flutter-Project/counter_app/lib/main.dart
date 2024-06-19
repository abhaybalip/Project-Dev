import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0; // Use 'int' for counter variable

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'counter_app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                child: Text(
                  '$count',
                ),
                height: 50,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: const Text('Inc'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count--;
                      });
                    },
                    child: const Text('Dec'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    child: const Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
