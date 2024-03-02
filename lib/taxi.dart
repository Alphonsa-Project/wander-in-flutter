import 'package:flutter/material.dart';

class taxi extends StatefulWidget {
  const taxi({super.key});

  @override
  State<taxi> createState() => _taxiState();
}

class _taxiState extends State<taxi> {
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
                  decoration:
                      BoxDecoration(color: Color(0xfff9f4f4), boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 121, 4, 4).withOpacity(0.5),
                        blurRadius: 4,
                        offset: Offset(0, 4))
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
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      //recom.............................................................................................
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //all..........................................................................
                            Container(
                              height: MediaQuery.of(context).size.height * .03,
                              width: MediaQuery.of(context).size.width * .18,
                              decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    color: Color(0xfff9f4f4),
                                  ),
                                ),
                              ),
                            ),
                            //traveler....................................................................
                            Container(
                              height: MediaQuery.of(context).size.height * .03,
                              width: MediaQuery.of(context).size.width * .18,
                              decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  '4 Seater',
                                  style: TextStyle(color: Color(0xfff9f4f4)),
                                ),
                              ),
                            ),
                            //resort...................................................
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                                width: MediaQuery.of(context).size.width * .18,
                                decoration: BoxDecoration(
                                    color: Color(0xffff0000),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    '6 Seater',
                                    style: TextStyle(color: Color(0xfff9f4f4)),
                                  ),
                                )),
                            // taxi.................................................
                            Container(
                              height: MediaQuery.of(context).size.height * .03,
                              width: MediaQuery.of(context).size.width * .29,
                              decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Auto Rickshaws',
                                  style: TextStyle(color: Color(0xfff9f4f4)),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    'Nearby taxi',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(113, 255, 96, 96)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            // User Image
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/t1.png"),
                                    fit: BoxFit.cover, // Adjust this as needed
                                  ),
                                ),
                              ),
                            ),
                            // User Name and Vehicle Model Name
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // User Name
                                  Text(
                                    'User Name',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  // Vehicle Model Name
                                  Text(
                                    'Vehicle Model Name',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 18,
                                    height: 18,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.044,
                                    height: MediaQuery.of(context).size.height *
                                        0.022,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(113, 255, 96, 96)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            // User Image
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/t2.png"),
                                    fit: BoxFit.cover, // Adjust this as needed
                                  ),
                                ),
                              ),
                            ),
                            // User Name and Vehicle Model Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // User Name
                                      Text(
                                        'User Name',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      // Vehicle Model Name
                                      Text(
                                        'Vehicle Model Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.044,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.022,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(113, 255, 96, 96)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            // User Image
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.13,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/t3.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // User Name and Vehicle Model Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // User Name
                                      Text(
                                        'User Name',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      // Vehicle Model Name
                                      Text(
                                        'Vehicle Model Name',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.044,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.022,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //yesterday................................................................
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Text(
                    'Top Ranked',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(113, 255, 96, 96)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              // User Image
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/t4.png"),
                                      fit:
                                          BoxFit.cover, // Adjust this as needed
                                    ),
                                  ),
                                ),
                              ),
                              // User Name and Vehicle Model Name
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // User Name
                                        Text(
                                          'User Name',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Vehicle Model Name
                                        Text(
                                          'Vehicle Model Name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        SizedBox(height: 5),
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
                                                  BorderRadius.circular(10)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(113, 255, 96, 96)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              // User Image
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/t5.png"),
                                      fit:
                                          BoxFit.cover, // Adjust this as needed
                                    ),
                                  ),
                                ),
                              ),
                              // User Name and Vehicle Model Name
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // User Name
                                        Text(
                                          'User Name',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Vehicle Model Name
                                        Text(
                                          'Vehicle Model Name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        SizedBox(height: 5),
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
                                                  BorderRadius.circular(10)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(113, 255, 96, 96)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              // User Image
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.13,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/david.png"),
                                      fit:
                                          BoxFit.cover, // Adjust this as needed
                                    ),
                                  ),
                                ),
                              ),
                              // User Name and Vehicle Model Name
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // User Name
                                        Text(
                                          'User Name',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        // Vehicle Model Name
                                        Text(
                                          'Vehicle Model Name',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 18,
                                          height: 18,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        SizedBox(height: 5),
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
                                                  BorderRadius.circular(10)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
