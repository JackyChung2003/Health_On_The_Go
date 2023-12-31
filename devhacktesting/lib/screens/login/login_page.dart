import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhacktesting/components/login_button.dart';
import 'package:devhacktesting/components/login_text_field.dart';
import 'package:devhacktesting/screens/doctor_UI/doctor_nav_page.dart';
import 'package:devhacktesting/screens/patient_UI/Personal/Personal_page.dart';
import 'package:devhacktesting/screens/patient_UI/home/home_page.dart';
import 'package:devhacktesting/screens/patient_UI/nav_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:modernlogintute/components/my_button.dart';
// import 'package:modernlogintute/components/my_textfield.dart';
// import 'package:modernlogintute/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  // sign user in method
  void signUserIn() async {
    // show some loading circle for user to wait
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // final databaseReference =
    //     FirebaseDatabase.instance.reference().child("Users");
    // final dbRef = FirebaseDatabase.instance

    // sign in patient and doctor
    try {
      debugPrint("enter login");
      // final newUser = await _auth.signInWithEmailAndPassword(
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      debugPrint("before enter route");
      route();

      // hide/close the loading circle
      Navigator.pop(context);
      debugPrint("finish route");
    } on FirebaseAuthException catch (e) {
      // hide/close the loading circle
      Navigator.pop(context);

      // show error message
      showErrorMessage(e.code);

      // // WRING email
      // if (e.code == 'user-not-found') {
      //   // show error to user
      //   wrongEmailMessage();
      //   print("Firebase error: ${e.code}");
      // }

      // // WRONG password
      // else if (e.code == 'wrong-password') {
      //   // show error to user
      //   wrongPasswordMessage();
      //   print("Firebase error: ${e.code}");
      // } else {
      //   // Handle other error cases here
      //   print("Firebase error: ${e.code}");
      //   // You can display a generic error message here.
      // }
    }
  }

  //   // sign in user
  //   try {
  //     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //     // hide/close the loading circle
  //     Navigator.pop(context);
  //   } on FirebaseAuthException catch (e) {
  //     // hide/close the loading circle
  //     Navigator.pop(context);

  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     } else {
  //       print(e);
  //     }
  //     // // WRING email
  //     // if (e.code == 'user-not-found') {
  //     //   // show error to user
  //     //   wrongEmailMessage();
  //     //   print("Firebase error: ${e.code}");
  //     // }

  //     // // WRONG password
  //     // else if (e.code == 'wrong-password') {
  //     //   // show error to user
  //     //   wrongPasswordMessage();
  //     //   print("Firebase error: ${e.code}");
  //     // } else {
  //     //   // Handle other error cases here
  //     //   print("Firebase error: ${e.code}");
  //     //   // You can display a generic error message here.
  //     // }
  //   }
  // }

  // wrong error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  // // wrong email message popup
  // void wrongEmailMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Incorrect Email',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // // wrong email message popup
  // void wrongPasswordMessage() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         backgroundColor: Colors.deepPurple,
  //         title: Center(
  //           child: Text(
  //             'Incorrect Password',
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void route() {
    debugPrint("enter route");
    User? user = FirebaseAuth.instance.currentUser;
    debugPrint("123");
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      debugPrint("before mounted");
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Patient") {
          debugPrint("Patient");
          return NavBar();
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => HomePage(),
          //   ),
          // );
          debugPrint("Patient finish");
        } else {
          debugPrint("doctor");
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DoctorNavBar(),
          //   ),
          // );
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => DoctorNavBar(),
          //   ),
          // );
          debugPrint("doctor finish");
        }
      } else {
        debugPrint("Document does not exist on the database");
        print('Document does not exist on the database');
      }
    });
  }

  // void route() {
  //   debugPrint("enter route");
  //   User? user = FirebaseAuth.instance.currentUser;
  //   debugPrint("123");
  //   var kk = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     debugPrint("before mounted");
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('role') == "Patient") {
  //         debugPrint("Patient");
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => HomePage(),
  //           ),
  //         );
  //         debugPrint("Patient finish");
  //       } else {
  //         debugPrint("doctor");
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => DoctorNavBar(),
  //           ),
  //         );
  //         debugPrint("doctor finish");
  //       }
  //     } else {
  //       debugPrint("Document does not exist on the database");
  //       print('Document does not exist on the database');
  //     }
  //     debugPrint("cannot enter mounted");
  //   });
  // }

  // void route() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('role') == "Patient") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => HomePage(),
  //           ),
  //         );
  //       } else {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Personal(),
  //           ),
  //         );
  //       }
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 10),

                // picture for login user to see
                Image.asset(
                  'lib/images/Login-doctor-view.png',
                  height: 100,
                ),

                // const SizedBox(height: 10),

                // welcome back, you've been missed!

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login with email',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                LoginTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                LoginTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // sign in button
                LoginButton(
                  text: 'Log In',
                  onTap: () {
                    signUserIn();
                    debugPrint(
                        "Login button tapped"); // Add this line to log the message
                  },
                ),
                // MyButton(
                //   onTap: signUserIn,
                // ),

                const SizedBox(height: 20),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // google + facebook sign in buttons
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'lib/images/google.png',
                              height: 20,
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "Continue with Google",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10),

                    // facebook button
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: Color(0xff1877F2),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'lib/images/facebook.png',
                                  height: 20,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  "Continue with Facebook",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(width: 25),

                        // apple button
                        // SquareTile(imagePath: 'lib/images/apple.png')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
