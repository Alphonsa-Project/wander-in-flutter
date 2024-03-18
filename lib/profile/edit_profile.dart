import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class EditProfile extends StatefulWidget {
  final Map<String, dynamic> userDoc;
  const EditProfile({super.key, required this.userDoc});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();
  String region = 'Region        ';
  bool loading = true;
  var file;
  String fileName = '';
  String propic = '';

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

  @override
  void initState() {
    emailCtrl.text = widget.userDoc['email'];
    nameCtrl.text = widget.userDoc['name'];
    region = widget.userDoc['region'];
    propic = widget.userDoc['image_url'];
    setState(() {
      loading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text('Edit Profile'),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: [
                    Gap(10),
                    GestureDetector(
                      onTap: () {
                        pickFiles();
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        child: file == null
                            ? Image.network(propic)
                            : Image.file(file),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: nameCtrl,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            enabled: true,
                            border: InputBorder.none,
                            labelText: 'Name',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black26),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: emailCtrl,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            enabled: true,
                            border: InputBorder.none,
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Gap(10),
                        DropdownButton<String>(
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
                            'Region        ',
                            'Bathery',
                            'Kalpetta',
                            'Mananthavady'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (nameCtrl.text.isNotEmpty &&
                              emailCtrl.text.isNotEmpty &&
                              region != 'Region        ') {
                            submit();
                          } else {
                            newCustomMessage(context, 'Please fill all fields');
                          }
                        },
                        child: const Text('UPLOAD'))
                  ],
                ),
              ),
            ),
          );
  }

  submit() async {
    if (file != null) {
      var storage = FirebaseStorage.instance;
      var snapshotone = await storage
          .ref()
          .child('records')
          .child(DateTime.now().toString() + fileName)
          .putFile(file);
      var downloadUrlone = await snapshotone.ref.getDownloadURL();

      FirebaseFirestore.instance.collection('users').doc(getuid()).update({
        'name': nameCtrl.text,
        'email': emailCtrl.text,
        'image_url': downloadUrlone,
        'region': region,
      }).then((value) {
        Navigator.pop(context);

        newCustomMessage(context, 'details will be updated shortly');
      });
    } else {
      FirebaseFirestore.instance.collection('users').doc(getuid()).update({
        'name': nameCtrl.text,
        'email': emailCtrl.text,
        'region': region,
      }).then((value) {
        Navigator.pop(context);

        newCustomMessage(context, 'details will be updated shortly');
      });
    }
  }
}
