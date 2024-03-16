import 'dart:io';
import 'package:chat_firebase_miner/screen/profile/controller/profile_controller.dart';
import 'package:chat_firebase_miner/utils/color.dart';
import 'package:chat_firebase_miner/utils/helper/fireauth_helper.dart';
import 'package:chat_firebase_miner/utils/helper/firedb_helper.dart';
import 'package:chat_firebase_miner/utils/helper/storage.dart';
import 'package:chat_firebase_miner/utils/widget/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/services/notification_services.dart';
import '../Model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController controller = Get.put(ProfileController());
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBio = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  String? image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile",style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: blue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: StreamBuilder(
          stream: FireDbHelper.fireDbHelper.getProfileData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              DocumentSnapshot? ds = snapshot.data;
              Map? data = ds?.data() as Map?;
              if (data != null) {
                txtName.text = data['name'];
                txtEmail.text = data['email'];
                txtMobile.text = data['mobile'];
                image = data['image'];
                txtAddress.text = data['address'];
                txtBio.text = data['bio'];
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Obx(
                            () =>
                        controller.imagePath.value == null && image == null
                            ?  CircleAvatar(
                          radius: 50,
                        )
                            : controller.imagePath.value != null
                            ? CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(
                              File(controller.imagePath.value!)),
                        )
                            : CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(image!),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? file = await picker.pickImage(
                                source: ImageSource.gallery);
                            controller.imagePath.value = file?.path;
                          },
                          child: const Text("Image",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(blue))),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        label: "Name",
                        controller: txtName,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        label: "Mobile",
                        controller: txtMobile,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        label: "Bio",
                        controller: txtBio,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        label: "Email",
                        controller: txtEmail,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextField(
                        label: "Address",
                        controller: txtAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String? path;
                          if(controller.imagePath.value!=null)
                          {
                            path = await FireStorage.fireStorage.uploadProfile(controller.imagePath.value!);
                          }
                          ProfileModel p1 = ProfileModel(
                              uid: FireAuthHelper.fireAuthHelper.user!.uid,
                              name: txtName.text,
                              mobile: txtMobile.text,
                              bio: txtBio.text,
                              email: txtEmail.text,
                              address: txtAddress.text,
                              image: controller.imagePath.value!=null?path:image,
                              notificationToken:
                              NotificationServices.services.token);
                          FireDbHelper.fireDbHelper.addProfileData(p1);
                          Get.offAllNamed('dash');
                        },
                        child: const Text("Save",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(blue),),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
