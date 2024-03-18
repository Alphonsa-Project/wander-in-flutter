import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class AddPlaceToPlans extends StatefulWidget {
  final Map<String, dynamic> placeDoc;
  final Map<String, dynamic> userDoc;
  const AddPlaceToPlans(
      {super.key, required this.placeDoc, required this.userDoc});

  @override
  State<AddPlaceToPlans> createState() => _AddPlaceToPlansState();
}

class _AddPlaceToPlansState extends State<AddPlaceToPlans> {
  bool loading = false;
  final TextEditingController planCtrl = TextEditingController();
  String fileName = '';
  var file;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Add Place To Plans'),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: planCtrl,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            enabled: true,
                            border: InputBorder.none,
                            labelText: 'Create New Plan',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (planCtrl.text.isNotEmpty) {
                            planPopup();
                          } else {
                            newCustomMessage(context, 'field empty');
                          }
                        },
                        child: const Text('Create Plan')),
                    const Gap(20),
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
                              child: GestureDetector(
                                onTap: () {
                                  addFeedToPlan(document_id);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      'Add Selected feed to ${docData['plan_name']}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
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
          );
  }

  planPopup() => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Center(
            child: Text(
              'Do you want to add image?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                pickFiles();
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
                createNewPlan();
              },
              child: Container(
                color: Colors.green,
                child: const Padding(
                  padding:
                      EdgeInsets.only(bottom: 8, top: 8, left: 10, right: 10),
                  child: Text(
                    'Create without image',
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

  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      fileName = result.files.single.name;
      setState(() {});
      addImageandCreateNewPlan();
    } else {
      // User canceled the picker
    }
  }

  addImageandCreateNewPlan() async {
    setState(() {
      loading = true;
    });
    var storage = FirebaseStorage.instance;
    var snapshotone = await storage
        .ref()
        .child('plans')
        .child(DateTime.now().toString() + fileName)
        .putFile(file);
    var downloadUrlone = await snapshotone.ref.getDownloadURL();
    FirebaseFirestore.instance.collection('plans').doc().set({
      'uid': getuid(),
      'date': DateTime.now(),
      'plan_name': planCtrl.text,
      'image_url': downloadUrlone,
    }).then((value) {
      planCtrl.clear();
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  addFeedToPlan(String docId) {
    setState(() {
      loading = true;
    });
    var newFeedData = widget.placeDoc;
    newFeedData['added_date'] = DateTime.now();
    newFeedData['uid'] = getuid();
    newFeedData['liked_users'] = [];
    newFeedData['name'] = widget.userDoc['name'];
    newFeedData['place'] = widget.placeDoc['place_name'];
    newFeedData['user_img'] = widget.userDoc['image_url'];
    newFeedData['order'] = DateTime.now();

    FirebaseFirestore.instance
        .collection('plans')
        .doc(docId)
        .collection('destinations')
        .doc()
        .set(newFeedData)
        .then((value) {
      setState(() {
        loading = false;
      });
      newCustomMessage(context, 'destination added to plan');
      Navigator.pop(context);
    });
  }

  createNewPlan() {
    FirebaseFirestore.instance.collection('plans').doc().set({
      'uid': getuid(),
      'date': DateTime.now(),
      'plan_name': planCtrl.text,
      'image_url': ''
    }).then((value) {
      planCtrl.clear();
    });
  }
}
