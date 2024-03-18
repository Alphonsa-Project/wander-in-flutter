import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/GlassMorphismContainer.dart';
import 'package:wander_in/authentication/authstate.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/profile/blogs.dart';
import 'package:wander_in/places2.dart';
import 'package:wander_in/posts.dart';
import 'package:wander_in/posts1.dart';
import 'package:wander_in/profile/current_taxi_booking.dart';
import 'package:wander_in/profile/edit_profile.dart';
import 'package:wander_in/profile/post.dart';
import 'package:wander_in/resort2.dart';
import 'package:wander_in/resortview.dart';
import 'package:wander_in/saves.dart';
import 'package:wander_in/taxi.dart';
import 'package:wander_in/user_id.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '';
  String img_url = '';
  Map<String, dynamic> userdoc = {};
  bool loading = true;

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        name = userDoc['name'];
        img_url = userDoc['image_url'];
        userdoc = userDoc.data() as Map<String, dynamic>;
        setState(() {
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
            body: SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Gap(10),
                        Container(
                          height: MediaQuery.of(context).size.height * .5,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .5,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/r.png"),
                                  fit: BoxFit.cover),
                            ),
                            child: GlassMorphismContainer(
                              height: MediaQuery.of(context).size.height * .5,
                              width: MediaQuery.of(context).size.width,
                              borderRadius: 0,
                              // child: Stack(
                              //   children: [
                              child: Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Center(
                                  // top: 30,
                                  // right: 130,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: img_url.isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: FadeInImage(
                                                  image: NetworkImage(img_url),
                                                  placeholder: const AssetImage(
                                                      'assets/images/profile.png'),
                                                  fit: BoxFit.cover,
                                                  width: 80.0,
                                                  height: 80.0,
                                                ),
                                              )
                                            : SizedBox(
                                                width: 80,
                                                height: 80,
                                                child: Image.asset(
                                                    'assets/images/profile.png'),
                                              ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          // Text(
                                          //   "hyundai creta",
                                          //   style: TextStyle(
                                          //       color: Color.fromARGB(
                                          //           181, 255, 255, 255)),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .20,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade500,
                                  blurRadius: 2,
                                  offset: Offset(2, 0))
                            ],
                            color: Colors.white),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserPosts(
                                                uid: getuid(),
                                                name: name,
                                                user_img: img_url,
                                              )));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("posts"),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Blogs(uid: getuid())));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("blogs"),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CurrentTaxiBooking()));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Current Taxi Booking"),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditProfile(
                                                userDoc: userdoc,
                                              )));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .1,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black12))),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text("Edit Profile"),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => places2()));
                              //   },
                              //   child: Container(
                              //     height: MediaQuery.of(context).size.height * .1,
                              //     width: MediaQuery.of(context).size.width,
                              //     decoration: BoxDecoration(
                              //         color: const Color.fromARGB(255, 255, 255, 255),
                              //         border: Border(
                              //             bottom: BorderSide(color: Colors.black12))),
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Padding(
                              //           padding: const EdgeInsets.all(8.0),
                              //           child: Text("places trvelled"),
                              //         ),
                              //         Icon(Icons.navigate_next),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              const Gap(80),
                              ElevatedButton(
                                  onPressed: () {
                                    logoutpopup();
                                  },
                                  child: const Text('Logout'))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          );
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
