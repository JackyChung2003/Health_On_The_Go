//import 'package:devhacktesting/screens/nav_page.dart';
import 'package:devhacktesting/screens/doctor_UI/patient_list/patient_list_page.dart';
// import 'package:devhacktesting/screens/health_care/doctor_page.dart';
// import 'package:devhacktesting/screens/health_care/health_care_page.dart';
import 'package:devhacktesting/screens/patient_UI/health_care/doctor_page.dart';
import 'package:devhacktesting/screens/patient_UI/health_care/modals/doctor_list.dart';
import 'package:devhacktesting/screens/patient_UI/nav_page.dart';
import 'package:flutter/material.dart';
//import 'package:devhacktesting/screens/health_care/health_care_page.dart';
import 'package:devhacktesting/screens/colors.dart';
// import 'package:devhacktesting/modals/doctor_list.dart';

// ignore: camel_case_types
class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  List<DoctorModel> doctorList = [];

  void _getDoctor() {
    doctorList = DoctorModel.getDoctor();
  }

  @override
  Widget build(BuildContext context) {
    _getDoctor();
    return Container(
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
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
                    const SizedBox(width: 60),
                    const Text(
                      'Doctors List',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'Merriweather Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              // Add CircleAvatar here
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('lib/images/HospitalLohGuanLye.jpeg'),
              ),
              SizedBox(height: 20),
              Text(
                'Loh Guan Lye Specialists Centre',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '238, Jln Macalister, 10400 George Town, Pulau Pinang',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    child: ListView.separated(
                  itemCount: doctorList.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const DoctorDetails();
                            },
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                // images
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 103,
                                  width: 93,
                                  child: Image.asset(
                                    doctorList[index].DoctorImg,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctorList[index].DoctorName,
                                        style: const TextStyle(
                                          color: Color(0xFF075C94),
                                          fontSize: 20,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        doctorList[index].DoctorSpecialist,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        doctorList[index].DoctorDescription,
                                        style: const TextStyle(
                                          color: Color(0xFFEFEBEB),
                                          fontSize: 9,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  //to set the gap
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
