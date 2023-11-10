// import 'package:devhacktesting/modals/patient_review.dart';
import 'package:devhacktesting/screens/colors.dart';
import 'package:devhacktesting/screens/patient_UI/health_care/booking_slot_page.dart';
import 'package:devhacktesting/screens/patient_UI/health_care/modals/patient_review.dart';
import 'package:devhacktesting/screens/patient_UI/nav_page.dart';
// import 'package:devhacktesting/screens/health_care/doctor_list_page.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  List<ReviewModel> reviewList = [];

  void _getReview() {
    reviewList = ReviewModel.getReview();
  }

  @override
  void initState() {
    super.initState();
    _getReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(children: [
              const SizedBox(height: 50),
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: wColor,
                      ),
                      // images are not available yet
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(15),
                      //   child: Image.asset(
                      //     "lib/images/LimBoonXiong.jpg'",
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Image.asset('lib/images/LimBoonXiong.jpg',
                            height: 150, width: 150),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Column(
                    children: [
                      Text(
                        'Dr Lim Boon Xiong',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF075C94),
                          fontSize: 32,
                          fontFamily: 'Merriweather Sans',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Heart Specialist',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Qualifications',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xFF075C94),
                      fontSize: 25,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    width: 386,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingSlotPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF075C94), // Button background color
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Book Slot',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Patient Review',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFF075C94),
                          fontSize: 25,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      // Display patient reviews using a Column
                      Column(
                        children: reviewList.map((review) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: wColor,
                            ),
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.patientName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  review.date,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: List.generate(
                                    review.starNum,
                                    (index) => const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  review.patientReview,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
