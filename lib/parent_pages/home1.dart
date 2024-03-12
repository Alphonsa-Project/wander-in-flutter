import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Rec section ...............................................................
                  Row(
                    // mainAxisAlignment:,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 70,
                      )
                    ],
                  ),
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
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    child: FirestoreQueryBuilder<Map<String, dynamic>>(
                      query: FirebaseFirestore.instance
                          .collection('users')
                          .where('region', isEqualTo: 'bathery'),
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
                            log(users.toString());

                            return Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Image.network(users['image_url']),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 8.0),
                  //       child: Container(
                  //         height: 50,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: AssetImage("assets/images/t1.png"))),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Container(
                  //       height: 50,
                  //       width: 50,
                  //       decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //               image: AssetImage("assets/images/t2.png"))),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 10.0),
                  //       child: Container(
                  //         height: 50,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: AssetImage("assets/images/t3.png"))),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 10.0),
                  //       child: Container(
                  //         height: 50,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: AssetImage("assets/images/t4.png"))),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 10.0),
                  //       child: Container(
                  //         height: 50,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //             image: DecorationImage(
                  //                 image: AssetImage("assets/images/t5.png"))),
                  //       ),
                  //     ),
                  //   ],
                  // ),

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
                          .where('region', isEqualTo: 'bathery'),
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
                              padding: EdgeInsets.only(left: 8.0, top: 9.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 5,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(places['image_url']),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       left: 10.0, top: 10, bottom: 10),
                        //   child: Container(
                        //     height: MediaQuery.of(context).size.height * .18,
                        //     width: MediaQuery.of(context).size.width * .6,
                        //     decoration: BoxDecoration(
                        //         boxShadow: [
                        //           BoxShadow(
                        //               color:
                        //                   const Color.fromARGB(255, 94, 0, 0),
                        //               blurRadius: 5,
                        //               offset: Offset(1, 2))
                        //         ],
                        //         image: DecorationImage(
                        //             image: AssetImage("assets/images/r.png"),
                        //             fit: BoxFit.cover),
                        //         borderRadius: BorderRadius.circular(10)),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Container(
                        //   height: MediaQuery.of(context).size.height * .18,
                        //   width: MediaQuery.of(context).size.width * .6,
                        //   decoration: BoxDecoration(
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: const Color.fromARGB(255, 94, 0, 0),
                        //             blurRadius: 5,
                        //             offset: Offset(1, 2))
                        //       ],
                        //       image: DecorationImage(
                        //           image: AssetImage("assets/images/r.png"),
                        //           fit: BoxFit.cover),
                        //       borderRadius: BorderRadius.circular(10)),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //people.................................................................................
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .04,
                              width: MediaQuery.of(context).size.width * .09,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/images/t5.png"),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Tyler Durden',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .04,
                          width: MediaQuery.of(context).size.width * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            'follow',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                            width: MediaQuery.of(context).size.width,
                            child: FirestoreQueryBuilder<Map<String, dynamic>>(
                              query: FirebaseFirestore.instance
                                  .collection('places')
                                  .where('region', isEqualTo: 'bathery'),
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
                                      padding:
                                          EdgeInsets.only(left: 8.0, top: 9.0),
                                      child: Center(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              5,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      places['image_url']),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          // Container(
                          //   height: MediaQuery.of(context).size.height * .23,
                          //   width: MediaQuery.of(context).size.width * .95,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         BoxShadow(
                          //             color: Colors.black,
                          //             blurRadius: 5,
                          //             offset: Offset(1, 2))
                          //       ],
                          //       image: DecorationImage(
                          //           image: AssetImage("assets/images/r.png"),
                          //           fit: BoxFit.cover),
                          //       borderRadius: BorderRadius.circular(10)),
                          // ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                            width: MediaQuery.of(context).size.width,
                            child: FirestoreQueryBuilder<Map<String, dynamic>>(
                              query: FirebaseFirestore.instance
                                  .collection('places')
                                  .where('region', isEqualTo: 'bathery'),
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
                                      padding:
                                          EdgeInsets.only(left: 8.0, top: 9.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .90,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    places['image_url']),
                                                fit: BoxFit.cover)),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          // Container(
                          //   height: MediaQuery.of(context).size.height * .23,
                          //   width: MediaQuery.of(context).size.width * .95,
                          //   decoration: BoxDecoration(
                          //       boxShadow: [
                          //         BoxShadow(
                          //             color:
                          //                 const Color.fromARGB(255, 94, 0, 0),
                          //             blurRadius: 5,
                          //             offset: Offset(1, 2))
                          //       ],
                          //       image: DecorationImage(
                          //           image: AssetImage("assets/images/r.png"),
                          //           fit: BoxFit.cover),
                          //       borderRadius: BorderRadius.circular(10)),
                          // ),
                        ],
                      ),
                    ),
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
