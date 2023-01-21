import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'welcome.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        pathImage: "assets/buy.png",
        description:
        "Buy a best car from here",
        styleDescription: TextStyle(
          //color: Colors.black,
          foreground: Paint()..shader = linearGradient1,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginDescription:
        EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0, bottom: 40.0),
      ),
    );

    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        pathImage: "assets/spareparts.jpg",
        description:
        "Buy Spare Parts of car from here",
        styleDescription: TextStyle(
          foreground: Paint()..shader = linearGradient1,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginDescription:
        EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0, bottom: 40.0),
      ),
    );
    slides.add(
      new Slide(
        backgroundColor: Colors.white,
        pathImage: "assets/service.jpg",
        description:
        "Service a car from here",
        styleDescription: TextStyle(
          foreground: Paint()..shader = linearGradient1,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        marginDescription:
        EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0, bottom: 40.0),
      ),
    );
  }


  void onDonePress() {
    Get.offAll(WelcomeScreen());
  }

  void onNextPress() {
    print("onNextPress caught");
  }

  Widget renderNextBtn() {
    return Text(
      "NEXT >",
      style: TextStyle( foreground: Paint()..shader = linearGradient1, fontWeight: FontWeight.bold,fontSize: 18),
    );
  }

  Widget renderDoneBtn() {
    return Text(
      "FINISH",
      style: TextStyle( foreground: Paint()..shader = linearGradient1, fontWeight: FontWeight.bold,fontSize: 18),
    );
  }

  Widget renderSkipBtn() {
    return Text(
      "SKIP >>",
      style: TextStyle( foreground: Paint()..shader = linearGradient1, fontWeight: FontWeight.bold,fontSize: 18),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle();
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      //onNextPress: this.onNextPress,

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,

      // Dot indicator
      colorDot: Color(0xFFFF1000),
      colorActiveDot: Color(0xFF2508FF),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
final Shader linearGradient1 = LinearGradient(
  colors: <Color>[Color(0xFFFF1000), Color(0xFF2508FF)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
final Shader linearGradient2 = LinearGradient(
  colors: <Color>[Color(0xFF2508FF), Color(0xFFFF1000)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
