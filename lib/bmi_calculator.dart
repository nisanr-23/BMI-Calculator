import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(style: const TextStyle(color: Colors.white),'BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade200,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Height (in inches)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),)
              ),

            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (in kg)',border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), // Adjust the border radius as needed
                borderSide: BorderSide(
                  color: Colors.blue, // Adjust the border color
                  width: 2.0, // Adjust the border width
                ),)),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 16.0),
            Text('Your BMI is: ',style: TextStyle(fontSize: 20),),
            Container(
              
              margin: EdgeInsets.all(10),
              height: MediaQuery.sizeOf(context).height*.5,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black12,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$bmiResult",style: TextStyle(fontSize: 60),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      setState(() {
        bmiResult = weight / ((height / 39.37) * (height / 39.37));
      });
    }
  }
}