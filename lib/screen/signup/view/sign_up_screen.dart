import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/constant.dart';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:chat_firebase_miner/utils/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/Sign up-rafiki.png",
                    height: 240,
                  ),
                  Text(
                    registrationtitle,
                    style: txtBold18,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    registrationdec,
                    style: txtBook14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: name,
                    iconData: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: email,
                    controller: txtEmail,
                    iconData: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: password,
                    controller: txtPassword,
                    iconData: Icons.password,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: confirmpassword,
                    iconData: Icons.password,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      String msg = await FireAuthHelper.fireAuthHelper.singUp(
                          email: txtEmail.text, password: txtPassword.text);
                      Get.back();
                      Get.snackbar(msg, "");
                    },
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(50)),
                      child: const Center(
                        child: Text(
                          registrationbutton,
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
      ),
    );
  }
}
