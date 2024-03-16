// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatelessWidget {
//   TextEditingController? controller;
//   Color? labelColor;
//   String? label;
//   Gradient? gradient;
//   IconData? iconData;
//
//   CustomTextField({this.controller, this.label, this.labelColor, this.gradient,this.iconData});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: iconData != null ? Icon(iconData): null,
//         fillColor: Colors.grey.shade300,
//         filled: true,
//         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//         labelText: label ?? "",
//         labelStyle: TextStyle(
//           color: labelColor ?? Colors.black,
//         ),
//         contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  Color? labelColor;
  String? label;
  Gradient? gradient;
  IconData? iconData;

  CustomTextField({this.controller, this.label, this.labelColor, this.gradient,this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: iconData != null ? Icon(iconData): null,
        fillColor: Colors.grey.shade300,
        filled: true,
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        labelText: label ?? "",
        labelStyle: TextStyle(
          color: labelColor ?? Colors.black,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
