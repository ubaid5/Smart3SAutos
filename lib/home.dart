import 'package:autos_dealership/signup.dart';
import 'package:flutter/material.dart';
import 'buy.dart';
import 'login.dart';
import 'service.dart';
import 'spareparts.dart';
import 'buy.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF2508FF),
            bottom: TabBar(
              indicatorColor: Color(0xFFFF1000),
              indicatorWeight: 3,
              tabs: [
                Tab(child:Text("Buy"),icon: Icon(Icons.directions_car,)),
                //icon: Icon(Icons.directions_car,)
                Tab(child:Text("Service") ,icon: Icon(Icons.car_repair_sharp)),
                Tab(child:Text("Spare Parts"),icon: Icon(Icons.build)),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo1.png',
                  fit: BoxFit.contain,
                  height: 40,

                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                     child: Text('Shareef Motors',style: TextStyle(color: Colors.white,
                         fontWeight: FontWeight.bold,fontSize: 25
                     ),))
              ],
            ),
            //Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              //Icon(Icons.directions_transit, size: 350),
              //Icon(Icons.flight, size: 350),
             Buy(),
             Service(),
             Spareparts(),
             // Icon(Icons.directions_car, size: 350),
            ],
          ),
            ),
        );
  }
}
