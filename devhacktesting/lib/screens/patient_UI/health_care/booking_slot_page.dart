// // // import 'package:flutter/material.dart';

// // // class BookingSlotPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Book Slot'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               'Patient Review',
// // //               textAlign: TextAlign.start,
// // //               style: TextStyle(
// // //                 color: Color(0xFF075C94),
// // //                 fontSize: 25,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 20),
// // //             Center(
// // //               child: ElevatedButton(
// // //                 onPressed: () {
// // //                   // Add your booking logic here
// // //                   // This is where you can navigate to the booking details page
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (context) => BookingDetailsPage(),
// // //                     ),
// // //                   );
// // //                 },
// // //                 style: ElevatedButton.styleFrom(
// // //                   primary: Color(0xFF075C94),
// // //                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// // //                   shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(8),
// // //                   ),
// // //                 ),
// // //                 child: Text(
// // //                   'Book Slot',
// // //                   style: TextStyle(
// // //                     color: Colors.white,
// // //                     fontSize: 18,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // class BookingDetailsPage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Booking Details'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(
// // //               'Booking Details',
// // //               style: TextStyle(
// // //                 fontSize: 20,
// // //                 fontWeight: FontWeight.bold,
// // //               ),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             // Add more widgets for displaying booking details
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';

// // class BookingSlotPage extends StatefulWidget {
// //   @override
// //   _BookingSlotPageState createState() => _BookingSlotPageState();
// // }

// // class _BookingSlotPageState extends State<BookingSlotPage> {
// //   String appointmentType = 'Physical';
// //   bool isTodaySelected = true;
// //   DateTime selectedDate = DateTime.now();
// //   TimeOfDay selectedTime = TimeOfDay.now();
// //   bool acceptTermsAndConditions = false;
// //   bool isNearestTimeSlotSelected = true;

// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? pickedDate = await showDatePicker(
// //       context: context,
// //       initialDate: selectedDate,
// //       firstDate: DateTime.now(),
// //       lastDate: DateTime(DateTime.now().year + 1),
// //     );

// //     if (pickedDate != null && pickedDate != selectedDate) {
// //       setState(() {
// //         selectedDate = pickedDate;
// //       });
// //     }
// //   }

// //   Future<void> _selectTime(BuildContext context) async {
// //     final TimeOfDay? pickedTime = await showTimePicker(
// //       context: context,
// //       initialTime: selectedTime,
// //     );

// //     if (pickedTime != null && pickedTime != selectedTime) {
// //       setState(() {
// //         selectedTime = pickedTime;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Booking Details'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               'Booking Details',
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             _buildAppointmentTypeDropdown(),
// //             const SizedBox(height: 16),
// //             Row(
// //               children: [
// //                 Text('Nearest Time Slot'),
// //                 Switch(
// //                   value: isNearestTimeSlotSelected,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       isNearestTimeSlotSelected = value;
// //                     });
// //                   },
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 16),
// //             if (!isNearestTimeSlotSelected) _buildDateSelection(),
// //             const SizedBox(height: 16),
// //             _buildConditionInput(),
// //             const SizedBox(height: 16),
// //             _buildTermsAndConditionsCheckbox(),
// //             const SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => BookingSlotPage(),
// //                   ),
// //                 );
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 primary: Color(0xFF075C94), // Button background color
// //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //               ),
// //               child: Text(
// //                 'Book Slot',
// //                 style: TextStyle(
// //                   color: Colors.white, // Text color
// //                   fontSize: 18,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildAppointmentTypeDropdown() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Appointment Type:',
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 8),
// //         DropdownButton<String>(
// //           value: appointmentType,
// //           onChanged: (value) {
// //             setState(() {
// //               appointmentType = value!;
// //             });
// //           },
// //           // onChanged: (String newValue) {
// //           //   setState(
// //           //     () {
// //           //       appointmentType = newValue;
// //           //     },
// //           //   );
// //           // },
// //           items: <String>['Physical', 'Virtual'].map((String value) {
// //             return DropdownMenuItem<String>(
// //               value: value,
// //               child: Text(value),
// //             );
// //           }).toList(),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildDateSelection() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Date and Time:',
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 8),
// //         Row(
// //           children: [
// //             ElevatedButton(
// //               onPressed: () => _selectDate(context),
// //               child: Text('Select Date'),
// //             ),
// //             SizedBox(width: 8),
// //             ElevatedButton(
// //               onPressed: () => _selectTime(context),
// //               child: Text('Select Time'),
// //             ),
// //           ],
// //         ),
// //         Center(
// //           child: ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => BookingDetailsPage(
// //                     selectedDate: selectedDate,
// //                     selectedTime: selectedTime,
// //                   ),
// //                 ),
// //               );
// //             },
// //             style: ElevatedButton.styleFrom(
// //               primary: Color(0xFF075C94),
// //               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //             ),
// //             child: Text(
// //               'Book Slot',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 18,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildConditionInput() {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(
// //           'Your Condition (if any):',
// //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //         ),
// //         SizedBox(height: 8),
// //         TextFormField(
// //           maxLines: 3,
// //           decoration: InputDecoration(
// //             border: OutlineInputBorder(),
// //             hintText: 'Enter your condition here...',
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildTermsAndConditionsCheckbox() {
// //     return Row(
// //       children: [
// //         Checkbox(
// //           value: acceptTermsAndConditions,
// //           onChanged: (value) {
// //             setState(() {
// //               acceptTermsAndConditions = value!;
// //             });
// //           },
// //           // onChanged: (bool value) {
// //           //   setState(() {
// //           //     acceptTermsAndConditions = value;
// //           //   });
// //           // },
// //         ),
// //         Text(
// //           'I accept the terms and conditions',
// //           style: TextStyle(fontSize: 16),
// //         ),
// //       ],
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class BookingSlotPage extends StatefulWidget {
//   @override
//   _BookingSlotPageState createState() => _BookingSlotPageState();
// }

// class _BookingSlotPageState extends State<BookingSlotPage> {
//   bool isNearestTimeSlotSelected = true;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Slot'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Booking Slot',
//               textAlign: TextAlign.start,
//               style: TextStyle(
//                 color: Color(0xFF075C94),
//                 fontSize: 25,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Text('Book for today '),
//                 Switch(
//                   value: isNearestTimeSlotSelected,
//                   onChanged: (value) {
//                     setState(() {
//                       isNearestTimeSlotSelected = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             if (!isNearestTimeSlotSelected) _buildDateSelection(),
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Add your booking logic here
//                   // This is where you can navigate to the booking details page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => BookingDetailsPage(
//                         selectedDate: selectedDate,
//                         selectedTime: selectedTime,
//                       ),
//                     ),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFF075C94),
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 //             _buildConditionInput(),
// //             const SizedBox(height: 16),
// //             _buildTermsAndConditionsCheckbox(),
//                 child: Text(
//                   'Book Slot',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   // if (!isNearestTimeSlotSelected) _buildDateSelection(),
// //             const SizedBox(height: 16),
// //             _buildConditionInput(),
// //             const SizedBox(height: 16),
// //             _buildTermsAndConditionsCheckbox(),
// //             const SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => BookingSlotPage(),
// //                   ),
// //                 );
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 primary: Color(0xFF075C94), // Button background color
// //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //               ),
// //               child: Text(
// //                 'Book Slot',
// //                 style: TextStyle(
// //                   color: Colors.white, // Text color
// //                   fontSize: 18,
// //                 ),
// //               ),
// //             ),

//   Widget _buildDateSelection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Booking Date and Time:',
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         Row(
//           children: [
//             ElevatedButton(
//               onPressed: () => _selectDate(context),
//               child: Text('Select Date'),
//             ),
//             SizedBox(width: 8),
//             ElevatedButton(
//               onPressed: () => _selectTime(context),
//               child: Text('Select Time'),
//             ),
//           ],
//         ),
//         if (selectedDate != null)
//           Text(
//               'Selected Date: ${selectedDate!.toLocal().toString().substring(0, 10)}'),
//         if (selectedTime != null)
//           Text('Selected Time: ${selectedTime!.format(context)}'),
//       ],
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 30)),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }
// }

// class BookingDetailsPage extends StatelessWidget {
//   final DateTime? selectedDate;
//   final TimeOfDay? selectedTime;

//   BookingDetailsPage({
//     required this.selectedDate,
//     required this.selectedTime,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Booking Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Booking Details',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (selectedDate != null)
//               Text('Selected Date: ${selectedDate!.toLocal()}'),
//             if (selectedTime != null)
//               Text('Selected Time: ${selectedTime!.format(context)}'),
//             // Add more widgets for displaying booking details
//           ],
//         ),
//       ),
//     );
//   }
// }

// extension TimeOfDayExtension on TimeOfDay {
//   String format(BuildContext context) {
//     final TimeOfDayFormat format =
//         MaterialLocalizations.of(context).timeOfDayFormat();
//     return format == TimeOfDayFormat.HH_colon_mm
//         ? '$hour:$minute'
//         : '$hour:$minute $period';
//   }
// }

import 'package:devhacktesting/screens/patient_UI/home/queue_list_view.dart';
import 'package:flutter/material.dart';

class BookingSlotPage extends StatefulWidget {
  @override
  _BookingSlotPageState createState() => _BookingSlotPageState();
}

class _BookingSlotPageState extends State<BookingSlotPage> {
  String appointmentType = 'Physical';
  bool isNearestTimeSlotSelected = true;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String conditionInput = '';
  bool termsAndConditionsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Slot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You booking slot with...',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color(0xFF075C94),
                  fontSize: 25,
                ),
              ),
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
              const SizedBox(height: 10),
              Container(
                height: 2,
                color: Colors.blue.shade800, // Change color as needed
                width: 350,
              ),
              const SizedBox(height: 10),
              _buildAppointmentTypeDropdown(),
              Row(
                children: [
                  Text(
                    'Nearest Time Slot',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isNearestTimeSlotSelected,
                    onChanged: (value) {
                      setState(() {
                        isNearestTimeSlotSelected = value;
                      });
                    },
                  ),
                ],
              ),
              if (!isNearestTimeSlotSelected) _buildDateSelection(),
              const SizedBox(height: 16),
              _buildConditionInput(),
              const SizedBox(height: 16),
              _buildTermsAndConditionsCheckbox(),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (termsAndConditionsChecked) {
                      // Add your booking logic here
                      // This is where you can navigate to the booking details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailsPage(
                            appointmentType: appointmentType,
                            nearestTimeSlotSelected: isNearestTimeSlotSelected,
                            selectedDate: selectedDate,
                            selectedTime: selectedTime,
                            conditionInput: conditionInput,
                            termsAndConditionsChecked:
                                termsAndConditionsChecked,
                          ),
                        ),
                      );
                    } else {
                      // Show dialog if terms and conditions are not checked
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Please Agree to Terms and Conditions'),
                            content: Text(
                                'You must agree to the terms and conditions before submitting.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF075C94),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Book Slot',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentTypeDropdown() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Appointment Type:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 14),
        DropdownButton<String>(
          value: appointmentType,
          onChanged: (value) {
            setState(() {
              appointmentType = value!;
            });
          },
          // onChanged: (String newValue) {
          //   setState(
          //     () {
          //       appointmentType = newValue;
          //     },
          //   );
          // },
          items: <String>['Physical', 'Virtual'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildConditionInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Condition Input:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          onChanged: (value) {
            setState(() {
              conditionInput = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter your condition...',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditionsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: termsAndConditionsChecked,
          onChanged: (value) {
            setState(() {
              termsAndConditionsChecked = value ?? false;
            });
          },
        ),
        Text(
          'I agree to the Terms and Conditions',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  // Widget _buildDateSelection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Date and Time:',
  //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(height: 8),
  //       Row(
  //         children: [
  //           ElevatedButton(
  //             onPressed: () => _selectDate(context),
  //             child: Text('Select Date'),
  //           ),
  //           SizedBox(width: 8),
  //           ElevatedButton(
  //             onPressed: () => _selectTime(context),
  //             child: Text('Select Time'),
  //           ),
  //           if (selectedDate != null)
  //             Text('Selected Date: ${selectedDate!.toLocal()}'),
  //           if (selectedTime != null)
  //             Text('Selected Time: ${selectedTime!.format(context)}'),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildDateSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Date and Time:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
          ],
        ),
        // if (selectedDate != null)
        //   Text(
        //       'Selected Date: ${selectedDate!.toLocal().toString().substring(0, 10)}'),
        // if (selectedTime != null)
        //   Text('Selected Time: ${selectedTime!.format(context)}'),
        if (selectedDate != null)
          Row(
            children: [
              Text(
                'Selected Date: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                selectedDate!.toLocal().toString().substring(0, 10),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        if (selectedTime != null)
          Row(
            children: [
              Text(
                'Selected Time: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                selectedTime!.format(context),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        const SizedBox(height: 10),
        Text(
            "plese remind that please ready before 15 minutes of your booking time",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }
}

// class BookingDetailsPage extends StatelessWidget {
//   final String appointmentType;
//   final bool nearestTimeSlotSelected;
//   final DateTime? selectedDate;
//   final TimeOfDay? selectedTime;
//   final String conditionInput;
//   final bool termsAndConditionsChecked;

//   BookingDetailsPage({
//     required this.appointmentType,
//     required this.nearestTimeSlotSelected,
//     required this.selectedDate,
//     required this.selectedTime,
//     required this.conditionInput,
//     required this.termsAndConditionsChecked,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Booking Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Booking Details',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16),
//             if (selectedDate != null)
//               Text('Selected Date: ${selectedDate!.toLocal()}'),
//             if (selectedTime != null)
//               Text('Selected Time: ${selectedTime!.format(context)}'),
//             const SizedBox(height: 16),
//             Text('Condition Input: $conditionInput'),
//             const SizedBox(height: 16),
//             Text('Terms and Conditions Checked: $termsAndConditionsChecked'),
//             // Add more widgets for displaying booking details
//           ],
//         ),
//       ),
//     );
//   }
// }

class BookingDetailsPage extends StatelessWidget {
  final String doctorName = 'Dr Lim Boon Xiong';
  final String doctorSpeciality = 'Heart Specialist';
  final String appointmentType;
  final bool nearestTimeSlotSelected;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final String conditionInput;
  final bool termsAndConditionsChecked;

  BookingDetailsPage({
    required this.appointmentType,
    required this.nearestTimeSlotSelected,
    required this.selectedDate,
    required this.selectedTime,
    required this.conditionInput,
    required this.termsAndConditionsChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            BookingDetailItem(
              label: 'Doctor Name',
              value: doctorName,
            ),
            BookingDetailItem(
              label: 'Speciality',
              value: doctorSpeciality,
            ),
            BookingDetailItem(
              label: 'Appointment Type',
              value: appointmentType,
            ),
            BookingDetailItem(
              label: 'Nearest Time Slot',
              value: nearestTimeSlotSelected ? 'Yes' : 'No',
            ),
            if (nearestTimeSlotSelected != true)
              BookingDetailItem(
                label: 'Selected Date',
                value: selectedDate!.toLocal().toString().substring(0, 10),
              ),
            if (nearestTimeSlotSelected != true)
              BookingDetailItem(
                label: 'Selected Time',
                value: selectedTime!.format(context),
              ),
            BookingDetailItem(
              label: 'Condition Input',
              value: conditionInput,
            ),
            // BookingDetailItem(
            //   label: 'Terms and Conditions Checked',
            //   value: termsAndConditionsChecked ? 'Yes' : 'No',
            // ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Perform submission logic here
            //     // You can navigate back or perform other actions
            //     // Navigator.pop(context);

            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => queuelistView()));
            //   },
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.blue,
            //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            //   child: Text(
            //     'Submit',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //     ),
            //   ),
            // ),
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
                            // Navigate to the queue list view or any other page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => queuelistView()),
                            );
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDetailItem extends StatelessWidget {
  final String label;
  final String value;

  BookingDetailItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  String format(BuildContext context) {
    final TimeOfDayFormat format =
        MaterialLocalizations.of(context).timeOfDayFormat();
    return format == TimeOfDayFormat.HH_colon_mm
        ? '$hour:$minute'
        : '$hour:$minute $period';
  }
}
