import 'package:flutter/material.dart';

class BMI_Calculator extends StatefulWidget {
  const BMI_Calculator({Key? key}) : super(key: key);

  @override
  _BMI_CalculatorState createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<BMI_Calculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double? height,weight,bmi;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void calculateBMI() {
    if (height != null && weight != null && height! > 0 && weight! > 0) {
      setState(() {
        bmi = weight! / ((height! / 100) * (height! / 100));
      });
    } else {
      setState(() {
        bmi = null;
      });
    }
  }

  void resetFields() {
    setState(() {
      heightController.clear();
      weightController.clear();
      height = null;
      weight = null;
      bmi = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text("Enter Height (cm)"),
          ),
          Container(
            height: 75,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                try {
                  height = double.parse(value);
                } catch (e) {
                  height = null;
                }
              },
            ),
          ),
          Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Text("Enter Weight (kg)"),
          ),
          Container(
            height: 75,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                try {
                  weight = double.parse(value);
                } catch (e) {
                  weight = null;
                }
              },
            ),
          ),
          Container(
            child: ElevatedButton(
              child: Text('Calculate BMI'),
              onPressed: () {
                calculateBMI();
              },
            ),
          ),
          if (bmi != null)
            Text(
              'BMI: $bmi',
              style: TextStyle(fontSize: 20),
            ),
          Container(
            child: ElevatedButton(
              child: Text('Reset'),
              onPressed: () {
                resetFields();
              },
            ),
          ),
        ],
      ),
    );
  }
}