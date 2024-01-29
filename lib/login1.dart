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
      backgroundColor: Color(0xffD50100),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .40,
              width: MediaQuery.of(context).size.width * .95,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/whats.png"))),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'L O G I N',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .75,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 0, 0),
                                blurRadius: 5,
                                offset: Offset(1, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                        child: Text(
                          'username',
                          style: TextStyle(
                              fontSize: 17, color: Colors.red.withOpacity(.5)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(.80),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .75,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 94, 0, 0),
                                blurRadius: 5,
                                offset: Offset(1, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 8.0),
                        child: Text(
                          'password',
                          style: TextStyle(
                              fontSize: 17, color: Colors.red.withOpacity(.5)),
                        ),
                      ),
                    ),
                  ),
                  Text('')
                ],
              ),
            )
          ],
        ),
      )),
    );
    ;
  }
}
