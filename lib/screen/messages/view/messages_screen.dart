import 'package:chat_firebase_miner/screen/profile/Model/profile_model.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/helper/firedb_helper.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("${state.name}");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getProfile();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> getProfile() async {
    await FireDbHelper.fireDbHelper.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Text("Messages",
            style: GoogleFonts.robotoSlab(color: Colors.white)),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FireDbHelper.fireDbHelper.chatContact(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<ProfileModel> chatConact = [];
            QuerySnapshot? qs = snapshot.data;
            if (qs != null) {
              List<QueryDocumentSnapshot> qsList = qs.docs;
              for (var x in qsList) {
                List mainList = [];
                Map data = x.data() as Map;

                data.entries.forEach((e) {
                  mainList.add(e.value);
                });

                if (mainList[0]
                    .contains(FireAuthHelper.fireAuthHelper.user!.uid)) {
                  ProfileModel p1 = ProfileModel(
                    name: mainList[1][0],
                    uid: mainList[1][1],
                    image: mainList[1][2],
                    address: mainList[1][3],
                    bio: mainList[1][4],
                    email: mainList[1][5],
                    mobile: mainList[1][6],
                    notificationToken: mainList[1][7],
                    docId: x.id,
                  );
                  chatConact.add(p1);
                } else if (mainList[1]
                    .contains(FireAuthHelper.fireAuthHelper.user!.uid)) {
                  ProfileModel p1 = ProfileModel(
                    name: mainList[0][0],
                    uid: mainList[0][1],
                    image: mainList[0][2],
                    address: mainList[0][3],
                    bio: mainList[0][4],
                    email: mainList[0][5],
                    mobile: mainList[0][6],
                    notificationToken: mainList[0][7],
                    docId: x.id,
                  );
                  chatConact.add(p1);
                }
              }
            }
            return ListView.builder(
              itemCount: chatConact.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: Colors.white12
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.toNamed('chat', arguments: chatConact[index]);
                    },
                    leading: chatConact[index].image != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage("${chatConact[index].image}"),
                          )
                        : CircleAvatar(
                            radius: 30,
                            child: Text(
                              "${chatConact[index].name!.substring(0, 1)}",
                            ),
                          ),
                    title: Text(
                      "${chatConact[index].name}",
                      style: txtBold18,
                    ),
                    subtitle: Text(
                      "${chatConact[index].mobile}",
                      style: txtBook16,
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
