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
                          keyboardType: TextInputType.number,
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
                          submitBlog();
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
