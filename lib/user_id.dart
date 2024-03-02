import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

getuid() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  var uid;
  // var uno;
  if (user != null) {
    uid = user.uid;
    // uno = user.phoneNumber;
    log(uid.toString());
  } else {
    uid = '';
    print('no uid');
  }
  return uid;
}

getmobile() {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User? user = auth.currentUser;
  var mobile;
  // var uno;
  if (user != null) {
    mobile = user.phoneNumber;
    // uno = user.phoneNumber;
    log(mobile.toString());
  } else {
    mobile = '';
    print('no mobile');
  }
  return mobile;
}
