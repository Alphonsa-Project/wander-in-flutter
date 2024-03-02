import 'package:flutter/material.dart';

class review extends StatefulWidget {
  const review({super.key});

  @override
  State<review> createState() => _reviewState();
}

class _reviewState extends State<review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 0),

      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(118, 255, 255, 255),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //davidbeckam.................................................
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                            "assets/images/david.png",
                          ))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(
                        child: Text(
                          'david beckam',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 121, 4, 4)),
                        ),
                      ),
                    ),
                    Center(
                      child: Text('joined in 2022',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 121, 4, 4))),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'places',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 121, 4, 4)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Location.png"))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Resorts',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 121, 4, 4)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Home.png"))),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Taxi',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 121, 4, 4)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Taxi.png"))),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 255, 133, 133),
                              blurRadius: 5,
                              offset: Offset(1, 2))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Start a review',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Color.fromARGB(180, 172, 0, 0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              'Recently traveled',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(180, 172, 0, 0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
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
                                                    color: Color.fromARGB(
                                                        255, 255, 133, 133),
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
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(170, 172, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 20.0),
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
                                                    color: const Color.fromARGB(
                                                        255, 255, 133, 133),
                                                    blurRadius: 8,
                                                    offset: Offset(1, 2))
                                              ]),
                                        ),
                                      ),
                                      Text(
                                        'place name',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(170, 172, 0, 0)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              'Visited Resorts',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(180, 172, 0, 0)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
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
                                                    color: Color.fromARGB(
                                                        255, 255, 133, 133),
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
                                        'Resort',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(170, 172, 0, 0)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 20.0),
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
                                                    color: const Color.fromARGB(
                                                        255, 255, 133, 133),
                                                    blurRadius: 8,
                                                    offset: Offset(1, 2))
                                              ]),
                                        ),
                                      ),
                                      Text(
                                        'Resort name',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(170, 172, 0, 0)),
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
              ),
            ],
          ),
        ),
      )),
    );
  }
}
