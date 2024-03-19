import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class NewPosts extends StatefulWidget {
  final String name;
  final String user_img;
  const NewPosts({super.key, required this.name, required this.user_img});

  @override
  State<NewPosts> createState() => _NewPostsState();
}

class _NewPostsState extends State<NewPosts> {
  bool loading = false;
  final TextEditingController placeCtrl = TextEditingController();
  String fileName = '';
  var file;
  String region = 'Select Region';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: ListView(
              children: [
                const Gap(10),
                if (fileName.isEmpty)
                  GestureDetector(
                    onTap: () {
                      pickFiles();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 68, left: 68, right: 68, bottom: 30),
                      child: Image.asset('assets/images/add_image.png'),
                    ),
                  ),
                if (fileName.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      pickFiles();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 68, left: 68, right: 68, bottom: 30),
                      child: Image.file(file),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black26),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        controller: placeCtrl,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          enabled: true,
                          border: InputBorder.none,
                          labelText: 'place name',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownButton<String>(
                    value: region,
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
                        region = newValue!;
                      });
                    },
                    items: <String>[
                      'Select Region',
                      'Bathery',
                      'Kalpetta',
                      'Mananthavadi',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (placeCtrl.text.isNotEmpty &&
                          region != 'Select Region' &&
                          fileName.isNotEmpty) {
                        upload();
                      } else {
                        newCustomMessage(context, 'please fill details');
                      }
                    },
                    child: const Text('upload feed'))
              ],
            ),
          );
  }

  pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      fileName = result.files.single.name;
      setState(() {});
    } else {
      // User canceled the picker
    }
  }

  upload() async {
    setState(() {
      loading = true;
    });
    var storage = FirebaseStorage.instance;
    var snapshotone = await storage
        .ref()
        .child('posts')
        .child(DateTime.now().toString() + fileName)
        .putFile(file);
    var downloadUrlone = await snapshotone.ref.getDownloadURL();
    FirebaseFirestore.instance.collection('feed').doc().set({
      'uid': getuid(),
      'order': DateTime.now(),
      'place': placeCtrl.text,
      'img_url': downloadUrlone,
      'liked_users': [],
      'name': widget.name,
      'region': region,
      'user_img': widget.user_img,
    }).then((value) {
      final user = FirebaseFirestore.instance.collection('users').doc(getuid());

      user.get().then((DocumentSnapshot userDoc) {
        if (userDoc.exists) {
          var userdoc = userDoc.data() as Map<String, dynamic>;
          if (userdoc.containsKey('rank_points')) {
            user.set({
              'rank_points':
                  (double.parse(userDoc['rank_points']) + 3).toString()
            }, SetOptions(merge: true));
          } else {
            user.set({'rank_points': '3'}, SetOptions(merge: true));
          }
        }
      });
      placeCtrl.clear();
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
      Navigator.pop(context);
      newCustomMessage(context, 'new post uploaded');
    });
  }
}
