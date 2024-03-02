import 'package:flutter/material.dart';

class placedetailonly extends StatefulWidget {
  const placedetailonly({super.key});

  @override
  State<placedetailonly> createState() => _placedetailonlyState();
}

class _placedetailonlyState extends State<placedetailonly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/r.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .75,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.black,
                Colors.black.withOpacity(.90),
                Colors.black.withOpacity(0.75),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.25),
                Colors.black.withOpacity(.0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 8),
                              child: Text(
                                "Himlayans",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, left: 15.0),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 8),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white.withOpacity(.9),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15.0, left: 8),
                              child: Text(
                                "details: ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0, left: 8),
                              child: Text(
                                'Mount Everest,    NepalElevation8,848.86 m (29,031.7 ft)Coordinates27°59′N 86°55′EDimensionsLength2,400 km (1,500 mi)NamingNative nameHimālaya (Sanskrit)',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(.7),
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(
                        //       top: 15.0, right: 10, left: 4),
                        //   child: SingleChildScrollView(
                        //     scrollDirection: Axis.horizontal,
                        //     child: Row(
                        //       children: [
                        //         Column(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.only(
                        //                   top: 10.0, left: 4),
                        //               child: Container(
                        //                 height:
                        //                     MediaQuery.of(context).size.height *
                        //                         .15,
                        //                 width:
                        //                     MediaQuery.of(context).size.width *
                        //                         .65,
                        //                 decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(12),
                        //                     color: Colors.white,
                        //                     boxShadow: [
                        //                       BoxShadow(
                        //                           color: Color.fromARGB(
                        //                               255, 0, 0, 0),
                        //                           blurRadius: 7,
                        //                           offset: Offset(1, 2))
                        //                     ],
                        //                     image: DecorationImage(
                        //                         image: AssetImage(
                        //                             "assets/images/da.png"),
                        //                         fit: BoxFit.cover)),
                        //               ),
                        //             ),
                        //             Text(
                        //               'himalaya',
                        //               style: TextStyle(
                        //                   fontSize: 15,
                        //                   color: Color.fromARGB(
                        //                       170, 255, 255, 255)),
                        //             ),
                        //           ],
                        //         ),
                        //         Column(
                        //           children: [
                        //             Padding(
                        //               padding: const EdgeInsets.only(
                        //                   top: 10.0, left: 20.0),
                        //               child: Container(
                        //                 height:
                        //                     MediaQuery.of(context).size.height *
                        //                         .15,
                        //                 width:
                        //                     MediaQuery.of(context).size.width *
                        //                         .65,
                        //                 decoration: BoxDecoration(
                        //                     borderRadius:
                        //                         BorderRadius.circular(12),
                        //                     color: Colors.white,
                        //                     boxShadow: [
                        //                       BoxShadow(
                        //                           color: Color.fromARGB(
                        //                               255, 0, 0, 0),
                        //                           blurRadius: 8,
                        //                           offset: Offset(1, 2))
                        //                     ]),
                        //               ),
                        //             ),
                        //             Text(
                        //               'place name',
                        //               style: TextStyle(
                        //                   fontSize: 15,
                        //                   color: Color.fromARGB(
                        //                       170, 255, 255, 255)),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
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
