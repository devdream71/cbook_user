import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cbook_user/UI/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration (seconds: 2), (){
     Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNav()));
    });
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            SizedBox(
  width: 250.0,
  child: DefaultTextStyle(
    style: const TextStyle(
      fontSize: 30.0,
      fontFamily: 'Agne',
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText('Discipline is the best tool'),
        TypewriterAnimatedText('Design first, then code'),
        TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
        TypewriterAnimatedText('Do not test bugs out, design them out'),
      ],
      onTap: () {
        print("Tap Event");
      },
    ),
  ),
)
        ],
      ),
    );
  }
}