import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhacktesting/components/login_button.dart';
import 'package:devhacktesting/components/login_text_field.dart';
import 'package:devhacktesting/screens/login/login_or_register_page.dart';
// import 'package:devhacktesting/screens/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // role for user to register
  var options = ['Patient', 'Doctor'];
  var _currentItemSelected = "Patient";
  var role = "Patient";

  final _auth = FirebaseAuth.instance;
  // final _formkey = GlobalKey<FormState>();

  // sign user up method
  void signUserUp(String email, String password, String rool) async {
    // show some loading circle for user to wait
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating patient and doctor
    try {
      // check whether password and confirm password is the same
      if (passwordController.text == confirmPasswordController.text) {
        try {
          // final newUser = await _auth.createUserWithEmailAndPassword(
          final newUser = await _auth.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          postDetailsToFirestore(email, role);
        } catch (e) {
          // Handle the error and return a value that matches the expected type
          Navigator.pop(context);

          print("Error: $e");
          showErrorMessage("An error occurred during registration.");
        }
      } else {
        // hide/close the loading circle
        Navigator.pop(context);

        // show error message, passwords dont match
        showErrorMessage("Passwords do not match!");
      }
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

  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': emailController.text, 'role': role});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => LoginOrRegisterPage()));
  }

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

                // Create an account

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Create an account',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                // const SizedBox(height: 10),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Login with email',
                //         style: TextStyle(
                //           color: Colors.grey[700],
                //           fontSize: 16,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

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

                // confirm password textfield
                LoginTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                // const SizedBox(height: 10),

                // // forgot password?
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text(
                //         'Forgot Password?',
                //         style: TextStyle(color: Colors.grey[600]),
                //       ),
                //     ],
                //   ),
                // ),

                const SizedBox(height: 10),

                DropdownButton<String>(
                  dropdownColor: Colors.blue[900],
                  isDense: true,
                  isExpanded: false,
                  iconEnabledColor: Colors.white,
                  focusColor: Colors.white,
                  items: options.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      _currentItemSelected = newValueSelected!;
                      role = newValueSelected;
                    });
                  },
                  value: _currentItemSelected,
                ),

                const SizedBox(height: 25),

                // sign in button
                LoginButton(
                  text: 'Sign Up',
                  onTap: () {
                    signUserUp(
                        emailController.text, passwordController.text, role);
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
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
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
