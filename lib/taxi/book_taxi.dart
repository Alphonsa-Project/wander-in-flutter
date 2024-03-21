import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class BookTaxi extends StatefulWidget {
  final Map<String, dynamic> taxiData;
  final String user_name;
  const BookTaxi({super.key, required this.taxiData, required this.user_name});

  @override
  State<BookTaxi> createState() => _BookTaxiState();
}

class _BookTaxiState extends State<BookTaxi> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .6,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.red.shade900,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -50,
                              right: 2,
                              child: Container(
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(.2),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Positioned(
                              right: MediaQuery.of(context).size.height * .75,
                              child: Container(
                                height: MediaQuery.of(context).size.height * .4,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(.3),
                                    shape: BoxShape.circle),
                              ),
                            ),
                            Positioned(
                              top: 30,
                              right: 130,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .1,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            widget.taxiData['image_url']),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.taxiData['name'],
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                      Text(
                                        widget.taxiData['vehicle_type'] +
                                            ', (${widget.taxiData['vehicle_number']})',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                181, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: -200,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 2,
                            offset: Offset(2, 0))
                      ], color: Colors.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(shrinkWrap: true, children: [
                              Text(
                                  'Vehicle type: ${widget.taxiData['vehicle_type']}'),
                              Gap(10),
                              Text(
                                  'Seat capacity: ${widget.taxiData['seat_capacity']} '),
                              Gap(10),
                              Text('Charge : ${widget.taxiData['charge']}/km '),
                              Gap(10),
                              // Text('Driver name: ${widget.taxiData['name']}'),
                              // Gap(10),
                              Text(
                                  'Driver Experience: ${widget.taxiData['driver_experience']}'),
                              Gap(10),
                              Text(
                                  'Vehicle number: ${widget.taxiData['vehicle_number']}'),
                              Gap(10),
                              Text(
                                  'Phone number: ${widget.taxiData['mobile']}'),
                              Gap(40),
                              ElevatedButton(
                                  onPressed: () {
                                    bookTaxi();
                                  },
                                  child: const Text('Book Taxi'))
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          );
  }

  bookTaxi() {
    setState(() {
      loading = true;
    });
    var newBookingData = widget.taxiData;
    newBookingData['booking_time'] = DateTime.now();
    newBookingData['user_uid'] = getuid();
    newBookingData['user_phone'] = getmobile();
    newBookingData['user_name'] = widget.user_name;
    FirebaseFirestore.instance
        .collection('taxi_booking')
        .doc(newBookingData['uid'])
        .set(newBookingData)
        .then((value) {
      setState(() {
        loading = false;
      });
      Navigator.pop(context);
      newCustomMessage(context, 'Taxi Booking confirmed');
    });
  }
}





// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:wander_in/message/message.dart';
// import 'package:wander_in/user_id.dart';

// class BookTaxi extends StatefulWidget {
//   final Map<String, dynamic> taxiData;
//   final String user_name;
//   const BookTaxi({super.key, required this.taxiData, required this.user_name});

//   @override
//   State<BookTaxi> createState() => _BookTaxiState();
// }

// class _BookTaxiState extends State<BookTaxi> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Book Taxi',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ListView(children: [
//             Text('Vehicle type: ${widget.taxiData['vehicle_type']}'),
//             Gap(10),
//             Text('Seat capacity: ${widget.taxiData['seat_capacity']} '),
//             Gap(10),
//             Text('Charge : ${widget.taxiData['charge']}/km '),
//             Gap(10),
//             Text('Driver name: ${widget.taxiData['name']}'),
//             Gap(10),
//             Text('Driver Experience: ${widget.taxiData['driver_experience']}'),
//             Gap(10),
//             Text('Vehicle number: ${widget.taxiData['vehicle_number']}'),
//             Gap(10),
//             Text('Phone number: ${widget.taxiData['mobile']}'),
//             Gap(40),
//             ElevatedButton(
//                 onPressed: () {
//                   bookTaxi();
//                 },
//                 child: const Text('Book Taxi'))
//           ]),
//         ),
//       ),
//     );
//   }

//   bookTaxi() {
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
//       Navigator.pop(context);
//       newCustomMessage(context, 'Taxi Booking confirmed');
//     });
//   }
// }
