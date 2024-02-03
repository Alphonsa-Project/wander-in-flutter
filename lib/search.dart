import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f4f4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .025,
                      width: MediaQuery.of(context).size.width * .7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .25,
                            child: Center(child: const Text("top places")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .25,
                            child: Center(child: const Text("travelers")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .25,
                            child: Center(child: const Text("resort")),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 25),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.width * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.width * .2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ], //photos........................................................................................
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .15,
                          width: MediaQuery.of(context).size.width * .42,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(1, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/images/p3.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 25),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .16,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(1, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("assets/images/p2.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 25),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      width: MediaQuery.of(context).size.width * .95,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(1, 2)),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/images/p1.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 25),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .06,
                      width: MediaQuery.of(context).size.width * .95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
