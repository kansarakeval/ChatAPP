import 'package:chat_firebase_miner/screen/chat/view/chat_screen.dart';
import 'package:chat_firebase_miner/screen/dash/view/dash_screen.dart';
import 'package:chat_firebase_miner/screen/intro/view/intro_screen.dart';
import 'package:chat_firebase_miner/screen/messages/view/messages_screen.dart';
import 'package:chat_firebase_miner/screen/profile/view/profile_screen.dart';
import 'package:chat_firebase_miner/screen/signin/view/sign_in_screen.dart';
import 'package:chat_firebase_miner/screen/signup/view/sign_up_screen.dart';
import 'package:chat_firebase_miner/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routes = {
  '/': (context) => const SplashScreen(),
  'intro':(context) => IntroScreen(),
  'signIn': (context) => const SignInScreen(),
  'signUp': (context) => const SignUpScreen(),
  'profile': (context) => const ProfileScreen(),
  'dash': (context) => const DashScreen(),
  'chat':(context) => const ChatScreen(),
  'messages':(context) => const MessageScreen(),
};
