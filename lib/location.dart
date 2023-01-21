import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';

class GMap extends StatefulWidget {
  const GMap({Key? key}) : super(key: key);

  @override
  _GMapState createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
    target: LatLng(19.0759837, 42.8776559),
    zoom: 14.4746,
  );

// on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 20.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )
    ),
  ];

// created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  Set<Polygon> _polygon = HashSet<Polygon>();

  List<LatLng> points = [
    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(19.0759837, 72.8776559),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initialize polygon
    _polygon.add(
        Polygon(
          // given polygonId
          polygonId: PolygonId('1'),
          // initialize the list of points to display polygon
          points: points,
          // given color to polygon
          fillColor: Colors.green.withOpacity(0.3),
          // given border color to polygon
          strokeColor: Colors.blue,
          geodesic: true,
          // given width of border
          strokeWidth: 4,
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.09,
        backgroundColor: Color(0xFF2508FF),
        title: Align( alignment: Alignment.center,
          child: Text(
              "Location",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
          ),
        ),
      ),
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
            // on below line setting camera position
            initialCameraPosition: _kGoogle,
            // on below line we are setting markers on the map

            markers: Set<Marker>.of(_markers),

            // on below line specifying map type.
            mapType: MapType.normal,
            // on below line setting user location enabled.
            myLocationEnabled: true,
            // on below line we have enabled location
            myLocationButtonEnabled: true,
            // on below line setting compass enabled.
            compassEnabled: true,
            // on below line we have added polygon
            polygons: _polygon,
            // on below line we have enabled compass location
            // on below line specifying controller on map complete.
            onMapCreated: (GoogleMapController controller){
              _controller.complete(controller);
            },
          ),
        ),
      ),
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());

            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );

            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
// // import 'package:flutter_icons/flutter_icons.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class GMap extends StatefulWidget {
//   @override
//   _MapPageState createState() => _MapPageState();
// }
//
// class _MapPageState extends State<GMap> {
//   Completer<GoogleMapController> _controller = Completer();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(11.5760029, 104.845914),
//     zoom: 15.4746,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: getFooter(),
//       body: getBody(),
//     );
//   }
//
//   Widget getFooter() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 30, top: 60),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black.withOpacity(0.3)),
//                     child: Icon(
//                       // Entypo.user,
//                       color: Color(0xFFe0c600),
//                       size: 23,
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black.withOpacity(0.3)),
//                     child: Icon(
//                       Feather.search,
//                       color: Colors.white,
//                       size: 23,
//                     ),
//                   )
//                 ],
//               ),
//               Container(
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF6e717b).withOpacity(0.30),
//                     spreadRadius: 20,
//                     blurRadius: 40,
//                     // changes position of shadow
//                   ),
//                 ]),
//                 child: Column(
//                   children: [
//                     Text(
//                       "Phnom Penh",
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.cloud,
//                           color: Colors.white,
//                           size: 15,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           "25 c",
//                           style: TextStyle(color: Colors.white, fontSize: 13),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.black.withOpacity(0.3)),
//                 child: Icon(
//                   AntDesign.setting,
//                   color: Colors.white,
//                   size: 23,
//                 ),
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 70,
//                 width: 80,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       left: 3,
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.white),
//                         child: Center(
//                           child: Container(
//                             width: 45,
//                             height: 45,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.grey.withOpacity(0.5)),
//                             child: Center(
//                               child: Icon(
//                                 Entypo.user,
//                                 color: Colors.grey,
//                                 size: 30,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Text(
//                             "My Bitmoji",
//                             style: TextStyle(
//                                 fontSize: 11, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 35,
//                 height: 35,
//                 decoration: BoxDecoration(boxShadow: [
//                   BoxShadow(
//                     color: Color(0xFF6e717b).withOpacity(0.20),
//                     spreadRadius: 20,
//                     blurRadius: 40,
//                     // changes position of shadow
//                   ),
//                 ], shape: BoxShape.circle, color: Colors.white),
//                 child: Center(
//                   child: Icon(
//                     FontAwesome.location_arrow,
//                     size: 20,
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 70,
//                 width: 70,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       left: 3,
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: Colors.white),
//                         child: Center(
//                           child: Container(
//                             width: 45,
//                             height: 45,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.grey.withOpacity(0.5)),
//                             child: Center(
//                               child: Icon(
//                                 Entypo.user,
//                                 color: Colors.grey,
//                                 size: 30,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               top: 5, bottom: 5, left: 12, right: 12),
//                           child: Text(
//                             "Friends",
//                             style: TextStyle(
//                                 fontSize: 11, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget getBody() {
//     return GoogleMap(
//       mapType: MapType.normal,
//       myLocationButtonEnabled: false,
//       initialCameraPosition: _kGooglePlex,
//       onMapCreated: (GoogleMapController controller) {
//         _controller.complete(controller);
//       },
//     );
//   }
// }
//
//
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'dart:collection';
// //
// // class GMap extends StatefulWidget {
// //   const GMap({Key? key}) : super(key: key);
// //
// //   @override
// //   _GMapState createState() => _GMapState();
// // }
// //
// // class _GMapState extends State<GMap> {
// //   Completer<GoogleMapController> _controller = Completer();
// // // on below line we have specified camera position
// //   static final CameraPosition _kGoogle = const CameraPosition(
// //     target: LatLng(19.0759837, 42.8776559),
// //     zoom: 14.4746,
// //   );
// //
// // // on below line we have created the list of markers
// //   final List<Marker> _markers = <Marker>[
// //     Marker(
// //         markerId: MarkerId('1'),
// //         position: LatLng(20.42796133580664, 20.885749655962),
// //         infoWindow: InfoWindow(
// //           title: 'My Position',
// //         )
// //     ),
// //   ];
// //
// // // created method for getting user current location
// //   Future<Position> getUserCurrentLocation() async {
// //     await Geolocator.requestPermission().then((value){
// //     }).onError((error, stackTrace) async {
// //       await Geolocator.requestPermission();
// //       print("ERROR"+error.toString());
// //     });
// //     return await Geolocator.getCurrentPosition();
// //   }
// //
// //   Set<Polygon> _polygon = HashSet<Polygon>();
// //
// //   List<LatLng> points = [
// //     LatLng(19.0759837, 72.8776559),
// //     LatLng(28.679079, 77.069710),
// //     LatLng(26.850000, 80.949997),
// //     LatLng(19.0759837, 72.8776559),
// //   ];
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     //initialize polygon
// //     _polygon.add(
// //         Polygon(
// //           // given polygonId
// //           polygonId: PolygonId('1'),
// //           // initialize the list of points to display polygon
// //           points: points,
// //           // given color to polygon
// //           fillColor: Colors.green.withOpacity(0.3),
// //           // given border color to polygon
// //           strokeColor: Colors.blue,
// //           geodesic: true,
// //           // given width of border
// //           strokeWidth: 4,
// //         )
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         toolbarHeight: MediaQuery.of(context).size.height*0.09,
// //         backgroundColor: Color(0xFF2508FF),
// //         title:
// //         Align( alignment: Alignment.center,
// //           child: Text(
// //               "Location",
// //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
// //           ),
// //         ),
// //       ),
// //       body: Container(
// //         child: SafeArea(
// //           // on below line creating google maps
// //           child: GoogleMap(
// //             // on below line setting camera position
// //             initialCameraPosition: _kGoogle,
// //             // on below line we are setting markers on the map
// //
// //             markers: Set<Marker>.of(_markers),
// //
// //             // on below line specifying map type.
// //             mapType: MapType.normal,
// //             // on below line setting user location enabled.
// //             myLocationEnabled: true,
// //             // on below line we have enabled location
// //             myLocationButtonEnabled: true,
// //             // on below line setting compass enabled.
// //             compassEnabled: true,
// //             // on below line we have added polygon
// //             polygons: _polygon,
// //             // on below line we have enabled compass location
// //             // on below line specifying controller on map complete.
// //             onMapCreated: (GoogleMapController controller){
// //               _controller.complete(controller);
// //             },
// //           ),
// //         ),
// //       ),
// //       // on pressing floating action button the camera will take to user current location
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async{
// //           getUserCurrentLocation().then((value) async {
// //             print(value.latitude.toString() +" "+value.longitude.toString());
// //
// //             // marker added for current users location
// //             _markers.add(
// //                 Marker(
// //                   markerId: MarkerId("2"),
// //                   position: LatLng(value.latitude, value.longitude),
// //                   infoWindow: InfoWindow(
// //                     title: 'My Current Location',
// //                   ),
// //                 )
// //             );
// //
// //             // specified current users location
// //             CameraPosition cameraPosition = new CameraPosition(
// //               target: LatLng(value.latitude, value.longitude),
// //               zoom: 14,
// //             );
// //
// //             final GoogleMapController controller = await _controller.future;
// //             controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
// //             setState(() {
// //             });
// //           });
// //         },
// //         child: Icon(Icons.local_activity),
// //       ),
// //     );
// //   }
// // }