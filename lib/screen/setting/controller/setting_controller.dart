import 'package:chat_firebase_miner/utils/helper/share_helper.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{
  RxBool islight = false.obs;

  void changeTheme() async {
    ShareHelper shr = ShareHelper();
    bool? istheme = await shr.getTheme();
    islight.value = istheme ?? false;
  }
}