import 'package:chat_firebase_miner/screen/signin/view/sign_in_screen.dart';
import 'package:chat_firebase_miner/screen/signup/view/sign_up_screen.dart';
import 'package:chat_firebase_miner/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const SplashScreen(),
  'signIn': (context) => const SignInScreen(),
  'signUp':(context) => const SignUpScreen(),
};
