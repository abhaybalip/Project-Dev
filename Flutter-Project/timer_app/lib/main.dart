import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int hour = 0;
  int minute = 0;
  int second = 0;
  bool isRunning = false;

  Timer? timer;

  void _startTimer() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        second++;
        if (second >= 60) {
          second = 0;
          minute++;
        }
        if (minute >= 60) {
          minute = 0;
          hour++;
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      isRunning = false;
    });
    if (timer?.isActive ?? false) {
      timer!.cancel();
    }
  }

  void _resetTimer() {
    setState(() {
      hour = 0;
      minute = 0;
      second = 0;
      isRunning = false;
      if (timer?.isActive ?? false) {
        timer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Counter App',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400, // Subtle border
                    width: 2.0, // Adjust border thickness as needed
                  ),
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200
                          .withOpacity(0.2), // Light shadow for depth
                      blurRadius:
                          5.0, // Adjust blur radius for softer or sharper shadows
                      spreadRadius: 0.0, // No spreading prevents shadow bleed
                      offset: const Offset(
                          2.0, 2.0), // Slight offset for subtle elevation
                    ),
                  ],
                ),
                alignment: Alignment.center,
                height: 100,
                width: 300,
                child: Text(
                  '$hour : $minute : $second',
                  style: const TextStyle(
                    fontSize: 48.0, // Large font size for readability
                    fontWeight: FontWeight.bold, // Emphasize time display
                    color: Colors.black87, // Darker text for better contrast
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Add spacing between elements
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: isRunning
                        ? null
                        : _startTimer, // Disable Start when running
                    child: Text(isRunning
                        ? 'Pause'
                        : 'Start'), // Change text based on state
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: isRunning
                        ? _stopTimer
                        : null, // Disable Stop when not running
                    child: const Text('Stop'),
                  ),
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: () => _resetTimer(),
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
