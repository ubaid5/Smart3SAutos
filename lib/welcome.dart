import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'select.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
           Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1, left:20),
            child:Text(
                "Buy a Car,",
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient2,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                ),
              ),
           ),
             Padding(
               padding: EdgeInsets.only(left:20 ),
               child: Text(
                "Service a Car",
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient1,
                    fontSize:40,
                    fontWeight: FontWeight.bold),
              ),
             ),
           Padding(
             padding: EdgeInsets.only(left:20,right:20),
             child: Text("or Buy Spare parts of a car",
                style: TextStyle(
                    foreground: Paint()..shader = linearGradient2,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
           ),
              Image.asset(
                "assets/car_driving.gif",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Align(alignment: Alignment.center,
              child: Container(
                //margin: EdgeInsets.only(top: 15,),
                height: MediaQuery.of(context).size.width*0.15,
                width: MediaQuery.of(context).size.width*0.75,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFF1000), Color(0xFF2508FF)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(40),
                ),
                child: MaterialButton(
                  onPressed: () {
                    {
                      Get.offAll(SelectPage());
                      }
                  },
                  child: Text(
                    'Get Started',
                    style:
                    TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.075),
                  ),
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

final Shader linearGradient1 = LinearGradient(
  colors: <Color>[Color(0xFFFF1000), Color(0xFF2508FF)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
final Shader linearGradient2 = LinearGradient(
  colors: <Color>[Color(0xFF2508FF), Color(0xFFFF1000)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));



