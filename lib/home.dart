import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(
                  height: 0,
                  width: 150,
                ),
                Text('DAVID BEKHAM'),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text('5'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text('100'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text('15'),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'david bekham',
                  style: TextStyle(fontSize: 13),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: Text('total travel'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('rank'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 42.0),
                  child: Text('points'),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text('joined in '),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('traveled places'),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Container(height: 125, width: 250, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Container(height: 125, width: 250, color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('posts'),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Container(height: 125, width: 250, color: Colors.red),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Container(height: 125, width: 250, color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
