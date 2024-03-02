// import 'package:LifeLoot/authentication/login.dart';
// import 'package:LifeLoot/parent_pages/parent_page.dart';
// import 'package:LifeLoot/registration/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProjectAuthState extends StatelessWidget {
  const ProjectAuthState({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        color: Color(0xff1254AA),
                      )));
            } else if (snapshot.hasData) {
              return const Registration();
            } else if (snapshot.hasError) {
              return const Center(child: Text('something went wrong..!'));
            } else {
              return const Login();
            }
          },
        ),
      );
}
