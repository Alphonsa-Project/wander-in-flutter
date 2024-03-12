import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/taxi.dart';
import 'package:wander_in/user_id.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String region = 'region';
  getMapDetails() {
    final resortData = FirebaseFirestore.instance
        .collection('resorts')
        .where('region', isEqualTo: region)
        .get();

    final taxiData = FirebaseFirestore.instance
        .collection('taxi')
        .where('region', isEqualTo: region)
        .get();
    final hotelData = FirebaseFirestore.instance
        .collection('hotels')
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
        setState(() {});
      }
    }).then((value) {
      getMapDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 5),
                                    child: Icon(Icons.search),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .04,
                                    width:
                                        MediaQuery.of(context).size.width * .85,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2,
                                          offset: Offset(1, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15.0, left: 15),
                                      child: TextField(
                                          decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search',
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text('hotel'),
                                  const Text('Taxi'),
                                  const Text('Resort'),
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
                                    MediaQuery.of(context).size.height * .70,
                                width: MediaQuery.of(context).size.width * .96,
                                color: Colors.red,
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
