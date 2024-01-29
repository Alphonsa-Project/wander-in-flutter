import 'package:flutter/material.dart';

class account1 extends StatefulWidget {
  const account1({super.key});

  @override
  State<account1> createState() => _account1State();
}

class _account1State extends State<account1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 216, 216),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                                  image:
                                      AssetImage("assets/images/david.png"))),
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
                              color: Color.fromARGB(162, 0, 0, 0)),
                        ),
                      ),
                    ),
                    Center(
                      child: Text('joined in 2022',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(162, 0, 0, 0))),
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
                          'rank',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(162, 0, 0, 0)),
                        ),
                        Text(
                          '100',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(162, 0, 0, 0)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'points',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(162, 0, 0, 0)),
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(162, 0, 0, 0)),
                        ),
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
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
                              'Your Account',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(180, 172, 0, 0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10),
                          child: Text(
                            'Places traveled',
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
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .60,
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .60,
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
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .23,
                            width: MediaQuery.of(context).size.width * .92,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 255, 133, 133),
                                    blurRadius: 7,
                                    offset: Offset(1, 2))
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Posts',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(170, 172, 0, 0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/r.png"),
                                                      fit: BoxFit.cover),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 246, 105, 105))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 242, 127, 127))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 246, 105, 105))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 242, 127, 127))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10.0),
                                            child: Container(
                                              height: 50,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromARGB(
                                                            255, 94, 0, 0))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Text(
                            'Blogs',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 214, 93, 93)),
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .8,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(113, 255, 96, 96)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .8,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(113, 255, 96, 96)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width: MediaQuery.of(context).size.width * .8,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(113, 255, 96, 96)
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
