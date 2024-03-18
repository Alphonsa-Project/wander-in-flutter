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
          child: CircularProgressIndicator(
            color: Colors.grey,
            strokeWidth: 2,
          ),
        )),
      ),
    );
  }
}


// FirestoreQueryBuilder<Map<String, dynamic>>(
//   query: FirebaseFirestore.instance.collection('user'),
//   builder: (context, snapshot, _) {
//     // ...

//     return GridView.builder(
//       itemCount: snapshot.docs.length,
//       itemBuilder: (context, index) {
//         // if we reached the end of the currently obtained items, we try to
//         // obtain more items
//         if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
//           // Tell FirestoreQueryBuilder to try to obtain more items.
//           // It is safe to call this function from within the build method.
//           snapshot.fetchMore();
//         }

//         final user = snapshot.docs[index].data();

//         return Container(
//           padding: const EdgeInsets.all(8),
//           color: Colors.teal[100],
//           child: const Text("User name is ${user['name']}"),
//         );
//       },
//     );
//   },
// );
