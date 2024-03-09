import 'package:flutter/material.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Rec section ...............................................................
                  Row(
                    // mainAxisAlignment:,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 70,
                      )
                    ],
                  ),
                  //Trav section ...............................................................
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Text(
                      'Travelers',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/t1.png"))),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/t2.png"))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/t3.png"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/t4.png"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/t5.png"))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //places..........................................................................
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Text('Places'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 10, bottom: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .18,
                            width: MediaQuery.of(context).size.width * .6,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 94, 0, 0),
                                      blurRadius: 5,
                                      offset: Offset(1, 2))
                                ],
                                image: DecorationImage(
                                    image: AssetImage("assets/images/r.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .18,
                          width: MediaQuery.of(context).size.width * .6,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(255, 94, 0, 0),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ],
                              image: DecorationImage(
                                  image: AssetImage("assets/images/r.png"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //people.................................................................................
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .04,
                              width: MediaQuery.of(context).size.width * .09,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage("assets/images/t5.png"),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'Tyler Durden',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .04,
                          width: MediaQuery.of(context).size.width * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                          ),
                          child: Center(
                              child: Text(
                            'follow',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .23,
                            width: MediaQuery.of(context).size.width * .95,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 94, 0, 0),
                                      blurRadius: 5,
                                      offset: Offset(0, 2))
                                ],
                                image: DecorationImage(
                                    image: AssetImage("assets/images/r.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .23,
                            width: MediaQuery.of(context).size.width * .95,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(255, 94, 0, 0),
                                      blurRadius: 5,
                                      offset: Offset(1, 2))
                                ],
                                image: DecorationImage(
                                    image: AssetImage("assets/images/r.png"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Text(
                  //   "mhkjhj's",
                  //   style: TextStyle(
                  //       fontSize: 55,
                  //       color: Color(0xff0000000),
                  //       fontWeight: FontWeight.w700,
                  //       fontFamily: 'fam'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
