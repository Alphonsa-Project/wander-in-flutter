import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/plans/add_to_plans.dart';
import 'package:wander_in/profile/new_post.dart';
import 'package:wander_in/user_id.dart';

class UserPosts extends StatefulWidget {
  final String uid;
  final String name;
  final String user_img;
  const UserPosts(
      {super.key,
      required this.uid,
      required this.name,
      required this.user_img});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPosts(
                          name: widget.name,
                          user_img: widget.user_img,
                        )));
          },
          child: const Icon(Icons.add)),
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
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  deletepostpopup(document_id);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(Icons.delete),
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
                                  image: NetworkImage(docData['img_url']),
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

  deletepost(String feedId) {
    FirebaseFirestore.instance
        .collection('feed')
        .doc(feedId)
        .delete()
        .then((value) {
      newCustomMessage(context, 'post deleted');
    });
  }

  deletepostpopup(String feedId) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Center(
            child: Text(
              'delete post',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          content: const Row(
            children: [
              Spacer(),
              Text(
                '            Are you sure?            ',
                style: TextStyle(color: Colors.black),
              ),
              Spacer()
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                deletepost(feedId);
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'yes',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.green,
                child: const Padding(
                  padding:
                      EdgeInsets.only(bottom: 8, top: 8, left: 10, right: 10),
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        barrierDismissible: true,
      );
}
