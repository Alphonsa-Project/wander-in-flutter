import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class BlurryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blurry Container Page'),
      ),
      body: Center(
        child: BlurryContainer(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Blurry Container',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          blur: 5,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
