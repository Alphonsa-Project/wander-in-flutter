import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/profile/add_blog.dart';
import 'package:wander_in/user_id.dart';

class Blogs extends StatefulWidget {
  final String uid;
  const Blogs({super.key, required this.uid});

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  String image_url = '';
  String name = '';
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get()
        .then((DocumentSnapshot userDoc) {
      if (userDoc.exists) {
        image_url = userDoc['image_url'];
        name = userDoc['name'];
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 192, 192),
      floatingActionButton: widget.uid == getuid()
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddBlog()));
              },
              child: Icon(Icons.add))
          : FloatingActionButton.small(onPressed: () {}),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Container(
                //height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  shrinkWrap: true,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: MediaQuery.of(context).size.height * .20,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(101, 24, 24, 24),
                                  blurRadius: 7,
                                  offset: Offset(1, 2))
                            ]),
                        child: ListView(
                          shrinkWrap:
                              true, // mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (image_url.isNotEmpty)
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: FadeInImage(
                                        image: NetworkImage(image_url),
                                        placeholder: const AssetImage(
                                            'assets/images/profile.png'),
                                        fit: BoxFit.cover,
                                        width: 60.0,
                                        height: 60.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(162, 0, 0, 0)),
                                ),
                              ),
                            ),
                            const Gap(10)
                          ],
                        ),
                      ),
                    ),
                    FirestoreQueryBuilder<Map<String, dynamic>>(
                      query: FirebaseFirestore.instance
                          .collection('blogs')
                          .where('uid', isEqualTo: widget.uid)
                          .orderBy('order', descending: true),
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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    docData['text'],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
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
        ),
      ),
    );
  }
}
