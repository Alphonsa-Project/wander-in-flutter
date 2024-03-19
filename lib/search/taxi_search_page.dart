import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/search/hotel_search_page.dart';
import 'package:wander_in/search/place_search_page.dart';
import 'package:wander_in/search/resort_search_page.dart';
import 'package:wander_in/search/taxi_search_page.dart';
import 'package:wander_in/taxi.dart';
import 'package:wander_in/taxi/book_taxi.dart';
import 'package:wander_in/taxi1.dart';

class TaxiSearchPageResult extends StatefulWidget {
  final Map<String, dynamic> userdoc;

  const TaxiSearchPageResult({Key? key, required this.userdoc})
      : super(key: key);

  @override
  State<TaxiSearchPageResult> createState() => _TaxiSearchPageResultState();
}

class _TaxiSearchPageResultState extends State<TaxiSearchPageResult> {
  //String searchitem = 'stores';
  String name = '';
  String search_type = 'taxi';
  Color selectedcolor = Colors.black;
  Color unselectedcolor = Colors.white;

  // Color stationcolor = Colors.black;
  // Color placecolor = Colors.white;

  @override
  void initState() {
    // takezone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        // statusBarColor: Color.fromARGB(255, 27, 121, 202),
      ),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            toolbarHeight: 120,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Color(0xffffffff),
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.dark, //<-- For iOS SEE HERE (dark icons)
            ),
            title: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: .7,
                              offset: const Offset(.5, 1),
                              blurRadius: 5,
                              color: const Color(0x0fd3d3d3).withOpacity(.8),
                            ),
                          ]),
                      child: InkWell(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 0, 67, 144),
                            ),
                            const Gap(10),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * .7,
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: const Color.fromARGB(255, 230, 234, 248),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      setState(() {
                                        name = val.toUpperCase();
                                      });
                                    },
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      height: .8,
                                    ),
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                      hintText: 'Search',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: SizedBox(
                      //  height: 60,
                      // child: ListView(
                      //     physics: const BouncingScrollPhysics(),
                      //     children: [
                      //       const Gap(10),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelSearchPageResult(
                                                userdoc: widget.userdoc,
                                              )));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .039,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: .1,
                                        offset: const Offset(.3, 1),
                                        blurRadius: 2,
                                        color: const Color(0x0fd3d3d3)
                                            .withOpacity(.8),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '  Hotel  ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: .7,
                                          color: search_type == 'hotel'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlaceSearchPageResult(
                                                userdoc: widget.userdoc,
                                              )));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .039,
                                  // width:
                                  //     MediaQuery.of(context).size.width * .25,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: .1,
                                        offset: const Offset(.3, 1),
                                        blurRadius: 2,
                                        color: const Color(0x0fd3d3d3)
                                            .withOpacity(.8),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '  Place  ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: .7,
                                          color: search_type == 'place'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TaxiSearchPageResult(
                                                userdoc: widget.userdoc,
                                              )));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .039,
                                  // width:
                                  //     MediaQuery.of(context).size.width * .25,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: .1,
                                        offset: const Offset(.3, 1),
                                        blurRadius: 2,
                                        color: const Color(0x0fd3d3d3)
                                            .withOpacity(.8),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '  Taxi  ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: .7,
                                          color: search_type == 'taxi'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              Gap(10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResortSearchPageResult(
                                                userdoc: widget.userdoc,
                                              )));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .039,
                                  // width:
                                  //     MediaQuery.of(context).size.width * .25,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        spreadRadius: .1,
                                        offset: const Offset(.3, 1),
                                        blurRadius: 2,
                                        color: const Color(0x0fd3d3d3)
                                            .withOpacity(.8),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '  Resort  ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          height: .7,
                                          color: search_type == 'resort'
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(10),
                            ],
                          ),
                        ),
                      ),
                      //  ]),
                    ),
                  )
                ],
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xffffffff),
            elevation: 0,
            actions: const [],
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  if (search_type == "taxi")
                    FirestoreQueryBuilder<Map<String, dynamic>>(
                      query: FirebaseFirestore.instance
                          .collection("taxi")
                          // .where('status', isEqualTo: true)
                          .where("vehicle_type_search_key",
                              isGreaterThanOrEqualTo: name)
                          .where("vehicle_type_search_key",
                              isLessThanOrEqualTo: "$name\uf7ff")
                          .limit(20),
                      pageSize: 10,
                      builder: (context, snapshot, _) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.docs.length,
                          // separatorBuilder: (context, index) {
                          //   return SizedBox();
                          // },
                          itemBuilder: (context, index) {
                            if (snapshot.hasMore &&
                                index + 1 == snapshot.docs.length) {
                              snapshot.fetchMore();
                            }

                            final station = snapshot.docs[index].data();
                            final docid = snapshot.docs[index].id;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BookTaxi(
                                              user_name: widget.userdoc['name'],
                                              taxiData: station,
                                            )),
                                  );
                                  // if (station['status'] == true) {
                                  //   // Navigator.pushReplacement(
                                  //   //   context,
                                  //   //   MaterialPageRoute(
                                  //   //       builder: (context) => SlotPage(
                                  //   //             docid: docid,
                                  //   //             station_doc: station,
                                  //   //           )),
                                  //   // );
                                  // } else {
                                  //   newCustomMessage(
                                  //       context, 'currently not available');
                                  // }
                                },
                                child: Container(
                                  // height: 60,
                                  width:
                                      MediaQuery.of(context).size.width * .85,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsetsDirectional.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        station['vehicle_type'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        station['region'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        station['seat_capacity'] +
                                            ' Seater (' +
                                            station['vehicle_number'] +
                                            ')',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //   crossAxisCount: 1,
                          //   //  childAspectRatio: .8,
                          // ),
                        );
                      },
                    ),
                ],
              )
            ],
          )),
    );
  }
}
