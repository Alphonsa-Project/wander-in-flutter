import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/resort2.dart';
import 'package:wander_in/resorts/view_resorts.dart';
import 'package:wander_in/resortview.dart';
import 'package:wander_in/taxi/book_taxi.dart';
import 'package:wander_in/user_id.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String region = 'region';
  List<Marker> markers = [];
  bool loading = true;
  Color hotelColor = Colors.black;
  Color resortColor = Colors.white;
  Color taxiColor = Colors.white;
  Color hoteltext = Colors.white;
  Color resorttext = Colors.black;
  Color taxitext = Colors.black;

  Color selectedtextColor = Colors.white;
  Color selectedbgColor = Colors.black;
  Color unselectedtextColor = Colors.black;
  Color unselectedbgColor = Colors.white;

  getMapDetails() {
    final resortData = FirebaseFirestore.instance
        .collection('resorts')
        .where('region', isEqualTo: region)
        .get();

    final taxiData = FirebaseFirestore.instance
        .collection('taxi')
        .where('region', isEqualTo: region)
        .get();

    log(resortData.toString());
  }

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        region = userDoc['region'];
        setState(() {
          loading = false;
        });
      }
    }).then((value) {
      getHotelMarkers();
    });
    super.initState();
  }

  getHotelMarkers() async {
    var hotelList = await FirebaseFirestore.instance
        .collection('hotels')
        .where('region', isEqualTo: region)
        .get();
    markers = hotelList.docs
        .map(
          (doc) => Marker(
            point: LatLng(double.parse(doc.data()['lat'].toString()),
                double.parse(doc.data()['long'].toString())),
            child: GestureDetector(
                onTap: () {
                  if (doc.data()['status'] == true) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => SlotPage(
                    //             docid: doc.id,
                    //             station_doc: doc.data(),
                    //           )),
                    // );
                  } else {
                    newCustomMessage(context, 'currently not open');
                  }
                },
                child: const Icon(
                  Icons.restaurant,
                  color: Colors.blue,
                  size: 50,
                )),
          ),
        )
        .toList();

    setState(() {
      loading = false;
    });
  }

  getTaxiMarkers() async {
    var hotelList = await FirebaseFirestore.instance
        .collection('taxi')
        .where('region', isEqualTo: region)
        .get();
    markers = hotelList.docs
        .map(
          (doc) => Marker(
            point: LatLng(double.parse(doc.data()['lat'].toString()),
                double.parse(doc.data()['long'].toString())),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookTaxi(
                              taxiData: doc.data(),
                            )),
                  );
                  // if (doc.data()['status'] == true) {
                  //   // Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //       builder: (context) => SlotPage(
                  //   //             docid: doc.id,
                  //   //             station_doc: doc.data(),
                  //   //           )),
                  //   // );
                  // } else {
                  //   newCustomMessage(context, 'currently not available');
                  // }
                },
                child: const Icon(
                  Icons.local_taxi,
                  color: Colors.blue,
                  size: 50,
                )),
          ),
        )
        .toList();

    setState(() {
      loading = false;
    });
  }

  getResortMarkers() async {
    var hotelList = await FirebaseFirestore.instance
        .collection('resorts')
        .where('region', isEqualTo: region)
        .get();
    markers = hotelList.docs
        .map(
          (doc) => Marker(
            point: LatLng(double.parse(doc.data()['lat'].toString()),
                double.parse(doc.data()['long'].toString())),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewResort(
                              resortDoc: doc.data(),
                            )),
                  );
                  // if (doc.data()['status'] == true) {

                  // } else {
                  //   newCustomMessage(context, 'currently not available');
                  // }
                },
                child: const Icon(
                  Icons.hotel,
                  color: Colors.blue,
                  size: 50,
                )),
          ),
        )
        .toList();

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Color(0xfff9f4f4),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Rec section ...............................................................
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 10.0),
                                  //   child: Row(
                                  //     children: [
                                  //       Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             top: 10.0, left: 5),
                                  //         child: Icon(Icons.search),
                                  //       ),
                                  //       SizedBox(
                                  //         width: 10,
                                  //       ),
                                  //       Container(
                                  //         height: MediaQuery.of(context)
                                  //                 .size
                                  //                 .height *
                                  //             .04,
                                  //         width: MediaQuery.of(context)
                                  //                 .size
                                  //                 .width *
                                  //             .85,
                                  //         decoration: BoxDecoration(
                                  //           color: Colors.white,
                                  //           boxShadow: [
                                  //             BoxShadow(
                                  //               color: Colors.black,
                                  //               blurRadius: 2,
                                  //               offset: Offset(1, 2),
                                  //             )
                                  //           ],
                                  //           borderRadius:
                                  //               BorderRadius.circular(20),
                                  //         ),
                                  //         child: Padding(
                                  //           padding: const EdgeInsets.only(
                                  //               top: 15.0, left: 15),
                                  //           child: TextField(
                                  //               decoration: InputDecoration(
                                  //             border: InputBorder.none,
                                  //             hintText: 'Search',
                                  //           )),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getHotelMarkers();
                                              hotelColor = selectedbgColor;
                                              hoteltext = selectedtextColor;

                                              taxiColor = resortColor =
                                                  unselectedbgColor;
                                              taxitext = resorttext =
                                                  unselectedtextColor;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: hotelColor,
                                            ),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            child: Center(
                                              child: Text(
                                                'hotel',
                                                style: TextStyle(
                                                    color: hoteltext,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getTaxiMarkers();
                                              taxiColor = selectedbgColor;
                                              taxitext = selectedtextColor;

                                              hotelColor = resortColor =
                                                  unselectedbgColor;
                                              hoteltext = resorttext =
                                                  unselectedtextColor;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: taxiColor,
                                            ),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            child: Center(
                                              child: Text(
                                                'taxi',
                                                style: TextStyle(
                                                    color: taxitext,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              getResortMarkers();
                                              resortColor = selectedbgColor;
                                              resorttext = selectedtextColor;

                                              taxiColor = hotelColor =
                                                  unselectedbgColor;
                                              taxitext = hoteltext =
                                                  unselectedtextColor;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: resortColor,
                                            ),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            child: Center(
                                              child: Text(
                                                'resort',
                                                style: TextStyle(
                                                    color: resorttext,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .80,
                                      width: MediaQuery.of(context).size.width *
                                          .96,
                                      color: Colors.red,
                                      child: FlutterMap(
                                        options: MapOptions(
                                          initialCenter:
                                              LatLng(11.6629, 76.2570),
                                          initialZoom: 11.2,
                                        ),
                                        children: [
                                          TileLayer(
                                            urlTemplate:
                                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                            userAgentPackageName:
                                                'com.example.app',
                                          ),
                                          MarkerLayer(markers: markers),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
