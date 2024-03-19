import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/places/add_place_to_plans.dart';
import 'package:wander_in/resorts/view_resorts.dart';

class ViewPlace extends StatefulWidget {
  final Map<String, dynamic> place;
  final String place_id;
  final Map<String, dynamic> userDoc;
  const ViewPlace(
      {super.key,
      required this.place,
      required this.userDoc,
      required this.place_id});

  @override
  State<ViewPlace> createState() => _ViewPlaceState();
}

class _ViewPlaceState extends State<ViewPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              //  Stack ...........................................................................................
              children: [
                // image container.................................................................................
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(widget.place['img_url']),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Positioned(
                            //   top: 5,
                            //   right: 10,
                            //   child: Row(
                            //     mainAxisSize: MainAxisSize.min,
                            //     children: [
                            //       Icon(Icons.star, color: Colors.yellow),
                            //       Icon(Icons.star, color: Colors.yellow),
                            //       Icon(Icons.star, color: Colors.yellow),
                            //       Icon(Icons.star, color: Colors.yellow),
                            //       Icon(Icons.star, color: Colors.yellow),
                            //       SizedBox(width: 4),
                            //       Text(
                            //         '5.0',
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            Positioned(
                              bottom: 50,
                              left: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.place['place_name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width,
                      //   height: MediaQuery.of(context).size.height * 0.38,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage("assets/images/r1.png"),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                //container positioned over the image........................................................................
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 133, 133),
                          blurRadius: 5,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Colors.yellow),
                                Text(widget.place['region'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 10.0, top: 10),
                          //   child: Text("Description",
                          //       style: TextStyle(
                          //         fontSize: 17,
                          //         color: Colors.black,
                          //       )),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  widget.place['desc'],
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          // add to plans........................................................................................
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPlaceToPlans(
                                          userDoc: widget.userDoc,
                                          placeDoc: widget.place)));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 20.0, left: 55),
                              child: Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .08,
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 0,
                                    right: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Add to plans",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.amber,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Nearby resorts............................................................................................
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              'Nearby Resorts',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width,
                            child: FirestoreQueryBuilder<Map<String, dynamic>>(
                              query: FirebaseFirestore.instance
                                  .collection('places')
                                  .doc(widget.place_id)
                                  .collection('nearby_resorts'),
                              // .where('region',
                              //     isEqualTo: widget.place['region']),
                              builder: (context, snapshot, _) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: snapshot.docs.length,
                                  itemBuilder: (context, index) {
                                    if (snapshot.hasMore &&
                                        index + 1 == snapshot.docs.length) {
                                      snapshot.fetchMore();
                                    }

                                    final places = snapshot.docs[index].data();
                                    log(places.toString());

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 9.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewResort(
                                                      resortDoc: places,
                                                    )),
                                          );
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             ViewPlace(
                                          //               place: places,userDoc: ,
                                          //             )));
                                        },
                                        child: Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .3,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      places['imageUrl']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),

                          //recommended places...............................................................................
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 10),
                            child: Text(
                              'Recommended Places',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width,
                            child: FirestoreQueryBuilder<Map<String, dynamic>>(
                              query: FirebaseFirestore.instance
                                  .collection('recommended_places')
                                  .where('region',
                                      isEqualTo: widget.place['region']),
                              builder: (context, snapshot, _) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: snapshot.docs.length,
                                  itemBuilder: (context, index) {
                                    if (snapshot.hasMore &&
                                        index + 1 == snapshot.docs.length) {
                                      snapshot.fetchMore();
                                    }

                                    final places = snapshot.docs[index].data();
                                    final placeId = snapshot.docs[index].id;
                                    log(places.toString());

                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 9.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewPlace(
                                                        place: places,
                                                        userDoc: widget.userDoc,
                                                        place_id: placeId,
                                                      )));
                                        },
                                        child: Container(
                                          height: 100,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .6,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      places['img_url']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),

                          Gap(20)
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
    );
  }
}
