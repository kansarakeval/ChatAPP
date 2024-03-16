import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/constant.dart';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:chat_firebase_miner/utils/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                  Image.asset("assets/img/Sign in-pana.png",height: 200,),
                  Text(
                    logintitle,
                    style: txtBold18,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    logindec,
                    style: txtBook14,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    label: email,
                    controller: txtEmail,
                    iconData: Icons.person_outline,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      forgetpass,
                      style: txtMedium14,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          onTap: () async {
                            String msg=await FireAuthHelper.fireAuthHelper.googleSignIn();
                            Get.snackbar(msg, "Login success fully");
                            if(msg=="success")
                            {
                              FireAuthHelper.fireAuthHelper.checkUser();
                              Get.offAllNamed('profile');
                            }
                          },
                          child: socialContainer("assets/img/google.png")),
                      socialContainer("assets/img/apple-logo.png"),
                      socialContainer("assets/img/facebook.png"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      String msg = await FireAuthHelper.fireAuthHelper.singIn(
                          email: txtEmail.text, password: txtPassword.text);
                      Get.snackbar(msg, "");
                      if (msg == "success") {
                        FireAuthHelper.fireAuthHelper.checkUser();
                        Get.offAllNamed('profile');
                      }
                    },
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Center(
                          child: Text(
                        loginbutton,
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                      onTap: () {
                        Get.toNamed('signUp');
                      },
                      child: Text(
                        createNewAccount,
                        style: txtMedium14,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container socialContainer(String path) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 48,
      width: 48,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Image.asset(
        path,
        height: 45,
        width: 45,
      ),
    );
  }
}
