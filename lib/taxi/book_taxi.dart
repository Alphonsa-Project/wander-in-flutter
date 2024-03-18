import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Book Taxi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Text('Vehicle type: ${widget.taxiData['vehicle_type']}'),
            Gap(10),
            Text('Seat capacity: ${widget.taxiData['seat_capacity']} '),
            Gap(10),
            Text('Charge : ${widget.taxiData['charge']}/km '),
            Gap(10),
            Text('Driver name: ${widget.taxiData['name']}'),
            Gap(10),
            Text('Driver Experience: ${widget.taxiData['driver_experience']}'),
            Gap(10),
            Text('Vehicle number: ${widget.taxiData['vehicle_number']}'),
            Gap(10),
            Text('Phone number: ${widget.taxiData['mobile']}'),
            Gap(40),
            ElevatedButton(
                onPressed: () {
                  bookTaxi();
                },
                child: const Text('Book Taxi'))
          ]),
        ),
      ),
    );
  }

  bookTaxi() {
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
      Navigator.pop(context);
      newCustomMessage(context, 'Taxi Booking confirmed');
    });
  }
}