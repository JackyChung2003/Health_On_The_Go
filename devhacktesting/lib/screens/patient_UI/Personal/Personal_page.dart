import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  // temp function for sign out user
  void signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: signOutUser,
          icon: Icon(Icons.logout),
        )
      ]),
      body: Center(
        child: Text('personal'),
      ),
    );
  }
}
