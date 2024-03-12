import 'package:flutter/material.dart';

class taxi1 extends StatefulWidget {
  const taxi1({super.key});

  @override
  State<taxi1> createState() => _taxi1State();
}

class _taxi1State extends State<taxi1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //notific.................................................................................................................

                            Container(
                              height: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500
                                            .withOpacity(.5),
                                        blurRadius: 5.0,
                                        spreadRadius: .0,
                                        offset: Offset(4.0, 4.0))
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 20.0, right: 20.0),
                                        child: Text(
                                          'Taxi',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //recom.............................................................................................
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20.0, right: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //all..........................................................................
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500
                                                        .withOpacity(.5),
                                                    blurRadius: 5.0,
                                                    spreadRadius: .0,
                                                    offset: Offset(4.0, 4.0)),
                                              ]),
                                          child: Center(
                                            child: Text(
                                              'All',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500
                                                        .withOpacity(.5),
                                                    blurRadius: 5.0,
                                                    spreadRadius: .0,
                                                    offset: Offset(4.0, 4.0)),
                                              ]),
                                          child: Center(
                                            child: Text(
                                              '4 seater',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        //resort...................................................
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .18,
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500
                                                        .withOpacity(.5),
                                                    blurRadius: 5.0,
                                                    spreadRadius: .0,
                                                    offset: Offset(4.0, 4.0)),
                                              ]),
                                          child: Center(
                                            child: Text(
                                              '5 seater',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        // taxi.................................................
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .29,
                                          decoration: BoxDecoration(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.shade500
                                                        .withOpacity(.5),
                                                    blurRadius: 5.0,
                                                    spreadRadius: .0,
                                                    offset: Offset(4.0, 4.0))
                                              ]),
                                          child: Center(
                                            child: Text(
                                              'Auto Rickshaws',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //taxi..................................................................

                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.black12),
                                            bottom: BorderSide(
                                                color: Colors.black12))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.13,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/t1.png"),
                                                  fit: BoxFit
                                                      .cover, // Adjust this as needed
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Text(
                                                  'User Name',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              // Vehicle Model Name
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Vehicle Model Name',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                            255, 1, 1, 1)
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0, top: 8, bottom: 8),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.088,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.044,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.022,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.044,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.022,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.black12))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.13,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/t1.png"),
                                                  fit: BoxFit
                                                      .cover, // Adjust this as needed
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Text(
                                                  'User Name',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              // Vehicle Model Name
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Vehicle Model Name',
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                            255, 1, 1, 1)
                                                        .withOpacity(0.7),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0, top: 8, bottom: 8),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.088,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.044,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.022,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.044,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.022,
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //yesterday................................................................
                          ]))))),
    );
  }
}
