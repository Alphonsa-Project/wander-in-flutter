import 'package:flutter/material.dart';

class Resort2 extends StatefulWidget {
  const Resort2({Key? key});

  @override
  State<Resort2> createState() => _Resort2State();
}

class _Resort2State extends State<Resort2> {
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
                  Container(
                    height: MediaQuery.of(context).size.height * .15,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xfff9f4f4),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 121, 4, 4).withOpacity(0.5),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 20.0,
                                right: 20.0,
                              ),
                              child: Text(
                                'Resorts',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                            right: 20.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                                width: MediaQuery.of(context).size.width * .18,
                                decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                      color: Color(0xfff9f4f4),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                                width: MediaQuery.of(context).size.width * .18,
                                decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Nearby',
                                    style: TextStyle(
                                      color: Color(0xfff9f4f4),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                                width: MediaQuery.of(context).size.width * .20,
                                decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Top Rated',
                                    style: TextStyle(
                                      color: Color(0xfff9f4f4),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .03,
                                width: MediaQuery.of(context).size.width * .27,
                                decoration: BoxDecoration(
                                  color: Color(0xffff0000),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    'Recommended',
                                    style: TextStyle(
                                      color: Color(0xfff9f4f4),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Nearby Images.....................................................................................................
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      'Nearby',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 10,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //nearby 1st image............................................................................................
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    //first image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //second image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //third image container............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Resort name,',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                          Icon(Icons.place_outlined,
                                              color: Colors.amber, size: 18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .36,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //icon................................................................................................
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 3,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 35,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Nearby 2 image.................................................................................
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    //first image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //second image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //third image container............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Resort name,Location',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                          Icon(Icons.place_outlined,
                                              color: Colors.amber, size: 18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .36,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //icon................................................................................................
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 3,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 35,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Top Rated Images.....................................................................................................
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      'Top Rated',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      top: 10,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //Top Rated 1st image............................................................................................
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    //first image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //second image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //third image container............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Resort name,Location',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                          Icon(Icons.place_outlined,
                                              color: Colors.amber, size: 18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .36,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //icon................................................................................................
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 3,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 35,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Top Rated 2 image.................................................................................
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    //first image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //second image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //third image container............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Resort name,Location',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                          Icon(Icons.place_outlined,
                                              color: Colors.amber, size: 18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .36,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //icon................................................................................................
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 3,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 35,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Recommended Images.....................................................................................................
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, top: 10, bottom: 3),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //Recommended 1st image............................................................................................
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    //first image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //second image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //third image container............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Resort name,Location',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                          Icon(Icons.place_outlined,
                                              color: Colors.amber, size: 18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .36,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //icon................................................................................................
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 3,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 35,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //Recommended 2 image.................................................................................
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    //first image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //second image container.............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.5),
                                    //third image container............................................................................
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .22,
                                      width: MediaQuery.of(context).size.width *
                                          .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/r3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black54.withOpacity(.7),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        topRight: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Resort name,Location',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .01),
                                          Icon(Icons.place_outlined,
                                              color: Colors.amber, size: 18),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .36,
                                  height:
                                      MediaQuery.of(context).size.height * .045,
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(.5),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        topLeft: Radius.circular(12)),
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          //icon................................................................................................
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            '4.0',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 3,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 35,
                                child: Container(
                                  //shadow container...................................................................
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.black,
                                    size: 16,
                                  ),
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
          ),
        ),
      ),
    );
  }
}
