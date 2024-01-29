import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wander_in/account.dart';
import 'package:wander_in/account1.dart';
import 'package:wander_in/blogs.dart';
import 'package:wander_in/home.dart';
import 'package:wander_in/home1.dart';
import 'package:wander_in/login.dart';
import 'package:wander_in/login1.dart';
import 'package:wander_in/notification.dart';
import 'package:wander_in/posts.dart';
import 'package:wander_in/review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: review(),
    );
  }
}
