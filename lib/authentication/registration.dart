import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/parent_pages/parent_page.dart';
import 'package:wander_in/user_id.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  String _selectedUserType = 'Select user type';
  String _selectedRegion = 'Region        ';
  String _name = '';
  String _email = '';
  String fileName = '';
  var file;
  bool loading = true;
  String imageUrl = '';

  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      fileName = result.files.single.name;
      setState(() {});
      // log(result.files.single.name);
    } else {
      // User canceled the picker
    }
  }

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ParentPage()));
      } else {
        setState(() {
          loading = false;
        });
      }
    });
    super.initState();
  }

  uploadDetails() async {
    setState(() {
      loading = true;
    });
    if (file != null) {
      var storage = FirebaseStorage.instance;
      var snapshotone = await storage
          .ref()
          .child('records')
          .child(DateTime.now().toString() + fileName)
          .putFile(file);
      var downloadUrlone = await snapshotone.ref.getDownloadURL();
      FirebaseFirestore.instance.collection('users').doc(getuid()).set({
        'uid': getuid(),
        'name': _name,
        'email': _email,
        'date': DateTime.now(),
        'image_url': downloadUrlone,
        'region': _selectedRegion,
        'user_type': _selectedUserType,
        'mobile': getmobile(),
      }).then((value) {
        newCustomMessage(context, 'Registration Successfull');
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ParentPage()));
      });
    } else {
      FirebaseFirestore.instance.collection('users').doc(getuid()).set({
        'uid': getuid(),
        'name': _name,
        'email': _email,
        'date': DateTime.now(),
        'image_url':
            'https://firebasestorage.googleapis.com/v0/b/wanderin-bd650.appspot.com/o/profile_11748522.png?alt=media&token=7bb2d1a9-d319-4fc8-bcc0-338cd0ce4a34',
        'region': _selectedRegion,
        'user_type': _selectedUserType,
        'mobile': getmobile(),
      }).then((value) {
        newCustomMessage(context, 'Registration Successfull');
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ParentPage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
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
                    const Gap(20),
                    GestureDetector(
                      onTap: () {
                        pickFiles();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        child: file == null
                            ? Image.asset('assets/images/add_profile.png')
                            : Image.file(file),
                      ),
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
                            decoration: const InputDecoration(
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
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Icon(Icons.supervised_user_circle),
                            ),
                            Row(
                              children: [
                                // Text(
                                //   "Select user type",
                                //   style: TextStyle(
                                //       color: Colors.black87, fontSize: 15),
                                // ),
                                // SizedBox(
                                //   width:
                                //       MediaQuery.of(context).size.width * .13,
                                // ),
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
                                    'Select user type',
                                    'Traveller',
                                    'Taxi Owner',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Icon(Icons.location_pin),
                            ),
                            Row(
                              children: [
                                // Text(
                                //   "Region",
                                //   style: TextStyle(
                                //       color: Colors.black87, fontSize: 15),
                                // ),
                                // SizedBox(
                                //   width:
                                //       MediaQuery.of(context).size.width * .24,
                                // ),
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
                                    'Region        ',
                                    'Bathery',
                                    'Kalpetta',
                                    'Mananthavady'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {
                          if (_name.isNotEmpty &&
                              _email.isNotEmpty &&
                              _selectedUserType != 'Select user type' &&
                              _selectedRegion != 'Region        ') {
                            uploadDetails();
                          } else {
                            newCustomMessage(context, 'Please fill all fields');
                          }
                        },
                        child: const Text('Submit'))
                  ],
                ),
              ),
            ),
          );
  }
}
