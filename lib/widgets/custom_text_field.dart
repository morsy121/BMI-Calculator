import 'package:bmicalc/constant/app_constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.hintText}) : super(key: key);
  String? hintText;
  TextEditingController? textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.0,
      child: TextField(
        controller: textEditingController,
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w300,
          color: accentHexColor,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w300,
                color: Colors.white)),
      ),
    );
  }
}
