// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:wander_in/loading/loading.dart';
// import 'package:wander_in/message/message.dart';
// import 'package:wander_in/user_id.dart';

// class taxi1 extends StatefulWidget {
//   final Map<String, dynamic> taxiData;
//   final String user_name;
//   const taxi({super.key, required this.taxiData, required this.user_name});

//   @override
//   State<taxi> createState() => _taxiState();
// }

// class _taxiState extends State<taxi> {
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return loading
//         ? const Loading()
//         : Scaffold(
//             body: SafeArea(
//                 child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height * .6,
//                         width: MediaQuery.of(context).size.width,
//                         color: Colors.red.shade900,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: -50,
//                               right: 2,
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height * .2,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                     color: const Color.fromARGB(255, 0, 0, 0)
//                                         .withOpacity(.2),
//                                     shape: BoxShape.circle),
//                               ),
//                             ),
//                             Positioned(
//                               right: MediaQuery.of(context).size.height * .75,
//                               child: Container(
//                                 height: MediaQuery.of(context).size.height * .4,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                     color: const Color.fromARGB(255, 0, 0, 0)
//                                         .withOpacity(.3),
//                                     shape: BoxShape.circle),
//                               ),
//                             ),
//                             Positioned(
//                               top: 30,
//                               right: 130,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     height:
//                                         MediaQuery.of(context).size.height * .1,
//                                     width: MediaQuery.of(context).size.width,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       shape: BoxShape.circle,
//                                       border: Border.all(color: Colors.white),
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                             widget.taxiData['image_url']),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         widget.taxiData['name'],
//                                         style: TextStyle(
//                                             color: Color.fromARGB(
//                                                 255, 255, 255, 255)),
//                                       ),
//                                       Text(
//                                         widget.taxiData['vehicle_type'] +
//                                             ', (${widget.taxiData['vehicle_number']})',
//                                         style: TextStyle(
//                                             color: Color.fromARGB(
//                                                 181, 255, 255, 255)),
//                                       ),
//                                       // Text(
//                                       //   widget.taxiData['vehicle_number'],
//                                       //   style: TextStyle(
//                                       //       color:
//                                       //           Color.fromARGB(181, 255, 255, 255)),
//                                       // ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             // Positioned(
//                             //   top: 80,
//                             //   right: 100,
//                             //   child: Column(
//                             //     children: [
//                             //       Row(
//                             //         children: [
//                             //           Icon(
//                             //             Icons.star,
//                             //             color: Colors.amber,
//                             //             size: 18,
//                             //           ),
//                             //           Icon(
//                             //             Icons.star,
//                             //             color: Colors.amber,
//                             //             size: 18,
//                             //           ),
//                             //           Icon(
//                             //             Icons.star,
//                             //             color: Colors.amber,
//                             //             size: 18,
//                             //           ),
//                             //           Icon(
//                             //             Icons.star,
//                             //             color: Colors.amber,
//                             //             size: 18,
//                             //           ),
//                             //           Icon(
//                             //             Icons.star,
//                             //             color: Colors.white.withOpacity(.9),
//                             //             size: 18,
//                             //           ),
//                             //         ],
//                             //       ),
//                             //       Text(
//                             //         "4.0",
//                             //         style: TextStyle(color: Colors.white),
//                             //       )
//                             //     ],
//                             //   ),
//                             // )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                   Positioned(
//                     bottom: -200,
//                     child: Container(
//                       height: MediaQuery.of(context).size.height,
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(boxShadow: [
//                         BoxShadow(
//                             color: Colors.grey.shade500,
//                             blurRadius: 2,
//                             offset: Offset(2, 0))
//                       ], color: Colors.white),
//                       child: Column(
//                         children: [
//                           // Container(
//                           //   height: MediaQuery.of(context).size.height * .05,
//                           //   width: MediaQuery.of(context).size.width,
//                           //   decoration: BoxDecoration(
//                           //       color: const Color.fromARGB(255, 255, 255, 255),
//                           //       borderRadius: BorderRadius.only(
//                           //           topLeft: Radius.circular(20),
//                           //           topRight: Radius.circular(20)),
//                           //       border: Border(
//                           //           bottom: BorderSide(color: Colors.black12))),
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.all(10.0),
//                           //     child: Center(
//                           //         child: Text(
//                           //       "taxi account",
//                           //       style: TextStyle(fontSize: 18),
//                           //     )),
//                           //   ),
//                           // ),
//                           // Container(
//                           // child:
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ListView(shrinkWrap: true, children: [
//                               Text(
//                                   'Vehicle type: ${widget.taxiData['vehicle_type']}'),
//                               Gap(10),
//                               Text(
//                                   'Seat capacity: ${widget.taxiData['seat_capacity']} '),
//                               Gap(10),
//                               Text('Charge : ${widget.taxiData['charge']}/km '),
//                               Gap(10),
//                               // Text('Driver name: ${widget.taxiData['name']}'),
//                               // Gap(10),
//                               Text(
//                                   'Driver Experience: ${widget.taxiData['driver_experience']}'),
//                               Gap(10),
//                               Text(
//                                   'Vehicle number: ${widget.taxiData['vehicle_number']}'),
//                               Gap(10),
//                               Text(
//                                   'Phone number: ${widget.taxiData['mobile']}'),
//                               Gap(40),
//                               ElevatedButton(
//                                   onPressed: () {
//                                     bookTaxi();
//                                   },
//                                   child: const Text('Book Taxi'))
//                             ]),
//                           ),
//                           // ),
//                           // Container(
//                           //   height: MediaQuery.of(context).size.height * .1,
//                           //   width: MediaQuery.of(context).size.width,
//                           //   decoration: BoxDecoration(
//                           //       color: const Color.fromARGB(255, 255, 255, 255),
//                           //       border: Border(
//                           //           bottom: BorderSide(color: Colors.black12))),
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.all(10.0),
//                           //     child: Row(
//                           //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           //       children: [
//                           //         Icon(
//                           //           Icons.local_taxi,
//                           //           color: Colors.red,
//                           //           size: 30,
//                           //         ),
//                           //         Center(
//                           //           child: SingleChildScrollView(
//                           //             scrollDirection: Axis.vertical,
//                           //             child: Column(
//                           //               mainAxisAlignment: MainAxisAlignment.center,
//                           //               children: [
//                           //                 Padding(
//                           //                   padding: const EdgeInsets.only(
//                           //                       top: 25.0, right: 5, left: 5),
//                           //                   child: Container(
//                           //                     height:
//                           //                         MediaQuery.of(context).size.height *
//                           //                             .005,
//                           //                     width:
//                           //                         MediaQuery.of(context).size.width *
//                           //                             .5,
//                           //                     decoration: BoxDecoration(
//                           //                         color: Colors.amber,
//                           //                         borderRadius:
//                           //                             BorderRadius.circular(20)),
//                           //                   ),
//                           //                 ),
//                           //                 Padding(
//                           //                   padding: const EdgeInsets.all(8.0),
//                           //                   child: Text(
//                           //                     "distance",
//                           //                     style: TextStyle(
//                           //                         color: const Color.fromARGB(
//                           //                             255, 0, 0, 0)),
//                           //                   ),
//                           //                 )
//                           //               ],
//                           //             ),
//                           //           ),
//                           //         ),
//                           //         Icon(
//                           //           Icons.location_pin,
//                           //           color: Colors.red,
//                           //           size: 30,
//                           //         ),
//                           //       ],
//                           //     ),
//                           //   ),
//                           // ),
//                           // Container(
//                           //   width: MediaQuery.of(context).size.width,
//                           //   height: MediaQuery.of(context).size.height * .50,
//                           // ),
//                           // Container(
//                           //   height: MediaQuery.of(context).size.height * .1,
//                           //   width: MediaQuery.of(context).size.width,
//                           //   decoration: BoxDecoration(
//                           //       color: const Color.fromARGB(255, 255, 255, 255),
//                           //       border:
//                           //           Border(top: BorderSide(color: Colors.black12))),
//                           //   child: Center(
//                           //     child: Padding(
//                           //       padding: const EdgeInsets.all(8.0),
//                           //       child: Column(
//                           //         children: [
//                           //           Text(
//                           //             "book the taxi",
//                           //             style: TextStyle(
//                           //                 color: const Color.fromARGB(255, 0, 0, 0)),
//                           //           ),
//                           //           Padding(
//                           //             padding: const EdgeInsets.all(8.0),
//                           //             child: Container(
//                           //               height: 20,
//                           //               width: 100,
//                           //               decoration: BoxDecoration(
//                           //                 color: Colors.black,
//                           //                 borderRadius: BorderRadius.circular(20),
//                           //               ),
//                           //               child: Center(
//                           //                   child: Text(
//                           //                 "book",
//                           //                 style: TextStyle(color: Colors.white),
//                           //               )),
//                           //             ),
//                           //           )
//                           //         ],
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//           );
//   }

//   bookTaxi() {
//     setState(() {
//       loading = true;
//     });
//     var newBookingData = widget.taxiData;
//     newBookingData['booking_time'] = DateTime.now();
//     newBookingData['user_uid'] = getuid();
//     newBookingData['user_phone'] = getmobile();
//     newBookingData['user_name'] = widget.user_name;
//     FirebaseFirestore.instance
//         .collection('taxi_booking')
//         .doc(newBookingData['uid'])
//         .set(newBookingData)
//         .then((value) {
//       setState(() {
//         loading = false;
//       });
//       Navigator.pop(context);
//       newCustomMessage(context, 'Taxi Booking confirmed');
//     });
//   }
// }
