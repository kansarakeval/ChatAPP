import 'package:chat_firebase_miner/screen/profile/Model/profile_model.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/constant.dart';
import 'package:chat_firebase_miner/utils/helper/firedb_helper.dart';
import 'package:chat_firebase_miner/utils/text_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          contact,
          style: GoogleFonts.robotoSlab(color: Colors.white)
        ),
        centerTitle: true,
        backgroundColor: blue,
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: StreamBuilder(
        stream: FireDbHelper.fireDbHelper.getAllContact(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            List<ProfileModel> contactData = [];
            QuerySnapshot? qs = snapshot.data;
            if (qs != null) {
              List<QueryDocumentSnapshot> qsList = qs.docs;

              for (var x in qsList) {
                Map m1 = x.data() as Map;
                ProfileModel p1 = ProfileModel(
                    uid: m1['uid'],
                    image: m1['image'],
                    name: m1['name'],
                    bio: m1['bio'],
                    email: m1['email'],
                    mobile: m1['mobile'],
                    address: m1['address'],
                    notificationToken: m1['notificationToken']);

                contactData.add(p1);
              }
            }

            return ListView.builder(
              itemCount: contactData.length,
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
                      Get.toNamed('chat', arguments: contactData[index]);
                    },
                    leading: contactData[index].image != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage("${contactData[index].image}"),
                          )
                        : CircleAvatar(
                            radius: 30,
                            child: Text(
                              "${contactData[index].name!.toUpperCase().substring(0, 1)}",
                            ),
                          ),
                    title: Text(
                      "${contactData[index].name}",
                      style: txtBold18,
                    ),
                    subtitle: Text(
                      "${contactData[index].mobile}",
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
