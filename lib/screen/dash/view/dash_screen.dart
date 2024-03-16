import 'package:chat_firebase_miner/screen/chat/view/chat_screen.dart';
import 'package:chat_firebase_miner/screen/contact/view/contact_screen.dart';
import 'package:chat_firebase_miner/screen/messages/view/messages_screen.dart';
import 'package:chat_firebase_miner/screen/setting/view/setting_screen.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/dash_controller.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  List<Widget> screen = [
    const MessageScreen(),
    const ContactScreen(),
    const SettingScreen(),
  ];

  DashController controller = DashController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => PageView(
            controller: controller.pageController.value,
            onPageChanged: (value) {
              controller.screenIndex.value = value;
            },
            children: screen,
          ),
        ),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            indicatorColor: blue,
            selectedIndex: controller.screenIndex.value,
            onDestinationSelected: (value) {
              controller.pageController.value.animateToPage(value,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn);
              controller.screenIndex.value = value;
            },
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.chat_outlined), label: "Chat"),
              NavigationDestination(
                  icon: Icon(Icons.person_add_alt), label: "Contact"),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined), label: "Setting"),
            ],
            animationDuration: const Duration(microseconds: 1000),
          ),
        ),
      ),
    );
  }
}
