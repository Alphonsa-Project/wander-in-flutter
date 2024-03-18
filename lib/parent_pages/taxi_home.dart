import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/authentication/authstate.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/user_id.dart';

class TaxiHomePage extends StatefulWidget {
  const TaxiHomePage({super.key});

  @override
  State<TaxiHomePage> createState() => _TaxiHomePageState();
}

class _TaxiHomePageState extends State<TaxiHomePage> {
  Map<String, dynamic> bookingdoc = {};
  bool loading = true;
  bool is_booking = false;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('taxi_booking')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot bookingDoc) {
      if (bookingDoc.exists) {
        bookingdoc = bookingDoc.data() as Map<String, dynamic>;

        setState(() {
          is_booking = true;
          loading = false;
        });
      } else {
        setState(() {
          is_booking = false;
          loading = false;
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
            appBar: AppBar(
              title: const Text('WANDER.IN'),
              automaticallyImplyLeading: false,
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  logoutpopup();
                },
                child: const Icon(Icons.logout)),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    if (!is_booking)
                      Gap(MediaQuery.of(context).size.height * .4),
                    if (!is_booking)
                      const Text(
                        'you have no bookings currently!!!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    if (is_booking)
                      Text('Vehicle type: ${bookingdoc['vehicle_type']}'),
                    if (is_booking) Gap(10),
                    if (is_booking)
                      Text('Seat capacity: ${bookingdoc['seat_capacity']} '),
                    if (is_booking) Gap(10),
                    if (is_booking)
                      Text('Charge : ${bookingdoc['charge']}/km '),
                    if (is_booking) Gap(10),
                    if (is_booking) Text('Driver name: ${bookingdoc['name']}'),
                    if (is_booking) Gap(10),
                    if (is_booking)
                      Text(
                          'Driver Experience: ${bookingdoc['driver_experience']}'),
                    if (is_booking) Gap(10),
                    if (is_booking)
                      Text('Vehicle number: ${bookingdoc['vehicle_number']}'),
                    if (is_booking) Gap(30),
                    if (is_booking)
                      Text('User Phone number: ${bookingdoc['user_phone']}'),
                    if (is_booking) Gap(10),
                    if (is_booking)
                      Text('User name: ${bookingdoc['user_name']}'),
                    const Gap(40),
                    if (is_booking)
                      ElevatedButton(
                          onPressed: () {
                            completeRide();
                          },
                          child: const Text('Ride completed'))
                  ],
                ),
              ),
            ),
          );
  }

  completeRide() {
    FirebaseFirestore.instance
        .collection('taxi_booking')
        .doc(getuid())
        .delete()
        .then((value) {
      setState(() {
        is_booking = !is_booking;
      });
    });
  }

  logoutpopup() => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Center(
            child: Text(
              'Logout?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          content: const Row(
            children: [
              Spacer(),
              Text(
                '            Are you sure            ',
                style: TextStyle(color: Colors.black),
              ),
              Spacer()
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProjectAuthState()));
              },
              child: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'yes',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.green,
                child: const Padding(
                  padding:
                      EdgeInsets.only(bottom: 8, top: 8, left: 10, right: 10),
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        barrierDismissible: true,
      );
}
