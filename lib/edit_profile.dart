import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navigationbar.dart';
import 'account.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  TextEditingController reg_email = new TextEditingController();
  bool isValid1 = false;
  TextEditingController pass = new TextEditingController();
  bool isValid2 = false;
  TextEditingController confirm_pass = new TextEditingController();
  bool isValid3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:
        Align(
          alignment: Alignment.center,
          child: Text(
            "Edit Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2508FF),
        elevation: 0,
      ),
      body:Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.05),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        // backgroundImage: AssetImage("assets/dp.jpg"),
                        radius: 65,
                      ),
                    ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 65, left: 35,),
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
                              // keyboardType: TextInputType.text,
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'This field is required';
                              //   }
                              //   return null;
                              // },
                              decoration: InputDecoration(
                                //labelText: 'Email'
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
                              padding: const EdgeInsets.only(top: 65, left: 15),
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
                              padding: EdgeInsets.only(left: 15, right: 35),
                              child: TextFormField(
                                // keyboardType: TextInputType.text,
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return 'This field is required';
                                //   }
                                //   return null;
                                // },
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
                    padding: const EdgeInsets.only(top: 20, left: 35),
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
                      // controller: reg_email,
                      // keyboardType: TextInputType.emailAddress,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Email is required';
                      //   }
                      //   if (!value.contains('@')) {
                      //     return 'Email is invalid, must contain @';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        //labelText: 'Email'
                          hintText: 'Enter Email',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color(0xFFFF1000))
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35, top: 20),
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
                      // controller: _pass,
                      // obscureText: true,
                      // keyboardType: TextInputType.visiblePassword,
                      // validator: (PassCurrentValue){
                      //   RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      //   var passNonNullValue=PassCurrentValue??"";
                      //   if(passNonNullValue.isEmpty){
                      //     return ("Password is required");
                      //   }
                      //   else if(passNonNullValue.length<8){
                      //     return ("Password must be consist of 8 characters");
                      //   }
                      //   else if(!regex.hasMatch(passNonNullValue)){
                      //     return ("Password should contain upper,lower,digit and Special character ");
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        //labelText: 'Password',
                          hintText: '********',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Color(0xFF2508FF) )
                          )
                      ),
                    ),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left:30,top: 50,bottom: 100),
                    height: 40,
                    width: 130,
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
                      onPressed: ()
                        {Get.to(Account());
                    },
                    child: Text(
                      'Cancel',
                      style:
                      TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(right:30,top: 50,bottom: 100),
                    height: 40,
                    width: 130,
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
                      onPressed: ()
                       // if (_formKey1.currentState!.validate())
                        {Get.to(Navigation());
                        },
                      child: Text(
                        'Save',
                        style:
                        TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ]
             ),
          ]
        )
      )
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