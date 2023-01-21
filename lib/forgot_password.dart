import 'package:autos_dealership/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'welcome.dart';

class Password extends StatefulWidget {
  const Password({Key? key}) : super(key: key);

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController login_email = new TextEditingController();
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100, bottom: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      child: Image.asset("assets/Logo1.png",
                          alignment: Alignment.topCenter),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left:30,right:20),
                  child: Text("Enter your registered email address. We'll send you an email to reset your password ",
                    style: TextStyle(
                        foreground: Paint()..shader = linearGradient1,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 35),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Email',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient1))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    controller: login_email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Email is invalid, must contain @';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      //labelText: 'Email'
                        hintText: 'username@gmail.com',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFFFF1000))
                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only( left:200),
                  child: MaterialButton(
                    onPressed:
                        () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));},
                    child: Text(
                      'Back to login!',
                      style: TextStyle(
                          foreground: Paint()..shader = linearGradient1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 50,bottom: 100),
                    height: 50,
                    width: 280,
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
                        if (_formKey.currentState!.validate())
                        {Get.offAll(WelcomeScreen());
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Something went wrong')),
                          );
                        }
                      },
                      child: Text(
                        'Submit',
                        style:
                        TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
