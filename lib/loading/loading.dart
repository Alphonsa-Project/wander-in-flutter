import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Color.fromARGB(0, 255, 255, 255),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          color: Colors.white,
          width: 20,
          height: 20,
          child: const CircularProgressIndicator(
            color: Colors.grey,
            strokeWidth: 2,
          ),
        )),
      ),
    );
  }
}
