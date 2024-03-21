import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class ViewResort extends StatefulWidget {
  final Map<String, dynamic> resortDoc;

  const ViewResort({Key? key, required this.resortDoc}) : super(key: key);

  @override
  State<ViewResort> createState() => _ViewResortState();
}

class _ViewResortState extends State<ViewResort> {
  bool is_picked_start_date = false;
  bool is_picked_end_date = false;
  DateTime picked_start_date = DateTime.now();
  DateTime picked_end_date = DateTime.now();
  final TextEditingController roomCtrl = TextEditingController();
  Map<String, dynamic> userdoc = {};

  @override
  void initState() {
    roomCtrl.text = '0';
    FirebaseFirestore.instance
        .collection('users')
        .doc(getuid())
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        userdoc = userDoc.data() as Map<String, dynamic>;
      } else {
        newCustomMessage(context, 'something went wrong');
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * 0.35,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage("assets/images/r1.png"),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.resortDoc['imageUrl']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(1, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                widget.resortDoc['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                '${widget.resortDoc['rate']}/day',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.resortDoc['location'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20.0),
                        //   child: Stack(
                        //     children: [
                        //       Container(
                        //         height:
                        //             MediaQuery.of(context).size.height * .08,
                        //         width: MediaQuery.of(context).size.width * 0.99,
                        //         decoration: BoxDecoration(
                        //           color: Colors.white,
                        //           borderRadius: BorderRadius.circular(20),
                        //           boxShadow: [
                        //             BoxShadow(
                        //               color: Colors.grey,
                        //               blurRadius: 5,
                        //               offset: Offset(1, 2),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Positioned(
                        //         bottom: 18,
                        //         left: 0,
                        //         right: 0,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Row(
                        //             mainAxisAlignment: MainAxisAlignment.center,
                        //             children: [
                        //               Text(
                        //                 "4.5 Ratings",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: 17,
                        //                   color: Colors.black,
                        //                 ),
                        //               ),
                        //               SizedBox(width: 5),
                        //               Icon(
                        //                 Icons.star,
                        //                 color: Colors.amber,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //       Positioned(
                        //         bottom: 0,
                        //         left: 0,
                        //         right: 0,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Text(
                        //             "10 reviews",
                        //             textAlign: TextAlign.center,
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //               color: Colors.grey,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        //features.......................................................................................
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: const Text(
                            "Features",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 10.0, right: 5, left: 5),
                            child: Row(
                              children: [
                                //container!.................................................................................
                                if (widget.resortDoc['is_wifi'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.wifi_outlined,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "WiFi",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                if (widget.resortDoc['is_pool'])
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (widget.resortDoc['is_pool'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.water_outlined,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Pool",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.resortDoc['is_parking'])
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (widget.resortDoc['is_parking'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.local_parking,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Parking",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (widget.resortDoc['is_dining'])
                                  SizedBox(
                                    width: 10,
                                  ),
                                if (widget.resortDoc['is_dining'])
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .12,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(1, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.fastfood_outlined,
                                          size: 40,
                                          color: Colors.blueGrey,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Dining",
                                          style: TextStyle(
                                            fontSize: 18, //
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                          child: const Text(
                            "Description",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                          ),
                        ),
                        Text(
                          widget.resortDoc['desc'],
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _showstartDialog(context);
                              },
                              child: Column(
                                children: [
                                  const Text(
                                    'Starting date',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  if (is_picked_start_date)
                                    Text(
                                        '${picked_start_date.day}/${picked_start_date.month}/${picked_start_date.year}')
                                ],
                              ),
                            ),
                            Gap(20),
                            GestureDetector(
                              onTap: () {
                                _showendDialog(context);
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'Ending date',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                  ),
                                  if (is_picked_end_date)
                                    Text(
                                        '${picked_end_date.day}/${picked_end_date.month}/${picked_end_date.year}')
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(30),
                        Center(
                          child: Padding(
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
                                  controller: roomCtrl,
                                  decoration: const InputDecoration(
                                    hintText: "Number of Rooms",
                                    prefixIcon: Icon(
                                      Icons.bed,
                                      color: Colors.black,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Gap(20),
                        Center(
                          child: ElevatedButton(
                              onPressed: () {
                                if (is_picked_start_date == true &&
                                    is_picked_end_date == true &&
                                    int.parse(roomCtrl.text) >= 1) {
                                  bookResort();
                                } else {
                                  newCustomMessage(context,
                                      'please select all details correctly');
                                }
                              },
                              child: const Text('Book Resort')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bookResort() {
    Map<String, dynamic> newResortData = widget.resortDoc;
    newResortData['starting_date'] = picked_start_date;
    newResortData['ending_date'] = picked_end_date;
    newResortData['number_of_rooms'] = roomCtrl.text;
    newResortData['user_name'] = userdoc['name'];
    newResortData['user_phone'] = userdoc['mobile'];
    newResortData['user_email'] = userdoc['email'];
    newResortData['user_image_url'] = userdoc['image_url'];
    newResortData['user_uid'] = userdoc['uid'];
    newResortData['status'] = 'pending';
    newResortData['booking_time'] = DateTime.now();

    FirebaseFirestore.instance
        .collection('resort_booking')
        .doc()
        .set(newResortData)
        .then((value) {
      newCustomMessage(context, 'Booking confirmed');
      Navigator.pop(context);
    });
  }

  _showstartDialog(
    BuildContext context,
  ) async {
    picked_start_date = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return the AlertDialog or SimpleDialog widget here.
        return DatePickerDialog(
          helpText: 'Starting Date of Booking',
          confirmText: 'Confirm starting date',
          cancelText: '',
          initialDate: picked_start_date,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
    );
    setState(() {
      is_picked_start_date = true;
    });
  }

  _showendDialog(
    BuildContext context,
  ) async {
    picked_end_date = await showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return the AlertDialog or SimpleDialog widget here.
        return DatePickerDialog(
          helpText: 'Ending Date of Booking',
          cancelText: '',
          confirmText: 'Confirm ending date',
          initialDate: picked_start_date,
          firstDate: picked_start_date,
          lastDate: DateTime(2100),
          // onDateChanged: (value) {},
        );
      },
    );
    setState(() {
      is_picked_end_date = true;
    });
  }
}
