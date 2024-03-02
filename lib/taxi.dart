import 'package:flutter/material.dart';

class taxi extends StatefulWidget {
  const taxi({super.key});

  @override
  State<taxi> createState() => _taxiState();
}

class _taxiState extends State<taxi> {
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
                        right: MediaQuery.of(context).size.height * .75,
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
                            Text(
                              "4.0",
                              style: TextStyle(color: Colors.white),
                            )
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
                        child: Center(child: Text("taxi account")),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          border: Border(
                              bottom: BorderSide(color: Colors.black12))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.local_taxi,
                              color: Colors.amber,
                              size: 30,
                            ),
                            Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 25.0, right: 5, left: 5),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .008,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "distance",
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              Icons.location_pin,
                              color: Colors.amber,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .50,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          border:
                              Border(top: BorderSide(color: Colors.black12))),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "book the taxi",
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 0, 0, 0)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade700,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "book",
                                    style: TextStyle(color: Colors.white),
                                  )),
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
          ],
        ),
      )),
    );
  }
}
