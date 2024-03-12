import 'package:flutter/material.dart';

class login1 extends StatefulWidget {
  const login1({super.key});

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Registration",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .075,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500.withOpacity(.5),
                    offset: Offset(1, 2),
                    blurRadius: 5)
              ]),
              child: Center(
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Enter your name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: InputBorder.none)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .075,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500.withOpacity(.5),
                    offset: Offset(1, 2),
                    blurRadius: 5)
              ]),
              child: Center(
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "enter your emaill",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        border: InputBorder.none)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .075,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500.withOpacity(.5),
                    offset: Offset(1, 2),
                    blurRadius: 5)
              ]),
              child: Center(
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_pin,
                          color: Colors.black,
                        ),
                        border: InputBorder.none)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .075,
              width: MediaQuery.of(context).size.width * .75,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500.withOpacity(.5),
                    offset: Offset(1, 2),
                    blurRadius: 5)
              ]),
              child: Center(
                child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_pin,
                          color: Colors.black,
                        ),
                        border: InputBorder.none)),
              ),
            ),
          )
        ]),
      )),
    );
  }
}
