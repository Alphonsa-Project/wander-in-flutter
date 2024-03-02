import 'package:flutter/material.dart';

class posts extends StatefulWidget {
  const posts({super.key});

  @override
  State<posts> createState() => _postsState();
}

class _postsState extends State<posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 225, 225),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(101, 24, 24, 24),
                        blurRadius: 7,
                        offset: Offset(1, 2))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
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
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'david beckam',
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(162, 0, 0, 0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    'posts',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(162, 0, 0, 0)),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 10),
                    child: Text(
                      'sort',
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(162, 0, 0, 0)),
                    ),
                  ),
                ),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 20.0, top: 20),
            //   child: Text(
            //     'sort',
            //     style: TextStyle(
            //         fontSize: 15, color: Color.fromARGB(198, 0, 0, 0)),
            //   ),
            // ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .195,
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/r.png'),
                                  fit: BoxFit.cover),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(112, 24, 24, 24),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .195,
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(171, 24, 24, 24),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .195,
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(112, 24, 24, 24),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .195,
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(171, 24, 24, 24),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .195,
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(85, 24, 24, 24),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .195,
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(96, 24, 24, 24),
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
