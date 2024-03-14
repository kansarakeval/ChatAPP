import 'package:chat_firebase_miner/screen/widget/custom_text_field.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/constant.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "$registrationtitle",
                  style: txtBold18,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "$registrationdec",
                  style: txtBook14,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(label: name),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(label: email,),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(label: password,),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(label: confirmpassword),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Center(
                      child: Text(
                        "$registrationbutton",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
