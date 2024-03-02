import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/parent_pages/parent_page.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  bool loading = true;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ParentPage()));
      } else {
        setState(() {
          loading = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(controller: name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(controller: email),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Registration",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 5,
                              offset: Offset(1, 2),
                            )
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(controller: email),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: Center(
                                      child: Icon(Icons.person,
                                          color: Colors.black))),
                              Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: TextFormField(
                                  controller: name,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 5,
                              offset: Offset(1, 2),
                            )
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: Center(
                                      child: Icon(Icons.email,
                                          color: Colors.black))),
                              Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: TextFormField(controller: email),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 5,
                              offset: Offset(1, 2),
                            )
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: Center(
                                      child: Icon(Icons.location_on,
                                          color: Colors.black))),
                              Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: const Text('Region'),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.width * .75,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 5,
                              offset: Offset(1, 2),
                            )
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .08,
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: Center(
                                      child: Icon(Icons.image,
                                          color: Colors.black))),
                              Padding(
                                padding: const EdgeInsets.only(right: 0.0),
                                child: Text('upload image'),
                              )
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text('submit'))
                    ],
                  ),
                ],
              ),
            )),
          );
  }
}
