import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gap/gap.dart';
import 'package:latlong2/latlong.dart';
import 'package:wander_in/hotels/view_hotel.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/places/view_place.dart';
import 'package:wander_in/resort2.dart';
import 'package:wander_in/resorts/view_resorts.dart';
import 'package:wander_in/resortview.dart';
import 'package:wander_in/search/hotel_search_page.dart';
import 'package:wander_in/taxi/book_taxi.dart';
import 'package:wander_in/user_id.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String region = 'region';
  String name = '';
  Map<String, dynamic> userdoc = {};
  List<Marker> markers = [];
  bool loading = true;
  Color hotelColor = Colors.black;
  Color resortColor = Colors.white;
  Color taxiColor = Colors.white;
  Color placeColor = Colors.white;
  Color placetext = Colors.black;
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
        name = userDoc['name'];
        userdoc = userDoc.data() as Map<String, dynamic>;
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
        // .where('region', isEqualTo: region)
        .get();
    markers = hotelList.docs
        .map(
          (doc) => Marker(
            point: LatLng(double.parse(doc.data()['lat'].toString()),
                double.parse(doc.data()['long'].toString())),
            child: GestureDetector(
                onTap: () {
                  // if (doc.data()['status'] == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewHotel(hotelDoc: doc.data())),
                  );
                  // } else {
                  //   newCustomMessage(context, 'currently not open');
                  // }
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
        // .where('region', isEqualTo: region)
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
                              user_name: name,
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
        // .where('region', isEqualTo: region)
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

  getPlaceMarkers() async {
    var placesList = await FirebaseFirestore.instance
        .collection('places')
        // .where('region', isEqualTo: region)
        .get();
    markers = placesList.docs
        .map(
          (doc) => Marker(
            point: LatLng(double.parse(doc.data()['lat'].toString()),
                double.parse(doc.data()['long'].toString())),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPlace(
                                place: doc.data(),
                                userDoc: userdoc,
                                place_id: doc.id,
                              )));
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BookTaxi(
                  //             user_name: name,
                  //             taxiData: doc.data(),
                  //           )),
                  // );
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
                  Icons.nature,
                  color: Colors.green,
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
                                  //   padding:
                                  //       const EdgeInsets.only(left: 10.0),
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
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HotelSearchPageResult(
                                                    userdoc: userdoc,
                                                  )));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 6),
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                spreadRadius: .7,
                                                offset: const Offset(.5, 1),
                                                blurRadius: 5,
                                                color: const Color(0x0fd3d3d3)
                                                    .withOpacity(.8),
                                              ),
                                            ]),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.search,
                                              color: Color.fromARGB(
                                                  255, 0, 67, 144),
                                            ),
                                            const Gap(10),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .7,
                                              height: 30,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  // color: const Color.fromARGB(255, 230, 234, 248),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text('search'),
                                                      ],
                                                    )
                                                    //  TextFormField(
                                                    //   onChanged: (val) {
                                                    //     setState(() {
                                                    //       name = val.toUpperCase();
                                                    //     });
                                                    //   },
                                                    //   style: const TextStyle(
                                                    //     fontSize: 16,
                                                    //     color: Colors.black,
                                                    //     height: .8,
                                                    //   ),
                                                    //   decoration: const InputDecoration(
                                                    //     isDense: true,
                                                    //     border: InputBorder.none,
                                                    //     hintText: 'Search',
                                                    //   ),
                                                    // ),
                                                    ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
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

                                              placeColor = taxiColor =
                                                  resortColor =
                                                      unselectedbgColor;
                                              placetext = taxitext =
                                                  resorttext =
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
                                                'Hotel',
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
                                              getPlaceMarkers();
                                              placeColor = selectedbgColor;
                                              placetext = selectedtextColor;

                                              taxiColor = hotelColor =
                                                  resortColor =
                                                      unselectedbgColor;
                                              taxitext = hoteltext =
                                                  resorttext =
                                                      unselectedtextColor;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: placeColor,
                                            ),
                                            height: 40,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            child: Center(
                                              child: Text(
                                                'Place',
                                                style: TextStyle(
                                                    color: placetext,
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

                                              placeColor = hotelColor =
                                                  resortColor =
                                                      unselectedbgColor;
                                              placetext = hoteltext =
                                                  resorttext =
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
                                                'Taxi',
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

                                              placeColor = taxiColor =
                                                  hotelColor = placetext =
                                                      unselectedbgColor;
                                              placetext = taxitext = hoteltext =
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
                                                'Resort',
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
