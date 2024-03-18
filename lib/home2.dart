import 'package:flutter/material.dart';
import 'package:wander_in/GlassMorphismContainer.dart';

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/r1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/r1.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purpleAccent,
                        Colors.deepPurple,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: GlassMorphismContainer(
                  height: MediaQuery.of(context).size.height * 0.63,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Resort name',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '3000/D',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                width: MediaQuery.of(context).size.width * 0.99,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.deepPurple,
                                      blurRadius: 5,
                                      offset: Offset(1, 2),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 18,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4.5 Ratings",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "10 reviews",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .12,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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

                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .12,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .12,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .12,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          "Here goes the contents of description box",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
