import 'package:flutter/material.dart';
import 'package:autos_dealership/Models/spareparts_model.dart';
import 'package:autos_dealership/API/spareparts_api.dart';

class DetailPage2 extends StatefulWidget {
  const DetailPage2({Key? key}) : super(key: key);

  @override
  State<DetailPage2> createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {
  late List<SparePartModel>? _sparePartModel = [];
  late List<SpareParts>? _spareParts= [];


  @override
  void initState() {
    super.initState();
    _postSpareparts();
  }

  void _postSpareparts() async {
    _sparePartModel = (await ApiSpareparts(). getSpareParts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      _sparePartModel == null || _sparePartModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          :Padding(
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
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

                          Text(_spareParts![0].partName),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Hero(
                    tag: "spareparts",
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
                                  Text(_spareParts![0].type as String),
                                  Text(_spareParts![0].price as String),
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
                                  Icons.new_label,
                                  size: 35,
                                  color: Colors.blue[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(_spareParts![0].partCondition),
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
                                  Icons.colorize,
                                  size: 35,
                                  color: Colors.pink[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(_spareParts![0].color as String),
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
                                  Icons.cleaning_services,
                                  size: 35,
                                  color: Colors.orange[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(_spareParts![0].workshopName as String),
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
                                  Icons.signal_wifi_statusbar_4_bar,
                                  size: 35,
                                  color: Colors.green[700],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(_spareParts![0].status as String),
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
                    child: Text(
                        "There are many roles that a car engine oil does, its most important role is lubrication. A car engine contains hundreds of moving metallic parts, which would quickly wear out without oil to lubricate them. If there’s too much friction between two mechanical components, they can lock together and cause the engine to stop running. But, how much engine oil does a car need? The amount of engine oil needed will depend on the size of your car’s engine. ",
                        style: TextStyle(fontSize: 20,color: Colors.white)
                    ),
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

