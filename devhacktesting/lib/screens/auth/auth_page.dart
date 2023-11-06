import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhacktesting/screens/doctor_UI/doctor_nav_page.dart';
import 'package:devhacktesting/screens/login/login_or_register_page.dart';
import 'package:devhacktesting/screens/login/login_page.dart';
import 'package:devhacktesting/screens/patient_UI/nav_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;

            if (user != null) {
              // User is authenticated, fetch user's role from Firestore
              return FutureBuilder<DocumentSnapshot>(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user.uid)
                    .get(),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.done) {
                    if (userSnapshot.hasData && userSnapshot.data != null) {
                      final Map<String, dynamic>? userData =
                          userSnapshot.data!.data() as Map<String, dynamic>?;
                      if (userData != null && userData.containsKey('role')) {
                        final String userRole = userData['role'];
                        if (userRole == 'Patient') {
                          return NavBar();
                        } else if (userRole == 'Doctor') {
                          return DoctorNavBar();
                        } else {
                          // Handle other user roles or show a default screen
                          return Text('Unsupported user role');
                        }
                      }
                      // final String userRole = userSnapshot.data!.get('role');

                      // if (userRole == 'Patient') {
                      //   return NavBar();
                      // } else if (userRole == 'Doctor') {
                      //   return DoctorNavBar();
                      // } else {
                      //   // Handle other user roles or show a default screen
                      //   return Text('Unsupported user role');
                      // }
                    }
                  }

                  // Handle loading or errors
                  return LoginOrRegisterPage();
                  // return CircularProgressIndicator();
                },
              );
            } else {
              // User is not authenticated, show login or registration page
              return LoginOrRegisterPage();
            }
          } else {
            // Handle loading state
            return CircularProgressIndicator();
          }
          // // user is logged in
          // if (snapshot.hasData) {
          //   return NavBar();
          // }
          // // user is NOT logged in
          // else {
          //   return LoginOrRegisterPage();
          // }
        },
      ),
    );
  }
}
