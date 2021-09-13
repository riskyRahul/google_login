import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/Screens/CardScreen.dart';
import 'package:test/Screens/homepage.dart';

class MiddelPage extends StatelessWidget {
  const MiddelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshort.hasData) {
            return CardScreen();
          } else if (snapshort.hasError) {
            return Text("Something went wrong..");
          } else {
            return MyHomePage();
          }
        });
  }
}
