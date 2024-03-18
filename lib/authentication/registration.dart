import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/parent_pages/parent_page.dart';
import 'package:wander_in/parent_pages/taxi_home.dart';
import 'package:wander_in/user_id.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController name = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController addressCtrl = TextEditingController();
  final TextEditingController charge = TextEditingController();
  final TextEditingController driver_experiense = TextEditingController();
  final TextEditingController seat_capcity = TextEditingController();
  final TextEditingController vehicle_number = TextEditingController();

  String _selectedUserType = 'Select user type';
  String _selectedVehicleType = 'Select vehicle type';
  String _selectedRegion = 'Region        ';
  // String _name = '';
  // String _email = '';
  String fileName = '';
  String licensefileName = '';
  String vehicleimagefileName = '';
  var file;
  var licenseFile;
  var vehicleImageFile;
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

  licensePickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      licenseFile = File(result.files.single.path!);
      licensefileName = result.files.single.name;
      setState(() {});
      // log(result.files.single.name);
    } else {
      // User canceled the picker
    }
  }

  vehicleImagepickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      vehicleImageFile = File(result.files.single.path!);
      vehicleimagefileName = result.files.single.name;
      setState(() {});
      // log(result.files.single.name);
    } else {
      // User canceled the picker
    }
  }

  uploadTaxiDetails() async {
    if (_selectedVehicleType.isNotEmpty &&
        vehicle_number.text.isNotEmpty &&
        driver_experiense.text.isNotEmpty &&
        addressCtrl.text.isNotEmpty &&
        charge.text.isNotEmpty &&
        seat_capcity.text.isNotEmpty &&
        file != null &&
        licenseFile != null &&
        vehicleImageFile != null) {
      setState(() {
        loading = true;
      });

      var storage = FirebaseStorage.instance;
      var snapshotone = await storage
          .ref()
          .child('records')
          .child(DateTime.now().toString() + fileName)
          .putFile(file);
      var downloadUrlone = await snapshotone.ref.getDownloadURL();

      var lisencesnapshotone = await storage
          .ref()
          .child('license')
          .child(DateTime.now().toString() + licensefileName)
          .putFile(licenseFile);
      var licensedownloadUrl = await lisencesnapshotone.ref.getDownloadURL();

      var vehicleImagesnapshotone = await storage
          .ref()
          .child('vehicle')
          .child(DateTime.now().toString() + vehicleimagefileName)
          .putFile(vehicleImageFile);
      var vehicleImagedownloadUrl =
          await vehicleImagesnapshotone.ref.getDownloadURL();

      FirebaseFirestore.instance.collection('taxi').doc(getuid()).set({
        'uid': getuid(),
        'name': name.text,
        'email': emailCtrl.text,
        'date': DateTime.now(),
        'image_url': downloadUrlone,
        'license_url': licensedownloadUrl,
        'vehicle_url': vehicleImagedownloadUrl,
        'region': _selectedRegion,
        'user_type': _selectedUserType,
        'mobile': getmobile(),
        'vehicle_number': vehicle_number.text,
        'vehicle_type': _selectedVehicleType,
        'driver_experience': driver_experiense.text,
        'address': addressCtrl.text,
        'charge': charge.text,
        'seat_capacity': seat_capcity.text,
        'lat': _selectedRegion == 'Bathery'
            ? '11.6342'
            : _selectedRegion == 'Kalpetta'
                ? '11.6103'
                : '11.8014',
        'long': _selectedRegion == 'Bathery'
            ? '76.2570'
            : _selectedRegion == 'Kalpetta'
                ? '76.0828'
                : '76.0044',
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
      newCustomMessage(context, 'All fields and Images are compulsory');
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
        FirebaseFirestore.instance
            .collection('taxi')
            .doc(getuid())
            .get()
            .then((DocumentSnapshot userDoc) {
          if (userDoc.exists) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TaxiHomePage()));
          } else {
            setState(() {
              loading = false;
            });
          }
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
        'name': name.text,
        'email': emailCtrl.text,
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
        'name': name.text,
        'email': emailCtrl.text,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    shrinkWrap: true,
                    // mainAxisAlignment: MainAxisAlignment.center,
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
                              controller: name,
                              decoration: InputDecoration(
                                hintText: "Enter your name",
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                              ),
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
                              controller: emailCtrl,
                              decoration: const InputDecoration(
                                hintText: "Enter your email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                              ),
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
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
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
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
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
                      if (_selectedUserType == 'Taxi Owner')
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
                                const Padding(
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10),
                                  child: Icon(Icons.car_repair_sharp),
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
                                      value: _selectedVehicleType,
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
                                          _selectedVehicleType = newValue!;
                                        });
                                      },
                                      items: <String>[
                                        'Select vehicle type',
                                        'Car',
                                        'Van',
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
                      if (_selectedUserType == 'Taxi Owner')
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
                                keyboardType: TextInputType.number,
                                controller: vehicle_number,
                                decoration: const InputDecoration(
                                  hintText: "Vehicle Registration Number",
                                  prefixIcon: Icon(
                                    Icons.car_rental,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_selectedUserType == 'Taxi Owner')
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
                                keyboardType: TextInputType.name,
                                controller: driver_experiense,
                                decoration: const InputDecoration(
                                  hintText: "Driver Experiense",
                                  prefixIcon: Icon(
                                    Icons.car_rental,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_selectedUserType == 'Taxi Owner')
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
                                keyboardType: TextInputType.name,
                                controller: addressCtrl,
                                decoration: const InputDecoration(
                                  hintText: "Address",
                                  prefixIcon: Icon(
                                    Icons.car_rental,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_selectedUserType == 'Taxi Owner')
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
                                keyboardType: TextInputType.number,
                                controller: charge,
                                decoration: const InputDecoration(
                                  hintText: "Charge per km",
                                  prefixIcon: Icon(
                                    Icons.car_rental,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_selectedUserType == 'Taxi Owner')
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
                                keyboardType: TextInputType.number,
                                controller: seat_capcity,
                                decoration: const InputDecoration(
                                  hintText: "Seat capacity",
                                  prefixIcon: Icon(
                                    Icons.car_rental,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (_selectedUserType == 'Taxi Owner')
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      licensePickFiles();
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: licenseFile == null
                                          ? Image.asset(
                                              'assets/images/license.png')
                                          : Image.file(licenseFile),
                                    ),
                                  ),
                                  Gap(8),
                                  const Text(
                                    'Add\nDriving License',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Gap(40),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      vehicleImagepickFiles();
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      child: vehicleImageFile == null
                                          ? Image.asset(
                                              'assets/images/add_vehicle.png')
                                          : Image.file(vehicleImageFile),
                                    ),
                                  ),
                                  Gap(8),
                                  const Text(
                                    'Add\nImage of Vehicle',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      const Gap(20),
                      ElevatedButton(
                          onPressed: () {
                            if (name.text.isNotEmpty &&
                                emailCtrl.text.isNotEmpty &&
                                _selectedUserType != 'Select user type' &&
                                _selectedRegion != 'Region        ') {
                              if (_selectedUserType == 'Taxi Owner') {
                                uploadTaxiDetails();
                              } else {
                                uploadDetails();
                              }
                            } else {
                              newCustomMessage(
                                  context, 'Please fill all fields');
                            }
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
