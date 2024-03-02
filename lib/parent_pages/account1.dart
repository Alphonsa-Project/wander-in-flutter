import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/authentication/authstate.dart';

class account1 extends StatefulWidget {
  const account1({super.key});

  @override
  State<account1> createState() => _account1State();
}

class _account1State extends State<account1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 255, 0, 0),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -50,
                        right: 2,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(.2),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        right: -100,
                        child: Container(
                          height: MediaQuery.of(context).size.height * .4,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(.3),
                              shape: BoxShape.circle),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 130,
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * .1,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/david.png"),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "taxi driver",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                Text(
                                  "hyundai creta",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(181, 255, 255, 255)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 80,
                        right: 100,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'rank',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              161, 255, 255, 255)),
                                    ),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              161, 255, 255, 255)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'rank',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                161, 255, 255, 255)),
                                      ),
                                      Text(
                                        '100',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                161, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'rank',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                161, 255, 255, 255)),
                                      ),
                                      Text(
                                        '100',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                161, 255, 255, 255)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: -200,
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
                      Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(child: Text("your account")),
                        ),
                      ),
                      // Container(
                      //   height: MediaQuery.of(context).size.height * .27,
                      //   width: MediaQuery.of(context).size.width,
                      //   decoration: BoxDecoration(
                      //       color: const Color.fromARGB(255, 255, 255, 255),
                      //       border: Border(
                      //           bottom: BorderSide(color: Colors.black12))),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(10.0),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.start,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text("places traveled"),
                      //         Padding(
                      //           padding: const EdgeInsets.only(top: 8.0),
                      //           child: SingleChildScrollView(
                      //             scrollDirection: Axis.horizontal,
                      //             child: Row(
                      //               children: [
                      //                 Column(
                      //                   children: [
                      //                     Padding(
                      //                       padding: const EdgeInsets.only(
                      //                           top: 10.0),
                      //                       child: Container(
                      //                         height: MediaQuery.of(context)
                      //                                 .size
                      //                                 .height *
                      //                             .15,
                      //                         width: MediaQuery.of(context)
                      //                                 .size
                      //                                 .width *
                      //                             .60,
                      //                         decoration: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(12),
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                   color: Colors
                      //                                       .grey.shade500,
                      //                                   blurRadius: 7,
                      //                                   offset: Offset(1, 2))
                      //                             ],
                      //                             image: DecorationImage(
                      //                                 image: AssetImage(
                      //                                     "assets/images/da.png"),
                      //                                 fit: BoxFit.cover)),
                      //                       ),
                      //                     ),
                      //                     Text(
                      //                       'himalaya',
                      //                       style: TextStyle(
                      //                           fontSize: 15,
                      //                           color: Colors.black),
                      //                     ),
                      //                   ],
                      //                 ),
                      //                 Padding(
                      //                   padding:
                      //                       const EdgeInsets.only(left: 8.0),
                      //                   child: Column(
                      //                     children: [
                      //                       Padding(
                      //                         padding: const EdgeInsets.only(
                      //                             top: 10.0),
                      //                         child: Container(
                      //                           height: MediaQuery.of(context)
                      //                                   .size
                      //                                   .height *
                      //                               .15,
                      //                           width: MediaQuery.of(context)
                      //                                   .size
                      //                                   .width *
                      //                               .60,
                      //                           decoration: BoxDecoration(
                      //                             borderRadius:
                      //                                 BorderRadius.circular(12),
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                   color: Colors
                      //                                       .grey.shade500,
                      //                                   blurRadius: 7,
                      //                                   offset: Offset(1, 2))
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       Text(
                      //                         'himalaya',
                      //                         style: TextStyle(
                      //                             fontSize: 15,
                      //                             color: Colors.black),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 Padding(
                      //                   padding:
                      //                       const EdgeInsets.only(left: 10.0),
                      //                   child: Icon(Icons.navigate_next),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("posts"),
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("blogs"),
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .1,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            border: Border(
                                bottom: BorderSide(color: Colors.black12))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("places trvelled"),
                            ),
                            Icon(Icons.navigate_next),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .12,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      FirebaseAuth.instance.signOut();
                                      setState(() {});
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ProjectAuthState()));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .04,
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      decoration: BoxDecoration(
                                        color: Colors.red.shade700,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "logout",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )
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
          ],
        ),
      )),
    );
  }
}
