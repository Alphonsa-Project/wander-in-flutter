import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/plans/add_to_plans.dart';
import 'package:wander_in/profile/new_post.dart';
import 'package:wander_in/user_id.dart';

class TravellerPosts extends StatefulWidget {
  final String uid;
  final String name;
  final String user_img;
  const TravellerPosts(
      {super.key,
      required this.uid,
      required this.name,
      required this.user_img});

  @override
  State<TravellerPosts> createState() => _TravellerPostsState();
}

class _TravellerPostsState extends State<TravellerPosts> {
  // bool loading = true;
//   @override
//   void initState() {
// FirebaseFirestore.instance.collection('users').doc(widget.uid).get().then((DocumentSnapshot userDoc) {
//   if(userDoc.exists){
//     region
//   }
// })    super.initState();
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: ListView(
        shrinkWrap: true,
        children: [
          FirestoreQueryBuilder<Map<String, dynamic>>(
            query: FirebaseFirestore.instance
                .collection('feed')
                .where('uid', isEqualTo: widget.uid)
                .orderBy('order', descending: true),
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
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .35,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/r.png"),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * .35,
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
                                    Icon(
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
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      " ${docData['liked_users'].length} likes"),
                                ),
                                if (!docData['liked_users'].contains(getuid()))
                                  GestureDetector(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection('feed')
                                          .doc(document_id)
                                          .update({
                                        'liked_users':
                                            docData['liked_users'] + [getuid()],
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Icon(Icons.favorite_border_outlined),
                                    ),
                                  ),
                                if (docData['liked_users'].contains(getuid()))
                                  GestureDetector(
                                    onTap: () {
                                      FirebaseFirestore.instance
                                          .collection('feed')
                                          .doc(document_id)
                                          .update({
                                        'liked_users': docData['liked_users']
                                            .where((item) => item != getuid())
                                            .toList(),
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddToPlans(
                                                  feedDoc: docData,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.add_circle_outline),
                                  ),
                                )
                              ],
                            ),
                          ],
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
    );
  }
}
