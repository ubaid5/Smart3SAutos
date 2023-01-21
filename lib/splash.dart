import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'walkthrough.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => setState(() {
          Get.offAll(Walkthrough());
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2, right: MediaQuery.of(context).size.width*0.2),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset("assets/Logo1.png",height: 300,width: 300,),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text("Shareef Motors",style: TextStyle(
                foreground: Paint()..shader = linearGradient1,
                fontSize: 40,
                fontWeight: FontWeight.bold), )
          ),
        ],
      ),
    );
  }
}
final Shader linearGradient1 = LinearGradient(
  colors: <Color>[Color(0xFFFF1000), Color(0xFF2508FF)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
final Shader linearGradient2 = LinearGradient(
  colors: <Color>[Color(0xFF2508FF), Color(0xFFFF1000)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

