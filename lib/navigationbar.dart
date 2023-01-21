import 'package:autos_dealership/location.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'account.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'searchbar.dart';
class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          Home(),
          SearchBarScreen(),
          GMap(),
          Account(),
        ],
      ),
      //backgroundColor: Color(0xFFFF1000),
    bottomNavigationBar: CurvedNavigationBar(
      height: 50,
      backgroundColor:Color(0xFFFF1000) ,
      color: Color(0xFF2508FF),
    animationDuration: Duration(milliseconds: 300),
    onTap: (int newindex) {
    setState(() {
      index = newindex;
      });
  },
     items: const [
       Icon(
         Icons.home,color: Colors.white,
       ),
       Icon(
         Icons.search,color: Colors.white,
       ),
       Icon(
         Icons.location_pin,color: Colors.white,
       ),
       Icon(
         Icons.account_circle_sharp,color: Colors.white,
       ),
     ],
    ),
    );
}
  }