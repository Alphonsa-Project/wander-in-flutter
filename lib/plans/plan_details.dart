import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/user_id.dart';

class PlanDetails extends StatefulWidget {
  final String plan_name;
  final String plan_id;
  const PlanDetails(
      {super.key, required this.plan_name, required this.plan_id});

  @override
  State<PlanDetails> createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.plan_name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'destinations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            const Gap(20),
            FirestoreQueryBuilder<Map<String, dynamic>>(
              query: FirebaseFirestore.instance
                  .collection('plans')
                  .doc(widget.plan_id)
                  .collection('destinations'),
              builder: (context, snapshot, _) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                      snapshot.fetchMore();
                    }

                    final docData = snapshot.docs[index].data();
                    final document_id = snapshot.docs[index].id;
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.height * .50,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.black12),
                            top: BorderSide(color: Colors.black12)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: FadeInImage(
                                      image: NetworkImage(docData['user_img']),
                                      placeholder: const AssetImage(
                                          'assets/images/profile.png'),
                                      fit: BoxFit.cover,
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        docData['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            // width:
                            //     MediaQuery.of(context).size.width,
                            // height:
                            //     MediaQuery.of(context).size.height *
                            //         .35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(docData['img_url']),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        .35,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                          Colors.black,
                                          Colors.black.withOpacity(0.5),
                                          Colors.black.withOpacity(.0)
                                        ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center))),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        docData['place'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Column(
                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.all(8.0),
                              //       child: Text(
                              //           " ${docData['liked_users'].length} likes"),
                              //     ),
                              //     if (!docData['liked_users']
                              //         .contains(getuid()))
                              //       GestureDetector(
                              //         onTap: () {
                              //           FirebaseFirestore.instance
                              //               .collection('feed')
                              //               .doc(document_id)
                              //               .update({
                              //             'liked_users':
                              //                 docData['liked_users'] +
                              //                     [getuid()],
                              //           });
                              //         },
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(8.0),
                              //           child: Icon(
                              //               Icons.favorite_border_outlined),
                              //         ),
                              //       ),
                              //     if (docData['liked_users'].contains(getuid()))
                              //       GestureDetector(
                              //         onTap: () {
                              //           FirebaseFirestore.instance
                              //               .collection('feed')
                              //               .doc(document_id)
                              //               .update({
                              //             'liked_users': docData['liked_users']
                              //                 .where((item) => item != getuid())
                              //                 .toList(),
                              //           });
                              //         },
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(8.0),
                              //           child: Icon(
                              //             Icons.favorite,
                              //             color: Colors.red,
                              //           ),
                              //         ),
                              //       ),
                              //     // GestureDetector(
                              //     //   onTap: () {
                              //     //     Navigator.push(
                              //     //         context,
                              //     //         MaterialPageRoute(
                              //     //             builder: (context) =>
                              //     //                 AddToPlans(
                              //     //                   feedDoc:
                              //     //                       docData,
                              //     //                 )));
                              //     //   },
                              //     //   child: Padding(
                              //     //     padding:
                              //     //         const EdgeInsets.all(8.0),
                              //     //     child: Icon(
                              //     //         Icons.add_circle_outline),
                              //     //   ),
                              //     // )
                              //   ],
                              // ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
