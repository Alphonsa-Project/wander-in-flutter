import 'package:flutter/material.dart';
import 'package:wander_in/parent_pages/GlassmorphismContainer.dart';

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
                    padding: const EdgeInsets.only(top: 20.0, left: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .20,
                      width: MediaQuery.of(context).size.width * .75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("assets/images/r1.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .20,
                            width: MediaQuery.of(context).size.width * .75,
                            color: Colors.black.withOpacity(0.2),
                          ),
                          Positioned(
                            bottom: 0,
                            child: GlassMorphismContainer(
                              height: MediaQuery.of(context).size.height * .05,
                              width: MediaQuery.of(context).size.width * .3,
                              borderRadius: 12,
                              child: Center(
                                child: Text(
                                  "data",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
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

                  //Recommended Images.....................................................................................................
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
