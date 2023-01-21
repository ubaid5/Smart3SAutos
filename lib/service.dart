import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:autos_dealership/Models/service_model.dart';
import 'package:autos_dealership/API/services_api.dart';
import 'detail_page1.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}
final List<String> servicesleft = [
  "assets/wheel.jpg",
  "assets/caroil.jpg",
  "assets/mirrorservice.jpg",
];
final List<String> servicesright = [
  "assets/engineservice.png",
  "assets/gasservice.jpg",
  "assets/brakeservice.jpg",
];
final List<String> servicesnameleft = [
  "Wheel Service",
  "Oil Service",
  "Mirror Service",
];
final List<String> servicesnameright = [
  "Engine Service",
  "Gas Service",
  "Brake Service",
];
int imagesrcindex = 0;

class _ServiceState extends State<Service> {
  late List<ServicesModel>? _servicesModel = [];
  late List<Services>? _services= [];


  @override
  void initState() {
    super.initState();
    _postServices();
  }

  void _postServices() async {
    _servicesModel = (await ApiService(). getService())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GradientText("Our Services",
            gradient: LinearGradient(colors: [
              Color(0xFFFF1000),
              Color(0xFF2508FF),
            ]),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      body:
      _servicesModel == null || _servicesModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 2.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xFF2508FF),
                        Color(0xFFFF1000)
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    color: Colors.transparent,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.21,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _servicesModel!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: <Color>[
                                    Colors.pink.shade100,
                                    Colors.pink
                                  ]),
                              borderRadius: new BorderRadius.circular(10)),
                          height: 175,
                          width: 125,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage1
                                        ()));
                            },
                            child: Hero(
                              tag: "service",
                              child: Card(
                                color: Colors.transparent,
                                elevation: 0,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(_services![index].serviceName),
                                        Text(_services![index].type as String),
                                      ],
                                    ),
                                    Image.asset(
                                      "",
                                      fit: BoxFit.contain,
                                      height: 75,
                                      width: 155,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(_services![index].price as String),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              "per day",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFFFF1000),
                              Color(0xFF2508FF)
                            ]),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      GradientText("All Services  ",
                          gradient: LinearGradient(colors: [
                            Color(0xFFFF1000),
                            Color(0xFF2508FF),
                            Color(0xFFFF1000),
                          ]),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center),
                      Expanded(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[
                              Color(0xFF2508FF),
                              Color(0xFFFF1000)
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

//------------------------------------------------------------------------------------

            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.8,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: servicesleft.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: <Widget>[
                          Container(
                            width: (MediaQuery.of(context).size.width - 25) / 2,
                            height: 100,
                            color: Colors.transparent,
                            child: Card(
                              elevation: 5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipOval(
                                    child: Container(
                                      child: Image.asset(
                                        servicesleft[index],
                                        fit: BoxFit.fill,
                                        width: 55,
                                        height: 55,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child:
                                    Text(
                                      servicesnameleft[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 25) / 2,
                            height: 100,
                            color: Colors.transparent,
                            child: Card(
                              elevation: 5,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipOval(
                                    child: Container(
                                      child: Image.asset(
                                        servicesright[index],
                                        fit: BoxFit.fill,
                                        width: 55,
                                        height: 55,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      servicesnameright[index],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
//------------------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}

