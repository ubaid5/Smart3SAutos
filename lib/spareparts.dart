import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:autos_dealership/Models/spareparts_model.dart';
import 'package:autos_dealership/API/spareparts_api.dart';
import 'detail_page2.dart';

class Spareparts extends StatefulWidget {
  const Spareparts({Key? key}) : super(key: key);

  @override
  State<Spareparts> createState() => _SparepartsState();
}

final List<String> spare_partleft = [
  "assets/wheel.jpg",
  "assets/caroil.jpg",
  "assets/mirrorservice.jpg",
];
final List<String> spare_partright = [
  "assets/engineservice.png",
  "assets/gasservice.jpg",
  "assets/brakeservice.jpg",
];
final List<String> spare_partsnameleft = [
  "Car Tires",
  "Car Oil",
  "Water Pump",
];
final List<String> sparepartsnameright = [
  "Car Filters",
  "Timing Belt",
  "Car Battery",
];
int imagesrcindex = 0;
class _SparepartsState extends State<Spareparts> {

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GradientText("Spare Parts",
            gradient: LinearGradient(colors: [
              Color(0xFFFF1000),
              Color(0xFF2508FF),
            ]),
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
      body:
      _sparePartModel == null || _sparePartModel!.isEmpty
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
                      itemCount: _sparePartModel!.length,
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
                                      builder: (context) => DetailPage2
                                        ()));
                            },
                            child: Hero(
                              tag: "spareparts",
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
                                        Text(_spareParts![index].partName),

                                        Text(_spareParts![index].type as String),
                                      ],
                                    ),
                                    Image.asset(
                                      "assets/bmwcar_card.png",
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
                                        //Text(_services![index].vehicleModel),
                                        Text(_spareParts![index].price as String),

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
                      GradientText("All Spareparts  ",
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
                    itemCount: spare_partleft.length,
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
                                        spare_partleft[index],
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
                                      spare_partsnameleft[index],
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
                                        spare_partright[index],
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
                                      sparepartsnameright[index],
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

