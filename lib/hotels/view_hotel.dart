import 'package:flutter/material.dart';

class ViewHotel extends StatefulWidget {
  final Map<String, dynamic> hotelDoc;
  const ViewHotel({Key? key, required this.hotelDoc}) : super(key: key);

  @override
  State<ViewHotel> createState() => _ViewHotelState();
}

class _ViewHotelState extends State<ViewHotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * 0.35,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage("assets/images/r1.png"),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.hotelDoc['imageUrl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                widget.hotelDoc['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '${widget.hotelDoc['rate']}/person (avg)',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.hotelDoc['location'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20.0),
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         height:
                        //             MediaQuery.of(context).size.height * .08,
                        //         width: MediaQuery.of(context).size.width * 0.99,
                        //         decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(20),
                        //           boxShadow: [
                        //             BoxShadow(
                        //               color: Colors.grey,
                        //               blurRadius: 5,
                        //               offset: Offset(1, 2),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Positioned(
                        //         bottom: 18,
                        //         left: 0,
                        //         right: 0,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Text(
                        //                 "4.5 Ratings",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: 17,
                        //                   color: Colors.black,
                        //                 ),
                        //               ),
                        //               SizedBox(width: 5),
                        //               Icon(
                        //                 Icons.star,
                        //                 color: Colors.amber,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Positioned(
                        //         bottom: 0,
                        //         left: 0,
                        //         right: 0,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Text(
                        //             "10 reviews",
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //               color: Colors.grey,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //features.......................................................................................
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: const Text(
                            "Features",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0, right: 5, left: 5),
                            child: Row(
                              children: [
                                //container!.................................................................................
                                if (widget.hotelDoc['is_wifi'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.wifi_outlined,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "WiFi",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                if (widget.hotelDoc['is_pool'])
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (widget.hotelDoc['is_pool'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.water_outlined,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Pool",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.hotelDoc['is_parking'])
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (widget.hotelDoc['is_parking'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.local_parking,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Parking",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.hotelDoc['is_dining'])
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (widget.hotelDoc['is_dining'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.fastfood_outlined,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Dining",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: const Text(
                            "Description",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        Text(
                          widget.hotelDoc['desc'],
                          style: TextStyle(fontSize: 17, color: Colors.grey),
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
    );
  }
}
