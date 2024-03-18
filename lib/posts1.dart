// import 'package:flutter/material.dart';

// class posts1 extends StatefulWidget {
//   const posts1({super.key});

//   @override
//   State<posts1> createState() => _posts1State();
// }

// class _posts1State extends State<posts1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     Icons.navigate_before,
//                     size: 35,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Text(
//                         "posts",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height * .50,
//               decoration: BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(color: Colors.black12),
//                     top: BorderSide(color: Colors.black12)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 8.0, bottom: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             Container(
//                               height: 50,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/david.png"))),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("name"),
//                               Text(
//                                 "date",
//                                 style: TextStyle(color: Colors.black87),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height * .35,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage("assets/images/r.png"),
//                             fit: BoxFit.cover)),
//                     child: Stack(
//                       alignment: Alignment.bottomLeft,
//                       children: [
//                         Container(
//                             height: MediaQuery.of(context).size.height * .35,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                     colors: [
//                                   Colors.black,
//                                   Colors.black.withOpacity(0.5),
//                                   Colors.black.withOpacity(.0)
//                                 ],
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.center))),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Icon(
//                                 Icons.location_pin,
//                                 color: Colors.white,
//                               ),
//                               Text(
//                                 "himalaya",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(" 226 likes"),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(Icons.favorite_border_outlined),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Icon(Icons.add_circle_outline),
//                           )
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
