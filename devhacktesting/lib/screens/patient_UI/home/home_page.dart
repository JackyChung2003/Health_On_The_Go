// // ignore_for_file: prefer_const_constructors

// // import 'package:flutter/material.dart';
// // // import 'package:google_nav_bar/google_nav_bar.dart';

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text('home'),
// //       ),
// //     );
// //   }
// // }

// // class Home extends StatefulWidget {
// //   const Home({Key? key}) : super(key: key);

// //   @override
// //   State<Home> createState() => _HomeState();
// // }

// // class _HomeState extends State<Home> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // bottomNavigationBar: BottomNavigationBar(),    // normal Navigation Bar
// //       bottomNavigationBar: Container(
// //         color: Color(0xffccfcff),
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
// //           child: GNav(
// //             tabBackgroundColor:
// //                 Color(0xff99faff), // for the tab background color
// //             backgroundColor: Color(0xffccfcff), // for the background color
// //             color: Color(0xff3B8F5E), // for the text color
// //             activeColor: Color(0xff287EC9),
// //             gap: 8,
// //             padding: EdgeInsets.all(20),

// //             // navigate to other pages
// //             onTabChange: (index) {
// //               print(index);
// //             },
// //             tabs: const [
// //               // GButton(icon: Icons.home),
// //               // GButton(icon: Icons.health_and_safety),
// //               // GButton(icon: Icons.calendar_today),
// //               // GButton(icon: Icons.person),
// //               GButton(icon: Icons.home, text: 'Home'),
// //               GButton(icon: Icons.health_and_safety, text: 'Health'),
// //               GButton(icon: Icons.calendar_today, text: 'Calendar'),
// //               GButton(icon: Icons.person, text: 'Personal'),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('home'),
//       ),
//     );
//   }
// }

import 'package:devhacktesting/components/home_page_icon.dart';
// import 'package:devhacktesting/screens/doctor_UI/calendar/calendar_page.dart';
import 'package:devhacktesting/screens/patient_UI/calendar/calendar_page.dart';
import 'package:devhacktesting/screens/patient_UI/home/queue_list_view.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF22668D);
const secondaryColor = Color(0xFFEDFFFD);
const gradientStartColor = Color(0xFF00BCF6);
const gradientEndColor = Color(0xFF00F652);

class HomePage extends StatelessWidget {
  List homePageItems = [
    ['Check my queue', Colors.blue.shade900, 'lib/images/queue.png'],
    ['Check my tracker', Colors.blue.shade200, 'lib/images/tracker.png'],
    ['Check my food', Colors.blue.shade200, 'lib/images/food.png'],
    ['Check my medicine', Colors.blue.shade900, 'lib/images/medicine.png'],
    // {
    //   'title': 'Check my queue',
    //   'imageUrl': 'https://via.placeholder.com/183x130',
    // },
    // {
    //   'title': 'Check my tracker',
    //   'imageUrl': 'https://via.placeholder.com/156x150',
    // },
    // {
    //   'title': 'Check my food',
    //   'imageUrl': 'https://via.placeholder.com/183x162',
    // },
    // {
    //   'title': 'Check my medicine',
    //   'imageUrl': 'https://via.placeholder.com/183x162',
    // },
  ];

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Positioned(
              top: 30,
              left: 20,
              child: Text(
                'Welcome, John!',
                style: TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 3),
                      blurRadius: 5,
                    ),
                  ],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: GridView.builder(
                  itemCount: homePageItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the desired route
                        switch (index) {
                          case 0:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => queuelistView(),
                              ),
                            );
                            break;
                          case 1:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Calendar(),
                              ),
                            );
                            break;
                          case 2:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Check my food'),
                                  content: Text(
                                      'Check my food funtion is not available yet.' +
                                          '\n' +
                                          'Please check back later.'),
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
                            break;
                          case 3:
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Check my medicine'),
                                  content: Text(
                                      'Check my medicine funtion is not available yet.' +
                                          '\n' +
                                          'Please check back later.'),
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
                            break;
                          // Add more cases for other indices as needed
                        }
                      },
                      child: HomePageIcon(
                        IconName: homePageItems[index][0],
                        IconColor: homePageItems[index][1],
                        IconImageName: homePageItems[index][2],
                      ),
                    );
                    // return Container(
                    //   margin: EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Image.network(homePageItems[index][1]),
                    //       Text(homePageItems[index][0]),
                    //     ],
                    //   ),
                    // );
                  }),
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     GreetingMessage(),
        //     FeatureCard(
        //       title: 'Check my queue',
        //       // imageUrl: 'https://via.placeholder.com/183x130',

        //       imageUrl: null, // Add your image URL here
        //     ),
        //     FeatureCard(
        //       title: 'Check my tracker',
        //       // imageUrl: 'https://via.placeholder.com/156x150',

        //       imageUrl: null, // Add your image URL here
        //     ),
        //     FeatureCard(
        //       title: 'Check my food',
        //       // imageUrl: 'https://via.placeholder.com/183x162',
        //       imageUrl: null, // Add your image URL here
        //     ),
        //     FeatureCard(
        //       title: 'Check my medicine',
        //       imageUrl: null, // Add your image URL here
        //     ),
        //     Spacer(),
        //     BottomBar(),
        //   ],
        // ),
      ),
    );
  }
}

// class GreetingMessage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 32, top: 76),
//       child: Text(
//         'Hello John!',
//         style: TextStyle(
//           color: primaryColor,
//           fontSize: 30,
//           fontFamily: 'Merriweather Sans',
//           fontWeight: FontWeight.w800,
//         ),
//       ),
//     );
//   }
// }

// class FeatureCard extends StatelessWidget {
//   final String title;
//   final String? imageUrl;

//   FeatureCard({required this.title, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//       // child: Container(
//       //   width: double.infinity,
//       //   height: 239,
//       //   decoration: BoxDecoration(
//       //     color: imageUrl != null ? secondaryColor : primaryColor,
//       //     borderRadius: BorderRadius.circular(9),
//       //   ),
//       //   child: Stack(
//       //     children: [
//       //       if (imageUrl != null)
//       //         Positioned(
//       //           left: 14,
//       //           top: 21,
//       //           child: Container(
//       //             width: 156,
//       //             height: 150,
//       //             decoration: BoxDecoration(
//       //               image: DecorationImage(
//       //                 image: NetworkImage(imageUrl!),
//       //                 fit: BoxFit.cover,
//       //               ),
//       //             ),
//       //           ),
//       //         ),
//       //       Positioned(
//       //         left: 16,
//       //         top: 160,
//       //         child: SizedBox(
//       //           width: 183,
//       //           child: Text(
//       //             title,
//       //             style: TextStyle(
//       //               color: imageUrl != null ? primaryColor : secondaryColor,
//       //               fontSize: 25,
//       //               fontFamily: 'Inter',
//       //               fontWeight: FontWeight.w400,
//       //             ),
//       //           ),
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );
//   }
// }

// class FeatureCardWithImageList extends StatelessWidget {
//   final String title;
//   final String imageUrl;

//   FeatureCardWithImageList({required this.title, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 12, top: 432, right: 12),
//       child: Container(
//         width: double.infinity,
//         height: 239,
//         decoration: BoxDecoration(
//           color: primaryColor,
//           borderRadius: BorderRadius.circular(9),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               left: 28,
//               top: 160,
//               child: SizedBox(
//                 width: 167,
//                 child: Text(
//                   title,
//                   style: TextStyle(
//                     color: secondaryColor,
//                     fontSize: 25,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 0,
//               top: 10,
//               child: Container(
//                 width: double.infinity,
//                 height: 162,
//                 padding: const EdgeInsets.only(left: 12, right: 29),
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(),
//                 child: Image.network(
//                   imageUrl,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BottomBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 66,
//       decoration: BoxDecoration(color: primaryColor),
//       child: Padding(
//         padding: const EdgeInsets.only(left: 40, top: 11),
//         child: Container(
//           width: 350.55,
//           height: 43,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Add your icons or widgets here
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
