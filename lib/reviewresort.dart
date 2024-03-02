import 'package:flutter/material.dart';
import 'reviewidget.dart';

class reviewresort extends StatefulWidget {
  const reviewresort({super.key});

  @override
  State<reviewresort> createState() => _reviewresortState();
}

class _reviewresortState extends State<reviewresort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .15,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Color(0xfff9f4f4), boxShadow: [
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
                          'Notification',
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
                              'all',
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
                              'travelers',
                              style: TextStyle(color: Color(0xfff9f4f4)),
                            ),
                          ),
                        ),
                        //resort...................................................
                        Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .18,
                            decoration: BoxDecoration(
                                color: Color(0xffff0000),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'resort',
                                style: TextStyle(color: Color(0xfff9f4f4)),
                              ),
                            )),
                        // taxi.................................................
                        Container(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                              color: Color(0xffff0000),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'taxi',
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "nearby",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .17,
                          width: MediaQuery.of(context).size.width * .620,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                    width:
                                        MediaQuery.of(context).size.width * .20,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            bottomLeft: Radius.circular(12)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/da.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .20,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        image: DecorationImage(
                                          image:
                                              AssetImage("assets/images/r.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .20,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/da.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .04,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                        topRight: Radius.circular(12))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text("resortname")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .17,
                        width: MediaQuery.of(context).size.width * .620,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .2,
                                  width:
                                      MediaQuery.of(context).size.width * .20,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/da.png"),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.5),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                    width:
                                        MediaQuery.of(context).size.width * .20,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/r.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2.5),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                    width:
                                        MediaQuery.of(context).size.width * .20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/da.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .04,
                              width: MediaQuery.of(context).size.width * .3,
                              decoration: BoxDecoration(
                                  color: Colors.black54.withOpacity(.5),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text("resortname")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
