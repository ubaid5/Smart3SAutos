import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:autos_dealership/Models/vehicle_model.dart';
import 'package:autos_dealership/API/vehicles_api.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<VehicleModel>? _vehicleModel = [];
  late List<Vehicles>? _vehicles = [];

  @override
  void initState() {
    super.initState();
    _getVehicle1();
  }

  void _getVehicle1() async {
    _vehicleModel = (await ApiVehicles().getVehicles())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _vehicleModel == null || _vehicleModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :Padding(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              // height: MediaQuery.of(context).size.height / 2,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            width: 90,
                            height: 20,
                            child: Text(
                              "Available",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(_vehicles![0].vehicleName),
                        ],
                      ),
                      Image.asset(
                        "",
                        fit: BoxFit.contain,
                        height: 55,
                        width: 55,
                      ),
                      Text(_vehicles![0].vehicleType as String),
                    ],
                  ),
                  SizedBox(height: 10),
                  Hero(
                    tag: "car",
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: <Color>[Colors.pink.shade100, Colors.pink]),
                          borderRadius: new BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(_vehicles![0].vehicleType as String),
                                  Text(_vehicles![0].price as String),
                                ],
                              ),
                              Image.asset(
                                "",
                                fit: BoxFit.contain,
                                height: 150,
                                width: 150,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlue[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 75,
                            width: 75,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.colorize,
                                  size: 35,
                                  color: Colors.blue[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _vehicles![0].color,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blue[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.pink[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 75,
                            width: 75,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.people,
                                  size: 35,
                                  color: Colors.pink[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _vehicles![0].features,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.pink[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 75,
                            width: 75,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.network_check,
                                  size: 35,
                                  color: Colors.orange[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _vehicles![0].mileage,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.orange[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 75,
                            width: 75,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Icon(
                                  Icons.local_gas_station,
                                  size: 35,
                                  color: Colors.green[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  _vehicles![0].fuelAverage,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.green[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GradientText(
                        "Charges",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        gradient: LinearGradient(colors: [
                          Color(0xFFFF1000),
                          Color(0xFF2508FF),
                        ]),
                      ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          gradient: LinearGradient(
                              colors: [
                                Color(0xFF2508FF),
                                Color(0xFFFF1000),
                              ],
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[Colors.pink.shade100, Colors.pink]),
                  borderRadius: new BorderRadius.circular(10)),
              child: ListView(
                children: <Widget>[
                  Padding
                    (padding: const EdgeInsets.only(left: 20, ),
                    child: Text(
                        "Description",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white)
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding
                    (padding: const EdgeInsets.only(left: 50,right: 20, ),
                    child: Text( _vehicles![0].vehicleDescription),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
