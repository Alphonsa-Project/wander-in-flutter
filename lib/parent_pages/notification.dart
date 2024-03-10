import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                //notific.................................................................................................................

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
                                height:
                                    MediaQuery.of(context).size.height * .03,
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
                //taxi..................................................................
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    'Today',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 7.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(1, 4))
                            ],
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(1, 4))
                            ],
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(1, 4))
                            ],
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                ),
                //yesterday................................................................
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 50.0),
                  child: Text(
                    'Yesterday',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade900.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(1, 4))
                              ],
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade900.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(1, 4))
                              ],
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade100,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade900.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(1, 4)),
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(child: Text("tatata")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Colors.grey.shade900.withOpacity(0.5),
                                    blurRadius: 4,
                                    offset: Offset(1, 4))
                              ],
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(113, 255, 96, 96)
                                  .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
