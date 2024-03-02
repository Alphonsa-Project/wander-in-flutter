import 'package:flutter/material.dart';

class places extends StatefulWidget {
  const places({super.key});

  @override
  State<places> createState() => _placesState();
}

class _placesState extends State<places> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 118, 118),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.58,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/da.png"),
                        fit: BoxFit.cover)),
              ),

              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
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
                              'himalaya',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(180, 172, 0, 0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10),
                          child: Text(
                            'images',
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .15,
                                        width:
                                            MediaQuery.of(context).size.width *
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, bottom: 10.0),
                                child: Text(
                                  'details',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(170, 172, 0, 0)),
                                ),
                              ),
                              Text(
                                "detailsdfdfsgjfsdgfdsfdsdhwwsqqqqqssssssssssssssssssssssssssssssssssssssssssssssssssssssssszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsssssssssssssssssssssssssssgfgfdhgh",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(170, 172, 0, 0)),
                              ),
                            ],
                          ),
                        ),
                      ],
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
