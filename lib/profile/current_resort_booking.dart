import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/user_id.dart';

class CurrentResortBookings extends StatefulWidget {
  const CurrentResortBookings({super.key});

  @override
  State<CurrentResortBookings> createState() => _CurrentResortBookingsState();
}

class _CurrentResortBookingsState extends State<CurrentResortBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resort bookings'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          FirestoreQueryBuilder<Map<String, dynamic>>(
            query: FirebaseFirestore.instance
                .collection('resort_booking')
                .where('user_uid', isEqualTo: getuid())
                .orderBy('booking_time', descending: true),
            builder: (context, snapshot, _) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                    snapshot.fetchMore();
                  }

                  final docData = snapshot.docs[index].data();
                  final document_id = snapshot.docs[index].id;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 224, 224, 224))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .16,
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .12,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                                //fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/images/hotel.png"))),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  //fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/images/location2.png"))),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          docData['location'],
                                          style: TextStyle(
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          'l',
                                          style: TextStyle(
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${docData['starting_date'].toDate().day}/${docData['starting_date'].toDate().month}/${docData['starting_date'].toDate().year}',
                                          style: TextStyle(
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .6,
                                      child: Text(
                                        docData['name'],
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .02,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  //fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/images/per.png"))),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          docData['user_name'],
                                          style: const TextStyle(
                                              height: 1,
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          'l',
                                          style: TextStyle(
                                              height: 1,
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${docData['number_of_rooms']} Room',
                                          style: const TextStyle(
                                              height: 1,
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          'l',
                                          style: TextStyle(
                                              height: 1,
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                        Text(
                                          ' Status ${docData['number_of_rooms']}',
                                          style: const TextStyle(
                                              height: 1,
                                              color: Color(0xff6D6C6C),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // const Padding(
                            //   padding: EdgeInsets.only(right: 15.0),
                            //   child: Icon(Icons.arrow_forward_ios),
                            // )
                          ]),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
