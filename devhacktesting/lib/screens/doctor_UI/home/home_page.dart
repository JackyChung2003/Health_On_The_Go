// ignore_for_file: prefer_const_constructors

import 'package:devhacktesting/screens/patient_UI/home/home_page.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class DoctorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Text('YOU ARE DOCTOR !!!!! home'),
    //   ),
    // );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              gradientStartColor.withOpacity(0.5),
              gradientEndColor.withOpacity(0.5)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                'Share your amazing discoveries or intriguing questions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 21, 80, 129),
                  fontSize: 30,
                  fontFamily: 'Merriweather Sans',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Image.asset(
                  'lib/images/doctor_main_page.jpeg',
                ),
              ),
            ],
          ),
        ),

        // child: Scaffold(
        // backgroundColor: Colors.transparent,
        // body: SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        //   child: Column(
        //     children: [
        //       const SizedBox(
        //         height: 30,
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(18.0),
        //         child: Row(
        //           children: [,
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomNavigationBar: BottomNavigationBar(),    // normal Navigation Bar
//       bottomNavigationBar: Container(
//         color: Color(0xffccfcff),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//           child: GNav(
//             tabBackgroundColor:
//                 Color(0xff99faff), // for the tab background color
//             backgroundColor: Color(0xffccfcff), // for the background color
//             color: Color(0xff3B8F5E), // for the text color
//             activeColor: Color(0xff287EC9),
//             gap: 8,
//             padding: EdgeInsets.all(20),

//             // navigate to other pages
//             onTabChange: (index) {
//               print(index);
//             },
//             tabs: const [
//               // GButton(icon: Icons.home),
//               // GButton(icon: Icons.health_and_safety),
//               // GButton(icon: Icons.calendar_today),
//               // GButton(icon: Icons.person),
//               GButton(icon: Icons.home, text: 'Home'),
//               GButton(icon: Icons.health_and_safety, text: 'Health'),
//               GButton(icon: Icons.calendar_today, text: 'Calendar'),
//               GButton(icon: Icons.person, text: 'Personal'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
