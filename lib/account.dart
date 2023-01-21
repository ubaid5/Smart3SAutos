import 'dart:io';
import 'package:autos_dealership/common_questions.dart';
import 'package:autos_dealership/term_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'payment.dart';
import 'package:get/get.dart';
import 'setting.dart';
import 'searchbar.dart';
import 'edit_profile.dart';
import 'login.dart';

enum Availability { loading, available, unavailable }

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  final InAppReview _inAppReview = InAppReview.instance;

  String _appStoreId = '';
  String _microsoftStoreId = '';
  Availability _availability = Availability.loading;

  @override
  void initState() {
    super.initState();

    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        setState(() {
          _availability = isAvailable && !Platform.isAndroid
              ? Availability.available
              : Availability.unavailable;
        });
      } catch (_) {
        setState(() => _availability = Availability.unavailable);
      }
    });
  }

  void _setAppStoreId(String id) => _appStoreId = id;
  void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

  Future<void> _requestReview() => _inAppReview.requestReview();

  Future<void> _openStoreListing() => _inAppReview.openStoreListing(
    appStoreId: _appStoreId,
    microsoftStoreId: _microsoftStoreId,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){Get.to(Login());},
        //     icon: Icon(Icons.arrow_back_ios)
        // ),
        toolbarHeight: MediaQuery.of(context).size.height*0.09,
        title:
        Align( alignment: Alignment.center,
        child: Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF2508FF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    // backgroundImage: AssetImage("assets/dp.jpg"),
                    radius: 40,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.035),
                    Text(
                      "Username",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    Text(
                      "username@gmail.com",
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.left,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.03),
            Align(alignment: Alignment.center,
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width*0.45,
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
                  onPressed: (){Get.to(EditProfile());},
                  child: Text(
                    'Edit Profile',
                    style:
                    TextStyle(color: Colors.white,fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: (){
                  Get.to(Payment());
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.payment,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Payment",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                     Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: (){
                  Get.to(Setting());
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.settings,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Account Settings",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: () {
                  Share.share('check out my App https://example.com', subject: 'Look what I made!');
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.share,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Share with friends",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: (){
                  _requestReview();
                  _openStoreListing();
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.star_rate_outlined,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Rate us",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: (){
                  Get.to(FAQ());
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.question_answer_outlined,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Common Questions",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: (){
                  Get.to(TermAndCondition());
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.privacy_tip_outlined,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Terms and Condition",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: InkWell(
                onTap: (){
                  Get.to(Login());
                },
                child: Row(
                  children: [
                    Container(
                      width: 33,height: 33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Color(0xFF2508FF),
                      ),
                      child: Icon(Icons.logout,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          "Logout",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ),
                    // Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15,bottom: 10),
              child: Center(
                child: Text(
                  "Version 1.0.0",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ),
          ],
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