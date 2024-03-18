import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/plans/plan_details.dart';
import 'package:wander_in/user_id.dart';

class Planspage extends StatefulWidget {
  const Planspage({Key? key}) : super(key: key);

  @override
  State<Planspage> createState() => _PlanspageState();
}

class _PlanspageState extends State<Planspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade900.withOpacity(0.5),
                                  blurRadius: 4,
                                  offset: Offset(1, 4))
                            ]),
                        child: const Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, top: 20.0, right: 25.0),
                                  child: Text(
                                    'Plans',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       left: 20.0, top: 20.0, right: 20.0),
                                //   child: Icon(Icons.search),
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10.0),
                    //   child: Text("date"),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    FirestoreQueryBuilder<Map<String, dynamic>>(
                      query: FirebaseFirestore.instance
                          .collection('plans')
                          .where('uid', isEqualTo: getuid())
                          .orderBy('date', descending: true),
                      builder: (context, snapshot, _) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.docs.length,
                          itemBuilder: (context, index) {
                            if (snapshot.hasMore &&
                                index + 1 == snapshot.docs.length) {
                              snapshot.fetchMore();
                            }

                            final docData = snapshot.docs[index].data();
                            final document_id = snapshot.docs[index].id;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlanDetails(
                                                    plan_name:
                                                        docData['plan_name'],
                                                    plan_id: document_id,
                                                  )));
                                    },
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .2,
                                      width: MediaQuery.of(context).size.width *
                                          .75,
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          if (docData['image_url'].isNotEmpty)
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .75,
                                                child: FadeInImage(
                                                  image: NetworkImage(
                                                      docData['image_url']),
                                                  placeholder: const AssetImage(
                                                      'assets/images/r.png'),
                                                  fit: BoxFit.cover,
                                                  width: 60.0,
                                                  height: 60.0,
                                                ),
                                              ),
                                            ),
                                          if (docData['image_url'].isEmpty)
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .2,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .75,
                                                child: const FadeInImage(
                                                  image: AssetImage(
                                                      'assets/images/r.png'),
                                                  placeholder: AssetImage(
                                                      'assets/images/r.png'),
                                                  fit: BoxFit.cover,
                                                  width: 60.0,
                                                  height: 60.0,
                                                ),
                                              ),
                                            ),
                                          Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .03,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .2,
                                              decoration: BoxDecoration(
                                                  color: Colors.white
                                                      .withOpacity(.7),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(12),
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                      docData['plan_name']))),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Gap(20),
                                  GestureDetector(
                                    onTap: () {
                                      deletePlan(document_id);
                                    },
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 20.0),
                                        child: Icon(Icons.delete),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  deletePlan(String docId) {
    FirebaseFirestore.instance.collection('plans').doc(docId).delete();
  }
}
