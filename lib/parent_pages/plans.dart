import 'package:flutter/material.dart';

class Planspage extends StatefulWidget {
  const Planspage({Key? key}) : super(key: key);

  @override
  State<Planspage> createState() => _PlanspageState();
}

class _PlanspageState extends State<Planspage> {
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
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .13,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade900.withOpacity(0.5),
                                blurRadius: 4,
                                offset: Offset(1, 4))
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20.0, right: 25.0),
                                child: Text(
                                  'Plans',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 20.0, right: 20.0),
                                child: Icon(Icons.search),
                              )
                            ],
                          ),
                          //recom.............................................................................................
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 20.0, right: 20.0),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //all..........................................................................
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'trips',
                                        style: TextStyle(
                                          color: Color(0xfff9f4f4),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //traveler....................................................................
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'saves',
                                        style:
                                            TextStyle(color: Color(0xfff9f4f4)),
                                      ),
                                    ),
                                  ),
                                  //resort...................................................

                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .03,
                                    width:
                                        MediaQuery.of(context).size.width * .18,
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        'taxi',
                                        style:
                                            TextStyle(color: Color(0xfff9f4f4)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("date"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .25,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black26),
                              top: BorderSide(color: Colors.black26))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/r.png"),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(2, 0),
                                      blurRadius: 5),
                                ],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                  width: MediaQuery.of(context).size.width * .2,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.7),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                      )),
                                  child: Center(child: Text("plan name")),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .25,
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.black26),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/r.png"),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      offset: Offset(2, 0),
                                      blurRadius: 5),
                                ],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12))),
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .03,
                                  width: MediaQuery.of(context).size.width * .2,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.7),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                      )),
                                  child: Center(child: Text("plan name")),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
