import 'package:flutter/material.dart';

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  String _selectedUserType = 'Traveller';
  String _selectedRegion = 'Bathery';
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Registration",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * .75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500.withOpacity(.5),
                        offset: Offset(1, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * .75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500.withOpacity(.5),
                        offset: Offset(1, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * .75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500.withOpacity(.5),
                        offset: Offset(1, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Icon(Icons.supervised_user_circle),
                      ),
                      Row(
                        children: [
                          Text(
                            "Select user type",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .13,
                          ),
                          DropdownButton<String>(
                            value: _selectedUserType,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedUserType = newValue!;
                              });
                            },
                            items: <String>[
                              'Traveller',
                              'Taxi Owner',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .075,
                  width: MediaQuery.of(context).size.width * .75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500.withOpacity(.5),
                        offset: Offset(1, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: Icon(Icons.location_pin),
                      ),
                      Row(
                        children: [
                          Text(
                            "Region",
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .24,
                          ),
                          DropdownButton<String>(
                            value: _selectedRegion,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedRegion = newValue!;
                              });
                            },
                            items: <String>[
                              'Bathery',
                              'Kalpetta',
                              'Mananthavady'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
