// import 'package:flutter/material.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';

// class HealthCare extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('health care'),
//       ),
//     );
//   }
// }

// import 'package:devhacktesting/modals/hospital_list.dart';
// import 'package:devhacktesting/screens/health_care/doctor_list_page.dart';
import 'package:devhacktesting/screens/patient_UI/health_care/doctor_list_page.dart';
import 'package:devhacktesting/screens/patient_UI/health_care/modals/hospital_list.dart';
import 'package:flutter/material.dart';
import 'package:devhacktesting/screens/colors.dart';
//import 'package:devhacktesting/screens/nav_page.dart';

// ignore: must_be_immutable
class HealthCare extends StatefulWidget {
  const HealthCare({super.key});
  //final int selectedIndex;

  // const HospitalPage({super.key, required this.selectedIndex});

  @override
  State<HealthCare> createState() => _HealthCareState();
}

class _HealthCareState extends State<HealthCare> {
  List<HospitalModel> hospitalList = [];

  void _getHospital() {
    hospitalList = HospitalModel.getHospital();
  }

  @override
  Widget build(BuildContext context) {
    _getHospital();
    return
        // Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment(-0.00, 1.00),
        //       end: Alignment(0, -1),
        //       colors: [
        //         Color.fromARGB(255, 166, 232, 252),
        //         Color.fromARGB(255, 189, 255, 251)
        //       ],
        //     ),
        //   ),
        Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   centerTitle: true,
      //   toolbarHeight: 105,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(45),
      //     ),
      //   ),
      //   backgroundColor: blue,
      //   title: const Column(
      //     children: [
      //       Text(
      //         "SKIP THE WAIT",
      //         style: TextStyle(
      //             fontFamily: 'Inter',
      //             fontWeight: FontWeight.w700,
      //             fontSize: 15.0,
      //             color: Colors.black),
      //       ),
      //       Text(
      //         "Book Your Consultation",
      //         style: TextStyle(
      //             fontFamily: 'MerriweatherSans',
      //             fontWeight: FontWeight.w900,
      //             fontSize: 28.0,
      //             color: darkBlue),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.00, 1.00),
            end: Alignment(0, -1),
            colors: [
              Color.fromARGB(255, 166, 232, 252),
              Color.fromARGB(255, 189, 255, 251)
            ],
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 35.00,
                ),
                SearchField(),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                        child: Text(
                          'By Specialist',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // Scroll horizontally
                        child: Row(
                          children: [
                            Container(
                              width: 91,
                              height: 91,
                              decoration: ShapeDecoration(
                                color: Color(0xff3CD7E4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 6,
                                    offset: Offset(2, 2),
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Image.asset('lib/images/heart.png',
                                      height: 150, width: 150),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 91,
                              height: 91,
                              decoration: ShapeDecoration(
                                color: Color(0xff3CD7E4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 6,
                                    offset: Offset(2, 2),
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Image.asset('lib/images/liver.png',
                                      height: 150, width: 150),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 91,
                              height: 91,
                              decoration: ShapeDecoration(
                                color: Color(0xff3CD7E4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 6,
                                    offset: Offset(2, 2),
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Image.asset(
                                      'lib/images/tuberculosis.png',
                                      height: 150,
                                      width: 150),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 91,
                              height: 91,
                              decoration: ShapeDecoration(
                                color: Color(0xff3CD7E4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 6,
                                    offset: Offset(2, 2),
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Image.asset('lib/images/kidneys.png',
                                      height: 150, width: 150),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        'By Hospital',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(child: HospitalList())),
                    const SizedBox(
                      height: 40,
                    )
                    //HospitalList(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      //bottomNavigationBar: const NavBar(),
    );
  }

  // ignore: non_constant_identifier_names
  ListView HospitalList() {
    return ListView.separated(
      itemCount: hospitalList.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const DoctorList();
                  // return Placeholder();
                },
              ),
            );
          },
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: 73,
                    width: 77,
                    child: Image.asset(
                      hospitalList[index].hospitalImg,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // images
                  // Container(
                  //   height: 73,
                  //   width: 73,
                  //   child: Image.asset(
                  //     hospitalList[index].hospitalImg,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hospitalList[index].hospitalName,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0,
                              height: 1.2,
                              color: Color(0xffFAFAFA)),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city_rounded,
                              size: 30,
                              color: wColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 210,
                              height: 30,
                              child: Text(
                                hospitalList[index].hospitalAddress,
                                style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 12.0,
                                    color: Color(0xffFAFAFA)),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      //to set the gap
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container SearchField() {
    return Container(
      width: 340,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 163, 162, 162),
                blurRadius: 5,
                offset: Offset(0, 5)),
          ],
          color: const Color(0xffF7F8F8),
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: const TextField(
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: "Search for your doctor",
          hintStyle: TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Color(0xffB5B5B5)),
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: Color(0xffFAFAFA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
