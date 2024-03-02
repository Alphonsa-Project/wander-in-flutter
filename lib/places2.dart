import 'package:flutter/material.dart';

class places2 extends StatefulWidget {
  const places2({super.key});

  @override
  State<places2> createState() => _places2State();
}

class _places2State extends State<places2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              //  Stack ...........................................................................................
              children: [
                // image container.................................................................................
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/da.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 5,
                              right: 10,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  Icon(Icons.star, color: Colors.yellow),
                                  SizedBox(width: 4),
                                  Text(
                                    '5.0',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              left: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Himalaya',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.38,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/r1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //container positioned over the image........................................................................
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 133, 133),
                          blurRadius: 5,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Colors.yellow),
                                Text("Location",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Text("Description",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Column(
                              children: [
                                Text(
                                  "Here goes the decription about the place",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          // add to plans........................................................................................
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 55),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Add to plans",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.amber,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //add to saves...............................................................................
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 55),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 15,
                                  left: 0,
                                  right: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Add to saves",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.amber,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Nearby resorts............................................................................................
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              'Nearby Resorts',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  //nearby resorts first image..............................................................................
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 7,
                                                    offset: Offset(1, 2))
                                              ],
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/r2.png"),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Text(
                                        'Resort name',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  //nearby resorts second image...............................................................
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 5.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/r3.png"),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 8,
                                                    offset: Offset(1, 2))
                                              ]),
                                        ),
                                      ),
                                      Text(
                                        'Resort name',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  //nearby resorts third image..........................................................................
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 5.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .2,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/r1.png"),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 8,
                                                    offset: Offset(1, 2))
                                              ]),
                                        ),
                                      ),
                                      Text(
                                        'Resort name',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //recommended places...............................................................................
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 10),
                            child: Text(
                              'Recommended Places',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, top: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .15,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .65,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 7,
                                                    offset: Offset(1, 2))
                                              ],
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/da.png"),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      Text(
                                        'himalaya',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .15,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .65,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/da.png"),
                                                  fit: BoxFit.cover),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 8,
                                                    offset: Offset(1, 2))
                                              ]),
                                        ),
                                      ),
                                      Text(
                                        'place name',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
