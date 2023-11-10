// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';

// class Personal extends StatelessWidget {
//   const Personal({super.key});

//   // temp function for sign out user
//   void signOutUser() {
//     FirebaseAuth.instance.signOut();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//           onPressed: signOutUser,
//           icon: Icon(Icons.logout),
//         )
//       ]),
//       body: Center(
//         child: Text('personal'),
//       ),
//     );
//   }
// }

import 'package:devhacktesting/screens/patient_UI/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  Personal({super.key});

  // temp function for sign out user
  void signOutUser() {
    FirebaseAuth.instance.signOut();
  }

  final List<List<String>> detailList = [
    ["Next of Kin", "Abdullah bin Hassan"],
    ["Contact of Next of Kin", "Phone: +60 12-345-6789"],
    ["Primary Care Physician", "Dr. Siti Aminah binti Rahim"],
    ["Health Insurance", "ABC Health Insurance"],
    ["Policy Number", "H1234567"],
    ["Contact", "Phone: +60 3-9876-5432"],
    ["Organ Donor Status", "Registered as an organ donor"],
    ["Blood Type", "A+"],
    ["Implants or Medical Devices", "Cardiac Pacemaker"],
    ["Allergies", "None"],
    [
      "Medication Allergies",
      "Sulfa Drugs",
      "Reaction: Severe hives and difficulty breathing",
      "Severity: Severe"
    ],
    ["Medical Conditions", "Hypertension and Type 2 Diabetes"],
    [
      "Current Medications",
      "Hypertension Medication",
      "Medication: Losartan",
      "Dosage: 50mg daily"
    ],
    [
      "Current Medications",
      "Diabetes Medication",
      "Medication: Metformin",
      "Dosage: 1000mg twice daily"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: signOutUser,
          icon: Icon(Icons.logout),
        )
      ]),
      // appBar: AppBar(
      //   title: Text('User Profile'),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              gradientStartColor.withOpacity(0.2),
              gradientEndColor.withOpacity(0.2)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'lib/images/patient_profile.jpg'), // Add your image asset
              ),
              SizedBox(height: 20),
              Text(
                'Pn Nurul Aminah binti Abdullah',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Perform submission logic here
                      // You can navigate back or perform other actions
                      // Navigator.pop(context);

                      // Show booking successful dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Booking Successful'),
                            content: Text(
                                'Edit profile function is not available yet.' +
                                    '\n\nPlease contact the hospital to edit your profile.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // // Navigate to the queue list view or any other page
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => NavBar()),
                                  // );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff242760),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Perform submission logic here
                      // You can navigate back or perform other actions
                      // Navigator.pop(context);

                      // Show booking successful dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Booking Successful'),
                            content: Text(
                                'Your appointment has been successfully booked.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // // Navigate to the queue list view or any other page
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => NavBar()),
                                  // );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff242760),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View Health Report',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              // ListView.builder(
              //   itemCount: eventList.length,
              //   itemBuilder: (context, index) {
              //     return ListTile(
              //       title: Text(eventList[index][0]),
              //       subtitle: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: List.generate(
              //           eventList[index].length - 1,
              //           (subIndex) => Text(eventList[index][subIndex + 1]),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: detailList.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final List<String> event = entry.value;

                  // Determine background color based on index
                  Color bgColor = index.isEven
                      ? Colors.transparent
                      : Colors.red.withOpacity(0.3);

                  // Determine text color based on index
                  Color textColor = index.isOdd ? Colors.black : Colors.orange;

                  return Container(
                    color: bgColor,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            event[0],
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight
                                  .bold, // Adjust the font weight as needed
                            ),
                          ),
                          // You can add any other widgets here if needed
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end, // Align the subtitle to the right
                        children: List.generate(
                          event.length - 1,
                          (index) => Text(
                            event[index + 1],
                            style: TextStyle(color: textColor),
                            textAlign:
                                TextAlign.right, // Align the text to the right
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: detailList.map((event) {
              //     return ListTile(
              //       title: Text(event[0]),
              //       subtitle: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: List.generate(
              //           event.length - 1,
              //           (index) => Text(event[index + 1]),
              //         ),
              //       ),
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
