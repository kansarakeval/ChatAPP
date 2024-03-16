import 'package:chat_firebase_miner/screen/setting/controller/setting_controller.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/constant.dart';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/helper/firedb_helper.dart';
import 'package:chat_firebase_miner/utils/helper/share_helper.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
            style: TextStyle(color: Colors.white),
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
                    gradient: LinearGradient(colors: [Colors.white24,Colors.black12,]),
                    borderRadius: BorderRadius.circular(20)),
                child: StreamBuilder(
                  stream: FireDbHelper.fireDbHelper.getProfileData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      DocumentSnapshot ds = snapshot.data!;
                      Map m1 = ds.data() as Map;
                      return Column(
                        children: [
                          m1['image'] == null
                              ? CircleAvatar(
                                  radius: 50,
                                  child: Text(
                                      m1['name'].toUpperCase().substring(0, 1)),
                                )
                              : CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage("${m1['image']}"),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${m1['name']}",
                            style: txtBold18,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${m1['mobile']}",
                            style: txtMedium14,
                          ),
                        ],
                      );
                    }
                    return const CircularProgressIndicator();
                  },
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
