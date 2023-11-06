// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('home'),
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
