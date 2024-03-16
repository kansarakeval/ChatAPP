import 'package:chat_firebase_miner/utils/helper/share_helper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Introduction page",
              image: Image.asset("assets/img/Group discussion-pana.png"),
              body: "welcome to the chat application",
            ),
            PageViewModel(
                title: "Introduction page",
                image: Image.asset("assets/img/Messaging-amico.png"),
                body: "welcome to the chat diary"
            ),
            PageViewModel(
                title: "Introduction page",
                image: Image.asset("assets/img/Instagram Video Streaming-pana.png"),
                body: "stay connected with your friends and family"
            ),
          ],
          showDoneButton: true,
          onDone: (){
            ShareHelper shr = ShareHelper();
            shr.setIntroStatus();
            Navigator.pushReplacementNamed(context, 'contact');
          },
          done: Text("Done"),
          next: Text("Next"),
        ),
      ),
    );
  }
}
