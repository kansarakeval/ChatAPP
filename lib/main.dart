import 'package:chat_firebase_miner/screen/setting/controller/setting_controller.dart';
import 'package:chat_firebase_miner/utils/app_routes.dart';
import 'package:chat_firebase_miner/utils/app_theme.dart';
import 'package:chat_firebase_miner/utils/services/notification_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationServices.services.getFCM();
  FirebaseMessaging.onBackgroundMessage(
      NotificationServices.services.firebaseMessagingBackgroundHandler);

  NotificationServices.services.initNotification();
  SettingController settingController=Get.put(SettingController());
  settingController.changeTheme();
  runApp(
    Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: settingController.islight.value?lightTheme:darkTheme,
        routes: app_routes,
      ),
    ),
  );
}
