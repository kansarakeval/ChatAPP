import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  Color? labelColor;
  String? label;
  Gradient? gradient;

  CustomTextField({this.controller, this.label, this.labelColor, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,border: Border.all(),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label ?? "",
          labelStyle: TextStyle(
            color: labelColor ?? Colors.black,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
}
