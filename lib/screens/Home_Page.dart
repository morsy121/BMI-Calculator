import 'package:bmicalc/constant/app_constants.dart';
import 'package:bmicalc/widgets/custom_text_field.dart';
import 'package:bmicalc/widgets/left_bar.dart';
import 'package:bmicalc/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _bmiResult = 0;
  String _textResult = "";
  CustomTextField height = CustomTextField(hintText: "Height");
  CustomTextField weight = CustomTextField(hintText: "Weight");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                height,
                weight,
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double h = double.parse(height.textEditingController!.text);
                double w = double.parse(weight.textEditingController!.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult > 25) {
                    _textResult = "You are over the weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = 'You have a normal weight';
                  } else {
                    _textResult = 'You are under the weight';
                  }
                });
              },
              child: Container(
                child: Text(
                  'Calculat',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: accentHexColor),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(fontSize: 20, color: accentHexColor),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 70),
            const SizedBox(
              height: 20,
            ),
            const LeftBar(barWidth: 40),
            const SizedBox(
              height: 20,
            ),
            const RightBar(barWidth: 70),
            const SizedBox(
              height: 50,
            ),
            const RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
