import 'dart:async';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/helper/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? introStatus;

  void initState() {
    super.initState();
    bool isLogin = FireAuthHelper.fireAuthHelper.checkUser();
    Timer(
      Duration(seconds: 3),
      () => Get.offAllNamed(introStatus == false || introStatus == null
          ? 'intro'
          : isLogin == false
              ? 'signIn'
              : 'dash'),
    );
    data();
  }

  Future<void> data() async {
    ShareHelper shr= ShareHelper();
    introStatus = await shr.getIntroStatus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Lottie.asset('assets/json/Animation - 1710385913014.json',
              height: 120),
        ),
      ),
    );
  }
}
