import 'package:flutter/material.dart';
import 'package:wander_in/GlassMorphismContainer.dart';

class noti2 extends StatefulWidget {
  const noti2({Key? key}) : super(key: key);

  @override
  State<noti2> createState() => _noti2State();
}

class _noti2State extends State<noti2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Change the background color if needed
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 255, 17, 0)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Your noti2 content here
                        Container(
                          height: MediaQuery.of(context).size.height * .15,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 255, 0, 0),
                                Color.fromARGB(255, 33, 0, 0)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20.0, right: 20.0),
                                    child: Text(
                                      'Notification',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                              // Other content of noti2
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 20.0, right: 20.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //all..........................................................................
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: GlassMorphismContainer(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .049,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .25,
                                          child: Center(
                                            child: Text(
                                              'All',
                                              style: TextStyle(
                                                  color: Color(0xfff9f4f4)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //traveler....................................................................
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: GlassMorphismContainer(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .049,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .25,
                                          child: Center(
                                            child: Text(
                                              'Traveler',
                                              style: TextStyle(
                                                  color: Color(0xfff9f4f4)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      //resort...................................................
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: GlassMorphismContainer(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .049,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .25,
                                          child: Center(
                                            child: Text(
                                              'Resort',
                                              style: TextStyle(
                                                  color: Color(0xfff9f4f4)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // taxi.................................................
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, left: 8),
                                        child: GlassMorphismContainer(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .049,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .25,
                                          child: Center(
                                            child: Text(
                                              'Taxi',
                                              style: TextStyle(
                                                  color: Color(0xfff9f4f4)),
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
                        // Additional content of noti2
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text(
                            'Today',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassMorphismContainer(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Your notification content here
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassMorphismContainer(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Your notification content here
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassMorphismContainer(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Your notification content here
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        //yesterday................................................................
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                          child: Text(
                            'Yesterday',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassMorphismContainer(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Resort fjdfhak dhfakfh kashdfadfj lahf ahf fdsiuhf laksjdfh iuahdf aidhfjak afalkh fkl',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassMorphismContainer(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Your notification content here
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlassMorphismContainer(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .9,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // Your notification content here
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
