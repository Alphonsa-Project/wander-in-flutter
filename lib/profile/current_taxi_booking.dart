import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class CurrentTaxiBooking extends StatefulWidget {
  const CurrentTaxiBooking({
    super.key,
  });

  @override
  State<CurrentTaxiBooking> createState() => _CurrentTaxiBookingState();
}

class _CurrentTaxiBookingState extends State<CurrentTaxiBooking> {
  Map<String, dynamic> taxiBookingData = {};
  bool loading = true;
  bool haveData = false;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('taxi_booking')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        taxiBookingData = userDoc.data() as Map<String, dynamic>;
        setState(() {
          loading = false;
          haveData = true;
        });
      } else {
        setState(() {
          haveData = false;
          loading = false;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Book Taxi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (!haveData)
                      const Center(
                        child: Text('currently you have no bookings'),
                      ),
                    if (haveData)
                      ListView(shrinkWrap: true, children: [
                        Text(
                            'Vehicle type: ${taxiBookingData['vehicle_type']}'),
                        Gap(10),
                        Text(
                            'Seat capacity: ${taxiBookingData['seat_capacity']} '),
                        Gap(10),
                        Text('Charge : ${taxiBookingData['charge']}/km '),
                        Gap(10),
                        Text(
                            'Driver name: ${taxiBookingData['name_of_driver']}'),
                        Gap(10),
                        Text(
                            'Driver Experience: ${taxiBookingData['driver_experience']}'),
                        Gap(10),
                        Text(
                            'Vehicle number: ${taxiBookingData['vehicle_number']}'),
                        Gap(10),
                        Text('Phone number: ${taxiBookingData['phone']}'),
                        Gap(40),
                        ElevatedButton(
                            onPressed: () {
                              cancelTaxi();
                            },
                            child: const Text('Cancel booking'))
                      ]),
                  ],
                ),
              ),
            ),
          );
  }

  cancelTaxi() {
    FirebaseFirestore.instance
        .collection('taxi_booking')
        .doc(getuid())
        .delete()
        .then((value) {
      Navigator.pop(context);
      newCustomMessage(context, 'Taxi Booking Cancelled');
    });
  }
}
