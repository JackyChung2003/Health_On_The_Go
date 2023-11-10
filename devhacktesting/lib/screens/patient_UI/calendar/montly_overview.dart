// import 'package:flutter/material.dart';

// class MontlyOverview extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Figma Flutter Generator Group6907Widget - GROUP
//     return ;
//   }
// }

import 'package:devhacktesting/screens/patient_UI/nav_page.dart';
import 'package:flutter/material.dart';

class MontlyOverview extends StatefulWidget {
  const MontlyOverview({super.key});

  @override
  State<MontlyOverview> createState() => MontlyOverviewState();
}

class MontlyOverviewState extends State<MontlyOverview> {
  final primaryColor = Color(0xFF22668D);
  final secondaryColor = Color(0xFFEDFFFD);
  final gradientStartColor = Color(0xFF00F652);
  final gradientEndColor = Color(0xFF00BCF6);
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(children: [
                  IconButton(
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NavBar()))
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xff2B2A4C),
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 50),
                  const Text(
                    'Monthly Report',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: 'Merriweather Sans',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ]),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Montly Overview',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 2,
                      color: Colors.blue, // Change color as needed
                      width: 350,
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You\'re doing awesome!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Keep up the good work!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Image.asset(
                  'lib/images/montly_report.jpeg',
                ),
              ),

              // ticket number
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
