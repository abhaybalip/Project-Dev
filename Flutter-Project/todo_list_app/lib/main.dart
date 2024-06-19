import 'package:flutter/material.dart';
import 'package:todo_list_app/Assets/ListBox.dart';

// import 'Assets/ListItem.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todolist_app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ToDo List',
          style: TextStyle(fontSize: 50, wordSpacing: 5),
        ),
      ),
      body: Center(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListBox(),
            ],
          ),
        ),
      ),
    );
  }
}