import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/placedetailonly.dart';
import 'package:wander_in/places/view_place.dart';
import 'package:wander_in/places2.dart';
import 'package:wander_in/plans/add_to_plans.dart';
import 'package:wander_in/traveller_profile/traveller_profile.dart';
import 'package:wander_in/user_id.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String region = 'region';
  String user_type = '';
  bool loading = true;
  Map<String, dynamic> userdoc = {};
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        region = userDoc['region'];
        user_type = userDoc['user_type'];
        userdoc = userDoc.data() as Map<String, dynamic>;
        setState(() {
          loading = false;
        });
      } else {
        FirebaseFirestore.instance
            .collection('taxi')
            .doc(getuid())
            .get()
            .then((DocumentSnapshot userDoc) {
          if (userDoc.exists) {
            region = userDoc['region'];
            user_type = userDoc['user_type'];
            setState(() {
              loading = false;
            });
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Rec section ...............................................................
                        // Row(
                        //   // mainAxisAlignment:,
                        //   children: [
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Container(
                        //       height: 30,
                        //       width: 70,
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Container(
                        //       height: 30,
                        //       width: 70,
                        //     )
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "WANDER.IN",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        //Trav section ...............................................................

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 10),
                          child: const Text(
                            'Travelers',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: FirestoreQueryBuilder<Map<String, dynamic>>(
                            query: FirebaseFirestore.instance
                                .collection('users')
                                .where('region', isEqualTo: region),
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

                                  final users = snapshot.docs[index].data();
                                  final user_id = snapshot.docs[index].id;
                                  log(users.toString());

                                  return Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TravellerProfile(
                                                        uid: user_id)));
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: FadeInImage(
                                          image:
                                              NetworkImage(users['image_url']),
                                          placeholder: const AssetImage(
                                              'assets/images/profile.png'),
                                          fit: BoxFit.cover,
                                          width: 60.0,
                                          height: 60.0,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        //places..........................................................................
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 15),
                          child: const Text('Places'),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width,
                          child: FirestoreQueryBuilder<Map<String, dynamic>>(
                            query: FirebaseFirestore.instance
                                .collection('places')
                                .where('region', isEqualTo: region),
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
                                  final place_id = snapshot.docs[index].id;
                                  // log(places.toString());

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, top: 9.0),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewPlace(
                                                        place: places,
                                                        userDoc: userdoc,
                                                        place_id: place_id,
                                                      )));
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: SizedBox(
                                            // height: 100,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .2,

                                            // width: 90,
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              // shrinkWrap: true,
                                              children: [
                                                Image.network(
                                                    places['img_url']),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4.0),
                                                  child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15,
                                                              vertical: 6),
                                                      color: Colors.white60,
                                                      child: Text(
                                                        places['place_name'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                        // Container(
                                        //   height:
                                        //       MediaQuery.of(context).size.height *
                                        //           5,
                                        //   width:
                                        //       MediaQuery.of(context).size.width *
                                        //           .3,
                                        //   decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(12),
                                        //       image: DecorationImage(
                                        //           image: NetworkImage(
                                        //               places['img_url']),
                                        //           fit: BoxFit.cover)),
                                        // ),
                                        ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Gap(30),
                        FirestoreQueryBuilder<Map<String, dynamic>>(
                          query: FirebaseFirestore.instance
                              .collection('feed')
                              .where('region', isEqualTo: region)
                              .orderBy('order', descending: true),
                          builder: (context, snapshot, _) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.docs.length,
                              itemBuilder: (context, index) {
                                if (snapshot.hasMore &&
                                    index + 1 == snapshot.docs.length) {
                                  snapshot.fetchMore();
                                }

                                final docData = snapshot.docs[index].data();
                                final document_id = snapshot.docs[index].id;
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  // height: MediaQuery.of(context).size.height * .50,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black12),
                                        top: BorderSide(color: Colors.black12)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: FadeInImage(
                                                  image: NetworkImage(
                                                      docData['user_img']),
                                                  placeholder: const AssetImage(
                                                      'assets/images/profile.png'),
                                                  fit: BoxFit.cover,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    docData['name'],
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // width:
                                        //     MediaQuery.of(context).size.width,
                                        // height:
                                        //     MediaQuery.of(context).size.height *
                                        //         .35,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    docData['img_url']),
                                                fit: BoxFit.cover)),
                                        child: Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .35,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                      Colors.black,
                                                      Colors.black
                                                          .withOpacity(0.5),
                                                      Colors.black
                                                          .withOpacity(.0)
                                                    ],
                                                        begin: Alignment
                                                            .bottomCenter,
                                                        end:
                                                            Alignment.center))),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_pin,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    docData['place'],
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    " ${docData['liked_users'].length} likes"),
                                              ),
                                              if (!docData['liked_users']
                                                  .contains(getuid()))
                                                GestureDetector(
                                                  onTap: () {
                                                    FirebaseFirestore.instance
                                                        .collection('feed')
                                                        .doc(document_id)
                                                        .update({
                                                      'liked_users': docData[
                                                              'liked_users'] +
                                                          [getuid()],
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(Icons
                                                        .favorite_border_outlined),
                                                  ),
                                                ),
                                              if (docData['liked_users']
                                                  .contains(getuid()))
                                                GestureDetector(
                                                  onTap: () {
                                                    FirebaseFirestore.instance
                                                        .collection('feed')
                                                        .doc(document_id)
                                                        .update({
                                                      'liked_users':
                                                          docData['liked_users']
                                                              .where((item) =>
                                                                  item !=
                                                                  getuid())
                                                              .toList(),
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AddToPlans(
                                                                feedDoc:
                                                                    docData,
                                                              )));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      Icons.add_circle_outline),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),

                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 8.0),
                        //     child: Row(
                        //       children: [
                        //         SizedBox(
                        //           height:
                        //               MediaQuery.of(context).size.height * .25,
                        //           width: MediaQuery.of(context).size.width,
                        //           child: FirestoreQueryBuilder<
                        //               Map<String, dynamic>>(
                        //             query: FirebaseFirestore.instance
                        //                 .collection('feed')
                        //                 .where('region', isEqualTo: region)
                        //                 .orderBy('order', descending: true),
                        //             builder: (context, snapshot, _) {
                        //               return ListView.builder(
                        //                 scrollDirection: Axis.horizontal,
                        //                 shrinkWrap: true,
                        //                 itemCount: snapshot.docs.length,
                        //                 itemBuilder: (context, index) {
                        //                   if (snapshot.hasMore &&
                        //                       index + 1 ==
                        //                           snapshot.docs.length) {
                        //                     snapshot.fetchMore();
                        //                   }
                        //                   final places =
                        //                       snapshot.docs[index].data();
                        //                   log(places.toString());
                        //                   return Padding(
                        //                     padding: EdgeInsets.only(
                        //                         left: 8.0, top: 9.0),
                        //                     child: Center(
                        //                       child: Container(
                        //                         height: MediaQuery.of(context)
                        //                                 .size
                        //                                 .height *
                        //                             5,
                        //                         width: MediaQuery.of(context)
                        //                                 .size
                        //                                 .width *
                        //                             .90,
                        //                         decoration: BoxDecoration(
                        //                             borderRadius:
                        //                                 BorderRadius.circular(
                        //                                     12),
                        //                             image: DecorationImage(
                        //                                 image: NetworkImage(
                        //                                     places['img_url']),
                        //                                 fit: BoxFit.cover)),
                        //                       ),
                        //                     ),
                        //                   );
                        //                 },
                        //               );
                        //             },
                        //           ),
                        //         ),
                        //         // Container(
                        //         //   height: MediaQuery.of(context).size.height * .23,
                        //         //   width: MediaQuery.of(context).size.width * .95,
                        //         //   decoration: BoxDecoration(
                        //         //       boxShadow: [
                        //         //         BoxShadow(
                        //         //             color: Colors.black,
                        //         //             blurRadius: 5,
                        //         //             offset: Offset(1, 2))
                        //         //       ],
                        //         //       image: DecorationImage(
                        //         //           image: AssetImage("assets/images/r.png"),
                        //         //           fit: BoxFit.cover),
                        //         //       borderRadius: BorderRadius.circular(10)),
                        //         // ),
                        //         SizedBox(
                        //           width: 5,
                        //         ),
                        //         // SizedBox(
                        //         //   height:
                        //         //       MediaQuery.of(context).size.height * .25,
                        //         //   width: MediaQuery.of(context).size.width,
                        //         //   child: FirestoreQueryBuilder<
                        //         //       Map<String, dynamic>>(
                        //         //     query: FirebaseFirestore.instance
                        //         //         .collection('places')
                        //         //         .where('region', isEqualTo: 'bathery'),
                        //         //     builder: (context, snapshot, _) {
                        //         //       return ListView.builder(
                        //         //         scrollDirection: Axis.horizontal,
                        //         //         shrinkWrap: true,
                        //         //         itemCount: snapshot.docs.length,
                        //         //         itemBuilder: (context, index) {
                        //         //           if (snapshot.hasMore &&
                        //         //               index + 1 ==
                        //         //                   snapshot.docs.length) {
                        //         //             snapshot.fetchMore();
                        //         //           }

                        //         //           final places =
                        //         //               snapshot.docs[index].data();
                        //         //           log(places.toString());

                        //         //           return Padding(
                        //         //             padding: EdgeInsets.only(
                        //         //                 left: 8.0, top: 9.0),
                        //         //             child: Container(
                        //         //               height: MediaQuery.of(context)
                        //         //                       .size
                        //         //                       .height *
                        //         //                   5,
                        //         //               width: MediaQuery.of(context)
                        //         //                       .size
                        //         //                       .width *
                        //         //                   .90,
                        //         //               decoration: BoxDecoration(
                        //         //                   borderRadius:
                        //         //                       BorderRadius.circular(12),
                        //         //                   image: DecorationImage(
                        //         //                       image: NetworkImage(
                        //         //                           places['image_url']),
                        //         //                       fit: BoxFit.cover)),
                        //         //             ),
                        //         //           );
                        //         //         },
                        //         //       );
                        //         //     },
                        //         //   ),
                        //         // ),
                        //         // Container(
                        //         //   height: MediaQuery.of(context).size.height * .23,
                        //         //   width: MediaQuery.of(context).size.width * .95,
                        //         //   decoration: BoxDecoration(
                        //         //       boxShadow: [
                        //         //         BoxShadow(
                        //         //             color:
                        //         //                 const Color.fromARGB(255, 94, 0, 0),
                        //         //             blurRadius: 5,
                        //         //             offset: Offset(1, 2))
                        //         //       ],
                        //         //       image: DecorationImage(
                        //         //           image: AssetImage("assets/images/r.png"),
                        //         //           fit: BoxFit.cover),
                        //         //       borderRadius: BorderRadius.circular(10)),
                        //         // ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
