import 'package:flutter/material.dart';
import 'navigationbar.dart';
import 'forgot_password.dart';
import 'signup.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController login_email = new TextEditingController();
  bool isValid = false;
  TextEditingController _password = TextEditingController();
  bool isValid1 = false;


  void login(String email , password) async {

    try{
      http.Response response = await http.post(
          Uri.parse('http://192.168.1.39:8000/api/login-user'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data);
        print('Login successfully');

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
                key: _formKey,
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
                          "Login",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,foreground: Paint()..shader = linearGradient1)
                      ),
                      Text(
                          "Sign in to continue!",
                          style: TextStyle(color: Colors.grey)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 35),
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
                          controller: _password,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            else if(value.length<8){
                              return ("Password must be consist of 8 characters");
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
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.5),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => Password()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                foreground: Paint()..shader = linearGradient1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.4),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
                          },
                          child: Text(
                            'Have\'nt any account yet?',
                            style: TextStyle(
                                foreground: Paint()..shader = linearGradient1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,bottom: MediaQuery.of(context).size.height*0.01),
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
                                if (_formKey.currentState!.validate()){
                                  login(login_email.text.toString(),_password.text.toString());
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
                              'Login',
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
