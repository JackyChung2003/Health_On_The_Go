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
    ["MMC Registration:", ""],
    ["Registration Number:", "ABC123456"],
    ["Registration Date:", "01/01/2010"],
    ["Expiry Date:", "01/01/2023"],
    ["Medical Degree:", ""],
    ["MBBS, University of Malaya", ""],
    ["Housemanship Hospital:", ""],
    ["Kuala Lumpur General Hospital", ""],
    ["Postgraduate Training:", ""],
    ["Internal Medicine, Putrajaya Hospital", ""],
    ["Professional Certifications and Specializations:", ""],
    ["Certification in Cardiology:", "XYZ Board"],
    ["Cardiology Specialization:", "National Specialist Register (NSR)"],
    ["NSR Number:", "NSR-12345"],
    ["Current Medical License:", ""],
    ["License Number:", "7890123456"],
    ["Issuance Date:", "03/01/2012"],
    ["Expiration Date:", "03/01/2024"],
    ["Annual Practicing Certificate (APC):", ""],
    ["APC Number:", "APC-456789"],
    ["Valid until:", "12/31/2023"],
    ["Malaysian HPC (Health Practitioner Code):", ""],
    ["HPC Number:", "HPC-987654321"],
    ["Professional Memberships:", ""],
    ["Malaysian Medical Association (MMA)", ""],
    ["Cardiology Society of Malaysia (CSM)", ""],
    ["Position:", ""],
    ["Consultant Cardiologist, XYZ Hospital", ""],
    ["Continuing Professional Development (CPD):", ""],
    ["CPD Points:", "50 (Current cycle)"],
    ["National Specialist Register (NSR):", ""],
    ["NSR Number:", "NSR-12345"],
    ["Contact Information:", ""],
    ["Email:", "dr.janedoe@email.com"],
    ["Phone:", "+6012-3456789"],
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
                    'lib/images/LimBoonXiong.jpg'), // Add your image asset
              ),
              SizedBox(height: 20),
              Text(
                'Dr Lim Boon Xiong',
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
                      'Support Documents',
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
