import 'dart:convert';
import 'package:autos_dealership/login.dart';
import 'package:flutter/material.dart';
import 'navigationbar.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey1 = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  bool isValid1 = false;
  TextEditingController lastnameController = TextEditingController();
  bool isValid2 = false;
  TextEditingController emailController = TextEditingController();
  bool isValid3 = false;
  TextEditingController passwordController = TextEditingController();
  bool isValid4 = false;
  TextEditingController confpasswordController = TextEditingController();
  bool isValid5 = false;

  void signup (String first_name, last_name, email , password, password_confirmation ) async {

    try{

      Response response = await post(
          Uri.parse('http://192.168.1.39:8000/api/register-user'),
          body: {
            'first_name' : first_name,
            'last_name' : last_name,
            'email' : email,
            'password' : password,
            'password_confirmation' : password_confirmation,
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data);
        print('Signup successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.075, bottom: MediaQuery.of(context).size.height*0.03),
                  child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Image.asset("assets/Logo1.png",
                          alignment: Alignment.topCenter),
                    ),
                  ),
                ),
                Text(
                    "Signup",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,foreground: Paint()..shader = linearGradient1)
                ),
                Text(
                    "Sign up to continue!",
                    style: TextStyle(color: Colors.grey)
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 15, left: 35,),
                          child: Center(
                            child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text('First Name',
                                    style: TextStyle(fontSize: 20,foreground: Paint()..shader = linearGradient1, fontWeight: FontWeight.bold))
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35, right: 20),
                          child: TextFormField(
                            controller: firstnameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter First Name',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color:Color(0xFFFF1000))
                                )
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            child: Center(
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text('Last Name',
                                      style: TextStyle(
                                          fontSize: 20,foreground: Paint()..shader = linearGradient1,
                                          fontWeight:
                                          FontWeight.bold))),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 40),
                            child: TextFormField(
                              controller: lastnameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                //labelText: 'Email'
                                  hintText: 'Enter Last Name',
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color:Color(0xFF2508FF) )
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 35),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Email',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient2))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    controller: emailController,
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
                        hintText: 'username@gmail.com',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFFFF1000))
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, top: 15.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Password',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient2))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (PassCurrentValue){
                      RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      var passNonNullValue=PassCurrentValue??"";
                      if(passNonNullValue.isEmpty){
                        return ("Password is required");
                      }
                      else if(passNonNullValue.length<8){
                        return ("Password must be consist of 8 characters");
                      }
                      else if(!regex.hasMatch(passNonNullValue)){
                        return ("Password should contain upper,lower,digit and Special character ");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: '********',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF2508FF) )
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35, top: 15.0),
                  child: Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Confirm Password',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient2))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35),
                  child: TextFormField(
                    controller: confpasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (PassCurrentValue){
                      RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      var passNonNullValue=PassCurrentValue??"";
                      if(passNonNullValue.isEmpty){
                        return ("Confirm Password is required");
                      }
                      else if(PassCurrentValue!= passwordController.text){
                        return ("Not match with password");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: '********',
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF1000) )
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.35),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                    },
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                          foreground: Paint()..shader = linearGradient1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,bottom: MediaQuery.of(context).size.height*0.02),
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
                        if (_formKey1.currentState!.validate()) {
                          signup
                            (firstnameController.text.toString(),
                            lastnameController.text.toString(),
                            emailController.text.toString(),
                            passwordController.text.toString(),
                            confpasswordController.text.toString(),
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Navigation()));
                        }
                        else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Something went wrong')),
                          );
                        }

                      },
                      child: Text(
                        'SignUp',
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
