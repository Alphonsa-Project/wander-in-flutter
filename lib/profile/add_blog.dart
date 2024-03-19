import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wander_in/loading/loading.dart';
import 'package:wander_in/message/message.dart';
import 'package:wander_in/user_id.dart';

class AddBlog extends StatefulWidget {
  const AddBlog({super.key});

  @override
  State<AddBlog> createState() => _AddBlogState();
}

class _AddBlogState extends State<AddBlog> {
  final TextEditingController blogCtrl = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Blog Post',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(255, 255, 192, 192),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: ListView(
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
                          controller: blogCtrl,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            enabled: true,
                            border: InputBorder.none,
                            labelText: 'Add Blog',
                            labelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (blogCtrl.text.isNotEmpty) {
                            submitBlog();
                          } else {
                            newCustomMessage(context, 'Please add some text');
                          }
                        },
                        child: const Text('UPLOAD'))
                  ],
                ),
              ),
            ),
          );
  }

  submitBlog() {
    setState(() {
      loading = true;
    });
    FirebaseFirestore.instance.collection('blogs').doc().set({
      'uid': getuid(),
      'order': DateTime.now(),
      'text': blogCtrl.text
    }).then((value) {
      final user = FirebaseFirestore.instance.collection('users').doc(getuid());

      user.get().then((DocumentSnapshot userDoc) {
        if (userDoc.exists) {
          var userdoc = userDoc.data() as Map<String, dynamic>;
          if (userdoc.containsKey('rank_points')) {
            user.set({
              'rank_points':
                  (double.parse(userDoc['rank_points']) + 1).toString()
            }, SetOptions(merge: true));
          } else {
            user.set({'rank_points': '1'}, SetOptions(merge: true));
          }
        }
      });
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
      newCustomMessage(context, 'blog added');
      Navigator.pop(context);
    });
  }
}
