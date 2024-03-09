import 'dart:math';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:wander_in/Blurrypage.dart';
import 'package:wander_in/parent_pages/account1.dart';
import 'package:wander_in/authentication/authstate.dart';
import 'package:wander_in/blogs.dart';

import 'package:wander_in/firebase_options.dart';
import 'package:wander_in/parent_pages/home2.dart';
import 'package:wander_in/parent_pages/noti2.dart';
import 'package:wander_in/parent_pages/notification.dart';
import 'package:wander_in/parent_pages/parent_page.dart';
import 'package:wander_in/placedetailonly.dart';

import 'package:wander_in/posts.dart';
import 'package:wander_in/posts1.dart';

import 'package:wander_in/parent_pages/home1.dart';
import 'package:wander_in/login1.dart';
import 'package:wander_in/parent_pages/map.dart';
import 'package:wander_in/parent_pages/notification.dart';
import 'package:wander_in/parent_pages/parent_page.dart';
import 'package:wander_in/photos.dart';
import 'package:wander_in/places2.dart';
import 'package:wander_in/parent_pages/plans.dart';
import 'package:wander_in/posts.dart';
import 'package:wander_in/registration.dart';
import 'package:wander_in/resort2.dart';
import 'package:wander_in/resortview.dart';
import 'package:wander_in/saves.dart';
import 'package:wander_in/taxi.dart';
import 'package:wander_in/review.dart';
import 'package:wander_in/saves.dart';
import 'package:wander_in/search.dart';
import 'package:wander_in/taxi.dart';
import 'package:wander_in/taxi1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.playIntegrity,
  );

  FirebaseUIAuth.configureProviders([
    PhoneAuthProvider(),
  ]);
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
        home: noti2());
  }
}
