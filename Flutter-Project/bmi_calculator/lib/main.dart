import 'package:flutter/material.dart';
import 'dart:math';

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
    return const MaterialApp(
      title: 'EMI_App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var principal = TextEditingController();
  var rate = TextEditingController();
  var time = TextEditingController();
  var isvisible = false;
  var value = 0.0;

  double calculateEMI(
      double principal, double interestRate, int durationInMonths) {
    // Handle edge cases (negative values)
    if (principal <= 0 || interestRate <= 0 || durationInMonths <= 0) {
      throw ArgumentError(
          "Principal, interest rate, and duration must be positive values");
    }

    // Convert interest rate to monthly rate
    double monthlyInterestRate = interestRate / (12 * 100);

    // Calculate EMI using the formula
    return (principal *
            monthlyInterestRate *
            pow(1 + monthlyInterestRate, durationInMonths)) /
        (pow(1 + monthlyInterestRate, durationInMonths) - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('EMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    'Principal Amount',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      // borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ('Enter Principal'),
                    ),
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: principal,
                  ),
                  clipBehavior: Clip.hardEdge,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    'Rate Percentage',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      // borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ('Enter Rate'),
                    ),
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: rate,
                  ),
                  clipBehavior: Clip.hardEdge,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    'Time Period',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  height: 50,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      // borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: ('No of Month'),
                    ),
                    cursorHeight: 30,
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    controller: time,
                  ),
                  clipBehavior: Clip.hardEdge,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                    visible: isvisible,
                    child: Container(
                      height: 50,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(value.toString()),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      // borderRadius: BorderRadius.circular(5)
                      ),
                  child: ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      var v = calculateEMI(double.parse(principal.text),
                          double.parse(rate.text), int.parse(time.text));
                      setState(() {
                        value = v;
                        isvisible = true;
                      });
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      // border: Border.all(),
                      // borderRadius: BorderRadius.circular(5)
                      ),
                  child: ElevatedButton(
                    style: ButtonStyle(),
                    child: Text('Reset'),
                    onPressed: () {
                      value = 0;
                      setState(() {
                        isvisible = false;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
