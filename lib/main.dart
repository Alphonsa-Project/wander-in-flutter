import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/Blurrypage.dart';
import 'package:wander_in/account1.dart';
import 'package:wander_in/blogs.dart';

import 'package:wander_in/firebase_options.dart';
import 'package:wander_in/home1.dart';
import 'package:wander_in/login1.dart';
import 'package:wander_in/map.dart';
import 'package:wander_in/notification.dart';
import 'package:wander_in/parent_pages/parent_page.dart';
import 'package:wander_in/photos.dart';
import 'package:wander_in/places2.dart';
import 'package:wander_in/plans.dart';
import 'package:wander_in/posts.dart';
import 'package:wander_in/resort.dart';
import 'package:wander_in/resort2.dart';
import 'package:wander_in/resortview.dart';
import 'package:wander_in/saves.dart';
import 'package:wander_in/taxi.dart';
import 'package:wander_in/review.dart';
import 'package:wander_in/search.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        home: Photos());
  }
}
