import 'package:chat_firebase_miner/screen/setting/controller/setting_controller.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/constant.dart';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/helper/firedb_helper.dart';
import 'package:chat_firebase_miner/utils/helper/share_helper.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController settingController=Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            setting,
            style: GoogleFonts.robotoSlab(color: Colors.white)
          ),
          centerTitle: true,
          backgroundColor: blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.sizeOf(context).height * 0.28,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(20)),
                child:  Column(
                  children: [
                    FireDbHelper.fireDbHelper.myProfileData.image== null
                        ? CircleAvatar(
                      radius: 50,
                      child: Text(
                          "${FireDbHelper.fireDbHelper.myProfileData.name}"
                                    .toUpperCase().substring(0, 1)),

                    )
                        : CircleAvatar(
                      radius: 50,
                      backgroundImage:
                      NetworkImage("${FireDbHelper.fireDbHelper.myProfileData.image}"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${FireDbHelper.fireDbHelper.myProfileData.name}",
                      style: txtBold18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${FireDbHelper.fireDbHelper.myProfileData.mobile}",
                      style: txtMedium14,
                    ),
                  ],
                ),
              ),
              ListTile(
                onTap: () async {
                  Get.toNamed('profile');
                },
                leading: Icon(Icons.person),
                title: Text(
                  profile,
                  style: txt20,
                ),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                onTap: () async {
                  await FireAuthHelper.fireAuthHelper.signOut();
                  Get.offAllNamed('signIn');
                },
                leading: Icon(Icons.logout),
                title: Text(
                  LogOut,
                  style: txt20,
                ),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                onTap: () async {
                  await FireDbHelper.fireDbHelper.userDelete(FireAuthHelper.fireAuthHelper.user!.uid);
                  await FireAuthHelper.fireAuthHelper.userAccountDelete();
                  Get.offAllNamed('signIn');
                },
                leading: Icon(Icons.delete),
                title: Text(
                  delete,
                  style: txt20,
                ),
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.dark_mode_outlined),
                title: Text(
                  theme,
                  style: txt20,
                ),
                trailing: Obx(
                  () => Switch(
                    value: settingController.islight.value,
                    onChanged: (value) {
                      ShareHelper shr = ShareHelper();
                      shr.setTheme(value);
                      settingController.changeTheme();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
