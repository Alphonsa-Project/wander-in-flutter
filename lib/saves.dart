import 'package:flutter/material.dart';

class Savespage extends StatefulWidget {
  const Savespage({super.key});

  @override
  State<Savespage> createState() => _SavespageState();
}

class _SavespageState extends State<Savespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9f4f4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Saves",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                              'All',
                              style: TextStyle(
                                color: Color(0xfff9f4f4),
                              ),
                            ),
                          ),
                        ),
                        //resorts....................................................................
                        Container(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                              color: Color(0xffff0000),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Resorts',
                              style: TextStyle(color: Color(0xfff9f4f4)),
                            ),
                          ),
                        ),
                        //places...................................................
                        Container(
                            height: MediaQuery.of(context).size.height * .03,
                            width: MediaQuery.of(context).size.width * .18,
                            decoration: BoxDecoration(
                                color: Color(0xffff0000),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Places',
                                style: TextStyle(color: Color(0xfff9f4f4)),
                              ),
                            )),
                        // trips.................................................
                        Container(
                          height: MediaQuery.of(context).size.height * .03,
                          width: MediaQuery.of(context).size.width * .18,
                          decoration: BoxDecoration(
                              color: Color(0xffff0000),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Trips',
                              style: TextStyle(color: Color(0xfff9f4f4)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .20,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(1, 2))
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/images/r.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Icon(Icons.delete_rounded)),
                    ],
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
