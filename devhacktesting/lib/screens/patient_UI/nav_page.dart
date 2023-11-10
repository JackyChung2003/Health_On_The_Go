import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home/home_page.dart';
import 'health_care/health_care_page.dart';
import 'calendar/calendar_page.dart';
import 'Personal/Personal_page.dart';

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('home'),
//     );
//   }
// }

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _HomeState();
}

class _HomeState extends State<NavBar> {
  // a integer to keep track of the current index of the page
  int _selectedIndex = 0;

  // method/function to updates the new selected index to navigate to the page
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // create a list of pages
  final List _pages = [
    HealthCare(),
    HomePage(),
    Calendar(),
    Personal(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(),    // normal Navigation Bar
      bottomNavigationBar: Container(
        color: Color(0xffccfcff),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            tabBackgroundColor:
                Color(0xff99faff), // for the tab background color
            backgroundColor: Color(0xffccfcff), // for the background color
            color: Color(0xff3B8F5E), // for the text color
            activeColor: Color(0xff287EC9),
            gap: 8,
            padding: EdgeInsets.all(20),

            // to view the index to navigate to other pages (Development purpose)
            // onTabChange: (index) {
            //   print(index);
            // },

            onTabChange: (value) {
              _navigateBottomBar(value);
            },
            tabs: const [
              // GButton(icon: Icons.home),
              // GButton(icon: Icons.health_and_safety),
              // GButton(icon: Icons.calendar_today),
              // GButton(icon: Icons.person),
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.health_and_safety, text: 'Health'),
              GButton(icon: Icons.calendar_today, text: 'Calendar'),
              GButton(icon: Icons.person, text: 'Personal'),
            ],
          ),
        ),
      ),
    );
  }
}
