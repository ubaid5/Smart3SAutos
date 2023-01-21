import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'detail_page.dart';
import 'package:autos_dealership/Models/vehicle_model.dart';
import 'package:autos_dealership/API/vehicles_api.dart';
class Buy extends StatefulWidget {
  const Buy({Key? key}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {

  late List<VehicleModel>? _vehicleModel = [];
  late List<Vehicles>? _vehicles = [];

  @override
  void initState() {
    super.initState();
    _getVehicle1();
  }

  void _getVehicle1() async {
    _vehicleModel = (await ApiVehicles().getVehicles());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _vehicleModel == null || _vehicleModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery
                .of(context)
                .size
                .height * 0.025,),
            GradientText("Explore",
                gradient: LinearGradient(colors: [
                  Color(0xFFFF1000),
                  Color(0xFF2508FF),
                ]),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF2508FF), Color(0xFFFF1000)]),
              ),
            ),
            SizedBox(
              height: 10,
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
                itemCount: _vehicleModel!.length,
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
                                builder: (context) => DetailPage()));
                      },
                      child: Hero(
                        tag: "car",
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
                                  Text(_vehicles![index].vehicleName),
                                  Text(_vehicles![index].vehicleType as String),
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
                                  Text(
                                      _vehicles![index].vehicleModel),
                                  Text(_vehicles![index].price as String),
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
                GradientText("Top Rated  ",
                    gradient: LinearGradient(colors: [
                      Color(0xFFFF1000),
                      Color(0xFF2508FF),
                      Color(0xFFFF1000),
                    ]),
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
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
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.36,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      FittedBox(
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                      image: AssetImage(
                                          'assets/toyota.webp'),
                                    ),
                                  ),
                                ),
                                toyotacar(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                      image: AssetImage(
                                          'assets/hundai.png'),
                                    ),
                                  ),
                                ),
                                hundaicar(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FittedBox(
                        child: GestureDetector(
                          onTap: () {},
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 5,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        15.0),
                                    child: Image(
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/volkswagen.png'),
                                    ),
                                  ),
                                ),
                                volkswagencar(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget toyotacar() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Toyota Fortuner",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Container(
              width: 45,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                "Premium",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.5),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 35,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                "New",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ratings",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 7,
                  color: Colors.grey),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget hundaicar() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " Honda Creta   ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Container(
              width: 35,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                "New",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.5),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 45,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                "Assured",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ratings",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 7,
                  color: Colors.grey),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget volkswagencar() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            " VolksWagen",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Container(
              width: 45,
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                "Premium",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.5),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 35,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: Text(
                "New",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.5),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ratings",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 7,
                  color: Colors.grey),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.orangeAccent,
            ),
            Icon(
              Icons.star,
              size: 10,
              color: Colors.grey,
            ),
          ],
        ),
      ],
    ),
  );
}