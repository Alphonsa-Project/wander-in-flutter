import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String notification_type = 'all';
  Color allbgcolor = Colors.black;
  Color alltextcolor = Colors.white;
  Color taxibgcolor = Colors.white;
  Color taxitextcolor = Colors.black;
  Color resortbgcolor = Colors.white;
  Color resorttextcolor = Colors.black;
  Color travellerbgcolor = Colors.white;
  Color travellertextcolor = Colors.black;

  Color selectedbgcolor = Colors.black;
  Color selectedtextcolor = Colors.white;
  Color unselectedbgcolor = Colors.white;
  Color unselectedtextcolor = Colors.black;

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
            scrollDirection: Axis.vertical,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .13,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade900.withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(1, 4))
                      ]),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.0, top: 20.0, right: 25.0),
                            child: Text(
                              'Notifications',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      //recom.............................................................................................
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20.0, right: 20.0),
                        child: SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //all..........................................................................
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    allbgcolor = selectedbgcolor;
                                    alltextcolor = selectedtextcolor;

                                    taxibgcolor = resortbgcolor =
                                        travellerbgcolor = unselectedbgcolor;
                                    taxitextcolor = resorttextcolor =
                                        travellertextcolor =
                                            unselectedtextcolor;
                                    notification_type = 'all';
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                  width:
                                      MediaQuery.of(context).size.width * .18,
                                  decoration: BoxDecoration(
                                      color: allbgcolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'all',
                                      style: TextStyle(
                                        color: alltextcolor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //traveler....................................................................
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    travellerbgcolor = selectedbgcolor;
                                    travellertextcolor = selectedtextcolor;

                                    taxibgcolor = resortbgcolor =
                                        allbgcolor = unselectedbgcolor;
                                    taxitextcolor = resorttextcolor =
                                        alltextcolor = unselectedtextcolor;
                                    notification_type = 'traveller';
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                  width:
                                      MediaQuery.of(context).size.width * .18,
                                  decoration: BoxDecoration(
                                      color: travellerbgcolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'travelers',
                                      style:
                                          TextStyle(color: travellertextcolor),
                                    ),
                                  ),
                                ),
                              ),
                              //resort...................................................
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    resortbgcolor = selectedbgcolor;
                                    resorttextcolor = selectedtextcolor;

                                    taxibgcolor = allbgcolor =
                                        travellerbgcolor = unselectedbgcolor;
                                    taxitextcolor = alltextcolor =
                                        travellertextcolor =
                                            unselectedtextcolor;
                                    notification_type = 'resort';
                                  });
                                },
                                child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                        color: resortbgcolor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'resort',
                                        style:
                                            TextStyle(color: resorttextcolor),
                                      ),
                                    )),
                              ),
                              // taxi.................................................
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    taxibgcolor = selectedbgcolor;
                                    taxitextcolor = selectedtextcolor;

                                    allbgcolor = resortbgcolor =
                                        travellerbgcolor = unselectedbgcolor;
                                    alltextcolor = resorttextcolor =
                                        travellertextcolor =
                                            unselectedtextcolor;
                                    notification_type = 'taxi';
                                  });
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                  width:
                                      MediaQuery.of(context).size.width * .18,
                                  decoration: BoxDecoration(
                                      color: taxibgcolor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      'taxi',
                                      style: TextStyle(color: taxitextcolor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (notification_type == 'all')
                  FirestoreQueryBuilder<Map<String, dynamic>>(
                    query: FirebaseFirestore.instance
                        .collection('notifications')
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  docData['text'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                if (notification_type == 'traveller')
                  FirestoreQueryBuilder<Map<String, dynamic>>(
                    query: FirebaseFirestore.instance
                        .collection('notifications')
                        .where('type', isEqualTo: 'traveller')
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  docData['text'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                if (notification_type == 'resort')
                  FirestoreQueryBuilder<Map<String, dynamic>>(
                    query: FirebaseFirestore.instance
                        .collection('notifications')
                        .where('type', isEqualTo: 'resort')
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  docData['text'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                if (notification_type == 'taxi')
                  FirestoreQueryBuilder<Map<String, dynamic>>(
                    query: FirebaseFirestore.instance
                        .collection('notifications')
                        .where('type', isEqualTo: 'taxi')
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
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  docData['text'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                //taxi..................................................................
                // Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                //   child: Text(
                //     'Today',
                //     style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.w400,
                //         color: Colors.black),
                //   ),
                // ), //today........................................................................
                // Padding(
                //   padding: const EdgeInsets.only(top: 8.0),
                //   child: Container(
                //     height: MediaQuery.of(context).size.height * .1,
                //     width: MediaQuery.of(context).size.width,
                //     decoration: BoxDecoration(
                //         color: const Color.fromARGB(255, 255, 255, 255),
                //         border: Border(
                //             top: BorderSide(color: Colors.black12),
                //             bottom: BorderSide(color: Colors.black12))),
                //     child: SingleChildScrollView(
                //       child: Column(
                //         children: [
                //           Row(
                //             mainAxisAlignment:
                //                 MainAxisAlignment.spaceBetween,
                //             children: [
                //               Column(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.only(
                //                         top: 8.0, left: 8.0, bottom: 4),
                //                     child: Container(
                //                       height: MediaQuery.of(context)
                //                               .size
                //                               .height *
                //                           .05,
                //                       width: MediaQuery.of(context)
                //                               .size
                //                               .width *
                //                           .1,
                //                       decoration: BoxDecoration(
                //                         color: Colors.white,
                //                         shape: BoxShape.circle,
                //                         border: Border.all(
                //                             color: Colors.white),
                //                         image: DecorationImage(
                //                           image: AssetImage(
                //                               "assets/images/david.png"),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Column(
                //                 children: [
                //                   Text("notification"),
                //                 ],
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(
                //                     top: 25.0, right: 8),
                //                 child: Icon(Icons.delete),
                //               )
                //             ],
                //           ),
                //           //firstbox...................................................................................
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   height: MediaQuery.of(context).size.height * .1,
                //   width: MediaQuery.of(context).size.width,
                //   decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 255, 255, 255),
                //       border: Border(
                //           bottom: BorderSide(color: Colors.black12))),
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment:
                //               MainAxisAlignment.spaceBetween,
                //           children: [
                //             Column(
                //               mainAxisAlignment:
                //                   MainAxisAlignment.spaceEvenly,
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       top: 8.0, left: 8.0, bottom: 4),
                //                   child: Container(
                //                     height: MediaQuery.of(context)
                //                             .size
                //                             .height *
                //                         .05,
                //                     width: MediaQuery.of(context)
                //                             .size
                //                             .width *
                //                         .1,
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       shape: BoxShape.circle,
                //                       border:
                //                           Border.all(color: Colors.white),
                //                       image: DecorationImage(
                //                         image: AssetImage(
                //                             "assets/images/david.png"),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //             Column(
                //               children: [
                //                 Text("notification"),
                //               ],
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(
                //                   top: 25.0, right: 8),
                //               child: Icon(Icons.delete),
                //             )
                //           ],
                //         ),
                //       ],
                //     ),
                //     //secondbox...................................................................
                //   ),
                // ),
                // ]),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
