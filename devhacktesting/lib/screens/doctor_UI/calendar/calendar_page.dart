// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// // import 'package:google_nav_bar/google_nav_bar.dart';

// // class Calendar extends StatefulWidget {
// //   Calendar({Key? key}) : super(key: key);

// //   @override
// //   State<Calendar> createState() => _CalendarState();
// // }

// // class _CalendarState extends State<Calendar> {
// //   // declaration for calendar
// //   CalendarFormat _format = CalendarFormat.month;
// //   DateTime _focusDay = DateTime.now();
// //   DateTime _currentDay = DateTime.now();
// //   int? _currentIndex;
// //   bool _isWeekend = false;
// //   bool _dateSelected = false;
// //   bool _timeSelected = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     Config().init(context);

// //     return Scaffold(
// //       body: Center(
// //         child: Text('calendar'),
// //       ),
// //     );
// //   }
// // }

// class Calendar extends StatefulWidget {
//   @override
//   _CalendarState createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('TableCalendar - Basics'),
//       // ),
//       body: Container(
//         color: Colors.blueGrey,
//         padding: EdgeInsets.all(20.0),
//         child: Container(
//           color: Colors.blue,
//           child: TableCalendar(
//             // firstDay: kFirstDay,
//             // lastDay: kLastDay,

//             firstDay: DateTime.utc(2010, 10, 16),
//             lastDay: DateTime.utc(2030, 3, 14),
//             focusedDay: _focusedDay,
//             calendarFormat: _calendarFormat,
//             selectedDayPredicate: (day) {
//               // Use `selectedDayPredicate` to determine which day is currently selected.
//               // If this returns true, then `day` will be marked as selected.

//               // Using `isSameDay` is recommended to disregard
//               // the time-part of compared DateTime objects.
//               return isSameDay(_selectedDay, day);
//             },
//             onDaySelected: (selectedDay, focusedDay) {
//               if (!isSameDay(_selectedDay, selectedDay)) {
//                 // Call `setState()` when updating the selected day
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay;
//                 });
//               }
//             },
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 // Call `setState()` when updating calendar format
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               // No need to call `setState()` here
//               _focusedDay = focusedDay;
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhacktesting/components/event_dropdown_button.dart';
import 'package:devhacktesting/components/frequency_dropdown_button.dart';
import 'package:devhacktesting/components/interval_dropdown_button.dart';
import 'package:devhacktesting/components/my_timeline_tile.dart';
import 'package:devhacktesting/components/repeat_event_switch.dart';
import 'package:devhacktesting/read_data/get_event_detail.dart';
import 'package:devhacktesting/screens/patient_UI/calendar/montly_overview.dart';
import 'package:devhacktesting/screens/patient_UI/nav_page.dart';
import 'package:devhacktesting/screens/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timeline_tile/timeline_tile.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class Calendar extends StatefulWidget {
//   Calendar({Key? key}) : super(key: key);

//   @override
//   State<Calendar> createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   // declaration for calendar
//   CalendarFormat _format = CalendarFormat.month;
//   DateTime _focusDay = DateTime.now();
//   DateTime _currentDay = DateTime.now();
//   int? _currentIndex;
//   bool _isWeekend = false;
//   bool _dateSelected = false;
//   bool _timeSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);

//     return Scaffold(
//       body: Center(
//         child: Text('calendar'),
//       ),
//     );
//   }
// }

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // firestore
  final FirestoreService firestoreService = FirestoreService();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime now = DateTime.now();
  // DateTime _focusedDay = DateTime(now.year, now.month, now.day);
  DateTime _focusedDay =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  bool firstEnter = true;

  DateTime? _selectedDay;

  bool eventCompleted = false;
  bool calendarLoaded = true;
  bool isRepeatEvent = false; // Set an initial value

  // text controller for adding event
  final TextEditingController eventTextController = TextEditingController();
  final TextEditingController eventOccurrenceController =
      TextEditingController();
  final TextEditingController eventFrequencyController =
      TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  // final TextEditingController eventTimeController = TextEditingController();
  TimeOfDay eventTimeController = TimeOfDay.now();
  final TextEditingController check = TextEditingController();
  // final TextEditingController dueDateController = TextEditingController();

  // TextEditingController eventTextController =
  //     TextEditingController(text: _currentEventOptionsSelected);

  // list of event
  // eventList[index][0] == event name
  // eventList[index][1] == event completed or not
  // eventList[index][2] == event passed or not
  // List eventList = [
  //   ['Daily Checkup', true, true],
  //   ['Paracetamol 500mg', true, true],
  //   ['Daily exercise', false, false],
  //   ['Virtual Consultation', false, false],
  // ];

  // List<Map<String, dynamic>> eventDataList = [];
  List<dynamic> eventDataList = [];

  // for user to add event
  // var eventOptions = [
  //   'Medicine Reminder',
  //   'Exercise',
  //   'Diet Plan',
  //   'Lifestyle Modification',
  //   'Others'
  // ];
  var _currentEventOptionsSelected = "Medicine Reminder";
  bool _currentRepeatTick = false;
  var event = "Medicine Reminder";

  var _currentfrequencyOptionsSelected = "Daily";
  var frequency = "Daily";

  var _currentIntervalOptionsSelected = "Once a day";
  var interval = "'Once a day'";

  // document IDs
  List<String> docIDs = [];

  String getUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  // // get docIDs
  // Future getDocId() async {
  //   docIDs.clear(); // Clear the existing docIDs list.

  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(getUid())
  //       .collection('events')
  //       .get()
  //       .then(
  //         (snapshot) => snapshot.docs.forEach(
  //           (document) {
  //             print(document.reference);
  //             docIDs.add(document.reference.id);
  //           },
  //         ),
  //       );
  // }

  // get docIDs
  Future getDocId(DateTime selectedDateTime, bool firstTime) async {
    docIDs.clear(); // Clear the existing docIDs list.
    String dateTimeString = selectedDateTime.toString();
    String trimmedString;
    if (!firstTime) {
      trimmedString = dateTimeString.substring(0, dateTimeString.length - 1);
    } else {
      trimmedString = dateTimeString;
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(getUid())
        .collection('events')
        // .orderBy('date_of_event', descending: false)
        .where('date_category', isEqualTo: trimmedString)
        .orderBy('event_date_time')
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
              print(document.reference);
              debugPrint('docID: ${document.reference.id}');
              docIDs.add(document.reference.id);
            },
          ),
        );
  }

//
  // method for checkbox to be tap
  void checkBoxTapped(bool? value, int index) {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      // eventCompleted = value!;
      // eventList[index][1] = !eventList[index][1];
    });
    firestoreService.updateEvent(
        docIDs[index], value!); // update the event in firestore
    // loadEventDataAdjust(false);

    // debugPrint('end new value: $value');
  }

  // method for dropdown to be tap
  void dropdownEventTapped(bool? value, var newValueSelected) {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      _currentEventOptionsSelected = newValueSelected!;
      event = newValueSelected;
      // eventCompleted = value!;
      // eventList[index][1] = !eventList[index][1];
    });
    // debugPrint('end new value: $value');
  }

  int numberScheduleDate = 1;
  // method for dropdown to be tap
  void dropdownFrequencyTapped(bool? value, var newValueSelected) {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      _currentfrequencyOptionsSelected = newValueSelected!;
      frequency = newValueSelected;
      if (newValueSelected == 'Daily') {
        numberScheduleDate = 1;
      } else if (newValueSelected == 'Weekly') {
        numberScheduleDate = 7; // Replace with the appropriate default value
      } else if (newValueSelected == 'Montly') {
        numberScheduleDate = 31; // Replace with the appropriate default value
      } else if (newValueSelected == 'Yearly') {
        numberScheduleDate = 365; // Replace with the appropriate default value
      } else {
        numberScheduleDate = 1;
      }
    });
    // debugPrint('end new value: $value');
  }

  int numberInterval = 1;
  // method for dropdown to be tap
  void dropdownIntervalTapped(bool? value, var newValueSelected) {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      _currentIntervalOptionsSelected = newValueSelected!;
      interval = newValueSelected;
      // eventCompleted = value!;
      // eventList[index][1] = !eventList[index][1];
      if (newValueSelected == 'Once a day') {
        numberInterval = 1;
      } else if (newValueSelected == '2 times a day') {
        numberInterval = 2; // Replace with the appropriate default value
      } else if (newValueSelected == '3 times a day') {
        numberInterval = 3; // Replace with the appropriate default value
      } else if (newValueSelected == '4 times a day') {
        numberInterval = 4; // Replace with the appropriate default value
      } else if (newValueSelected == '5 times a day') {
        numberInterval = 5; // Replace with the appropriate default value
      }
    });
    // debugPrint('end new value: $value');
  }

  // method forrepeat event to be tap
  void repeatEventTapped(bool? value) {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      isRepeatEvent = value!;
      _currentRepeatTick = value!;
      // eventCompleted = value!;
      // eventList[index][1] = !eventList[index][1];
    });
    // debugPrint('end new value: $value');
  }

  void firstTimeEnterPage() {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      firstEnter = false;
      // eventCompleted = value!;
      // eventList[index][1] = !eventList[index][1];
    });
    // debugPrint('end new value: $value');
  }

  // method to open dialog box for adding event
  void openAddEventBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          constraints: BoxConstraints(
            maxHeight: 400,
          ),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      'Event Type:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    EventDropdownWidget(
                      onChanged: (newValueSelected) {
                        dropdownEventTapped(true, newValueSelected);
                        // setState(
                        //   () {
                        //     dropdownEventTapped(true, newValueSelected);
                        //   },
                        // );
                      },
                      selectedEventType:
                          _currentEventOptionsSelected, // Provide the selectedEventType
                    ),
                    // eventTextController.text = _currentEventOptionsSelected;
                  ],
                ),
              ),
              TextField(
                  controller: eventTextController,
                  decoration: InputDecoration(
                    hintText: "Event Name / Medicine Name",
                    // hintText: isRepeatEvent.toString(),
                  )),
              // TextField(
              //     controller: eventOccurrenceController,
              //     decoration: InputDecoration(
              //       hintText:
              //           "Event Occurrence(button to on or off to indicate repeat event or not)",
              //     )),
              SizedBox(
                child: Row(
                  children: [
                    Text(
                      'Repeat:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    RepeatEventButton(
                      onChanged: (isRepeatEvent) {
                        // print('Repeat Event Tapped: $isRepeatEvent');
                        repeatEventTapped(isRepeatEvent);

                        // debugPrint('after Event Tapped: $isRepeatEvent');
                        // setState(
                        //   () {
                        //     dropdownEventTapped(true, newValueSelected);
                        //   },
                        // );
                      },
                      tick: _currentRepeatTick,
                      // repeatedEvent: isRepeatEvent,
                    ),
                    // eventTextController.text = _currentEventOptionsSelected;
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Medication Schedule',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FrequencyDropdownWidget(
                      onChanged: (newValueSelected) {
                        dropdownFrequencyTapped(true, newValueSelected);
                        // setState(
                        //   () {
                        //     dropdownEventTapped(true, newValueSelected);
                        //   },
                        // );
                      },
                      selectedFrequencyType:
                          _currentfrequencyOptionsSelected, // Provide the selectedEventType
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    // eventTextController.text = _currentEventOptionsSelected;
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Time interval:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IntervalDropdownWidget(
                      onChanged: (newValueSelected) {
                        dropdownIntervalTapped(true, newValueSelected);
                        // setState(
                        //   () {
                        //     dropdownEventTapped(true, newValueSelected);
                        //   },
                        // );
                      },
                      selectedIntervalType:
                          _currentIntervalOptionsSelected, // Provide the selectedEventType
                    ),
                    // eventTextController.text = _currentEventOptionsSelected;

                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              // TextField(
              //     controller: eventFrequencyController,
              //     decoration: InputDecoration(
              //       hintText: "Frequency （future should be button)",
              //     )),
              // TextField(
              //     controller: startDateController,
              //     decoration: InputDecoration(
              //       hintText: "Start Date(should be date picker)",
              //     )),
              Row(
                children: [
                  // Text("${selectedDates.duration.inDays}"),
                  // Text("Date Range selector"),
                  // if (selectedDates != null)
                  //   Text("${selectedDates.start} - ${selectedDates.end}"),
                  ElevatedButton(
                    child: Text("Choose Dates"),
                    onPressed: () async {
                      final DateTimeRange? dateTimeRange =
                          await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(3000),
                      );
                      // final selectedDate = await showDatePicker(
                      //   context: context,
                      //   initialDate: DateTime.now(),
                      //   firstDate: DateTime(2000),
                      //   lastDate: DateTime(2101),
                      // );
                      if (dateTimeRange != null) {
                        setState(() {
                          selectedDates = dateTimeRange;
                        });
                      }
                    },
                  ),
                ],
              ),
              TextButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (selectedDate != null) {
                    startDateController.text =
                        selectedDate.toLocal().toString();
                  }
                },
                child: Text("Pick Date"),
              ),
              // TextField(
              //     controller: endDateController,
              //     decoration: InputDecoration(
              //       hintText: "End Date(should be date picker)",
              //     )),
              // TextButton(
              //   onPressed: () async {
              //     final selectedDate = await showDatePicker(
              //       context: context,
              //       initialDate: DateTime.now(),
              //       firstDate: DateTime(2000),
              //       lastDate: DateTime(2101),
              //     );
              //     if (selectedDate != null) {
              //       endDateController.text = selectedDate.toLocal().toString();
              //     }
              //   },
              //   child: Text("Pick Date"),
              // ),
              // TextField(
              //     controller: eventTimeController,
              //     decoration: InputDecoration(
              //       hintText: "Time(should be time picker)",
              //     )),
              TextButton(
                onPressed: () async {
                  final selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    // final time = selectedTime.format(context);
                    // eventTimeController.text = time;
                    setState(() {
                      eventTimeController = selectedTime;
                    });
                  }
                },
                child: Text("Pick Time"),
              ),
            ],
          ),
        ),
        actions: [
          // button to save
          ElevatedButton(
              onPressed: () {
                // add the event to the list
                if (_currentRepeatTick) {
                  createRepeatedEvents(
                    numberInterval,
                    numberScheduleDate,
                    selectedDates,
                    eventTimeController,
                  );
                  // createRepeatedEvents(
                  //   _currentIntervalOptionsSelected,
                  //   _currentfrequencyOptionsSelected,
                  //   selectedDates,
                  //   eventTimeController,
                  // );
                } else {}

                // firestoreService.createEvent(
                //     event,
                //     eventTextController.text,
                //     _currentRepeatTick,
                //     eventFrequencyController.text,
                //     startDateController.text,
                //     endDateController.text,
                //     eventTimeController.text);

                // clear the text controller
                eventTextController.clear();
                selectedDates = DateTimeRange(
                  start: DateTime.now(),
                  end: DateTime.now(),
                );

                // close the dialog box
                Navigator.pop(context);
              },
              child: Text("Add"))
        ],
      ),
    );
  }

  int calculateTotalDays(DateTime startDate, DateTime endDate) {
    Duration difference = endDate.difference(startDate);
    int totalDays =
        difference.inDays + 1; // Add 1 to include both the start and end dates
    return totalDays;
  }

  void createRepeatedEvents(
    int repeatTimeInterval,
    int repeatMedicalSchedule,
    DateTimeRange selectedDates, // Add this parameter
    TimeOfDay time,
  ) {
    // Calculate the timestamp for the start date and time
    DateTime startDateTime = selectedDates.start; // Use the selected start date

    // Calculate the timestamp for the end date
    DateTime endDateTime = selectedDates.end; // Use the selected end date

    // DateTime startDateTime = DateTime.now(); // Replace with your start date
    // DateTime parsedStartTime = DateTime.parse(startTime);
    startDateTime =
        startDateTime.add(Duration(hours: time.hour, minutes: time.minute));

    endDateTime =
        endDateTime.add(Duration(hours: time.hour, minutes: time.minute));

    // Calculate the timestamp for the end date
    // DateTime endDateTime = startDateTime; // Use the same start time for the end

    double timeInterval;
    timeInterval = 24 / repeatTimeInterval;

    int hoursInterval = timeInterval.toInt();
    int minutesInterval = ((timeInterval - hoursInterval) * 60).toInt();
    // Set the repeat interval based on the frequency
    int repeatInterval;

    int totalDays = calculateTotalDays(startDateTime, endDateTime);

    if (repeatMedicalSchedule == 1) {
      repeatInterval = 1; // Daily
    } else if (repeatMedicalSchedule == 7) {
      repeatInterval = 7; // Weekly
    } else if (repeatMedicalSchedule == 30) {
      repeatInterval = 30; // Monthly
    } else {
      repeatInterval = 365; // Yearly
    }

    // Create Firestore documents for each selected day
    DateTime currentTimestamp = startDateTime;
    String dataDate = selectedDates.start.toString();
    // for (String day in totalDays) {
    // Calculate the timestamp for the current day
    // DateTime currentTimestamp = startDateTime;
    while (currentTimestamp.isBefore(endDateTime)) {
      if (repeatTimeInterval != 1) {
        for (int i = 0; i < (repeatTimeInterval * totalDays); i++) {
          createFirestoreDocument(currentTimestamp, dataDate);
          currentTimestamp = currentTimestamp
              .add(Duration(hours: hoursInterval, minutes: minutesInterval));
        }
      } else {
        for (int i = 0; i < (repeatTimeInterval); i++) {
          createFirestoreDocument(currentTimestamp, dataDate);
          currentTimestamp = currentTimestamp
              .add(Duration(hours: hoursInterval, minutes: minutesInterval));
        }
        currentTimestamp =
            currentTimestamp.add(Duration(days: repeatInterval - 1));
      }
      // // Create a Firestore document with currentTimestamp
      // createFirestoreDocument(eventType, eventText, currentTimestamp);
      // currentTimestamp = currentTimestamp.add(Duration(days: repeatInterval));
    }
    // Handle other days (Tuesday, Wednesday, etc.) similarly
    // }
  }

  // void createRepeatedEvents(
  //   String repeatTimeInterval,
  //   String repeatMedicalSchedule,
  //   DateTimeRange selectedDates,
  //   TimeOfDay time,
  // ) {
  //   // Define the list of times for each repeat interval
  //   List<TimeOfDay> times = [];

  //   if (repeatTimeInterval == 'Once a day') {
  //     times.add(
  //         TimeOfDay(hour: 9, minute: 0)); // Change this to your desired time
  //   } else if (repeatTimeInterval == '2 times a day') {
  //     times.addAll(
  //         [TimeOfDay(hour: 9, minute: 0), TimeOfDay(hour: 21, minute: 0)]);
  //   } else if (repeatTimeInterval == '3 times a day') {
  //     times.addAll([
  //       TimeOfDay(hour: 9, minute: 0),
  //       TimeOfDay(hour: 14, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == '4 times a day') {
  //     times.addAll([
  //       TimeOfDay(hour: 9, minute: 0),
  //       TimeOfDay(hour: 14, minute: 0),
  //       TimeOfDay(hour: 17, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == '5 times a day') {
  //     times.addAll([
  //       TimeOfDay(hour: 5, minute: 0),
  //       TimeOfDay(hour: 9, minute: 0),
  //       TimeOfDay(hour: 14, minute: 0),
  //       TimeOfDay(hour: 17, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'Every 3 hours') {
  //     times.addAll([
  //       TimeOfDay(hour: 0, minute: 0),
  //       TimeOfDay(hour: 3, minute: 0),
  //       TimeOfDay(hour: 6, minute: 0),
  //       TimeOfDay(hour: 9, minute: 0),
  //       TimeOfDay(hour: 12, minute: 0),
  //       TimeOfDay(hour: 15, minute: 0),
  //       TimeOfDay(hour: 18, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'Every 4 hours') {
  //     times.addAll([
  //       TimeOfDay(hour: 1, minute: 0),
  //       TimeOfDay(hour: 5, minute: 0),
  //       TimeOfDay(hour: 9, minute: 0),
  //       TimeOfDay(hour: 13, minute: 0),
  //       TimeOfDay(hour: 17, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'Every 6 hours') {
  //     times.addAll([
  //       TimeOfDay(hour: 6, minute: 0),
  //       TimeOfDay(hour: 12, minute: 0),
  //       TimeOfDay(hour: 18, minute: 0),
  //       TimeOfDay(hour: 0, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'Every 8 hours') {
  //     times.addAll([
  //       TimeOfDay(hour: 8, minute: 0),
  //       TimeOfDay(hour: 16, minute: 0),
  //       TimeOfDay(hour: 0, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'Every 12 hours') {
  //     times.addAll([
  //       TimeOfDay(hour: 9, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'Every 24 hours') {
  //     times.add(TimeOfDay(hour: time.hour, minute: time.minute));
  //   } else if (repeatTimeInterval == 'Bedtime') {
  //     times.add(TimeOfDay(hour: 21, minute: 0));
  //   } else if (repeatTimeInterval == 'With meals') {
  //     times.addAll([
  //       TimeOfDay(hour: 8, minute: 0),
  //       TimeOfDay(hour: 12, minute: 0),
  //       TimeOfDay(hour: 17, minute: 0),
  //     ]);
  //   } else if (repeatTimeInterval == 'With meals and at bedtime') {
  //     times.addAll([
  //       TimeOfDay(hour: 8, minute: 0),
  //       TimeOfDay(hour: 12, minute: 0),
  //       TimeOfDay(hour: 17, minute: 0),
  //       TimeOfDay(hour: 21, minute: 0),
  //     ]);
  //   }

  //   // Use the list of times to create events
  //   for (TimeOfDay eventTime in times) {
  //     // Calculate the timestamp for the start date and time
  //     DateTime startDateTime = selectedDates.start.add(
  //       Duration(hours: eventTime.hour, minutes: eventTime.minute),
  //     );

  //     // Calculate the timestamp for the end date
  //     DateTime endDateTime = selectedDates.end.add(
  //       Duration(hours: eventTime.hour, minutes: eventTime.minute),
  //     );

  //     // Calculate the repeat interval
  //     int repeatInterval;
  //     if (repeatMedicalSchedule == 'Daily') {
  //       repeatInterval = 1;
  //     } else if (repeatMedicalSchedule == 'Weekly') {
  //       repeatInterval = 7;
  //     } else if (repeatMedicalSchedule == 'Monthly') {
  //       repeatInterval = 30;
  //     } else {
  //       repeatInterval = 365;
  //     }

  //     // Create Firestore documents for each selected day
  //     DateTime currentTimestamp = startDateTime;
  //     while (currentTimestamp.isBefore(endDateTime)) {
  //       createFirestoreDocument(currentTimestamp);
  //       currentTimestamp = currentTimestamp.add(Duration(days: repeatInterval));
  //     }
  //   }
  // }

  void createFirestoreDocument(DateTime timestamp, String eventDate) {
    // Use FirestoreService to create a document with eventText and timestamp
    // FirebaseFirestore.instance.collection('your_collection').add({
    //   'eventText': eventText,
    //   'timestamp': Timestamp.fromDate(timestamp),
    // });

    // final dateOnlyTimestamp = Timestamp.fromDate(
    //     DateTime(timestamp.year, timestamp.month, timestamp.day));

    firestoreService.createEvent(
      event,
      eventTextController.text,
      // _currentRepeatTick,
      eventFrequencyController.text,
      // startDateController.text,
      // endDateController.text,
      timestamp,
      eventDate,
      // eventTimeController.text,
    );
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getDocId();
  //   super.initState();
  //   // getDocId();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getDocId().then((_) {
  //     // This will be called once when the document IDs are retrieved.
  //     setState(() {}); // Trigger a rebuild to show the data.
  //   });
  // }

  // Method to limit the load for the calendar only, dont load if press something not calendar
  // void loadCalendar() {
  //   getDocId().then((_) {
  //     setState(() {
  //       calendarLoaded =
  //           true; // Set calendarLoaded to true when the calendar is loaded.
  //     });
  //   });
  // }

  void loadEventDataAdjust(bool newValue) async {
    setState(() {
      calendarLoaded = newValue;
    });

    // for (int index = 0; index < docIDs.length; index++) {
    //   var documentData =
    //       await GetEventDetail(documentId: docIDs[index]).fetchEventData();
    //   if (documentData != null) {
    //     eventDataList.add(documentData);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TableCalendar - Basics'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          event = "Medicine Reminder";
          openAddEventBox();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      // backgroundColor: Color(0xff7BD8E3),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff7BD8E3).withOpacity(0.24), Color(0xff7BD8E3)],
          ),
        ),
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 30),
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              title: Text('Edit Function'),
                              content: Text(
                                  'Edit Function is not available at the moment.' +
                                      '\n' +
                                      'Please contact your doctor for any changes.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // Navigate to the queue list view or any other page
                                    Navigator.pop(context);
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
                        'Edit',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MontlyOverview(),
                          ),
                        );
                        //             );
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: Text('Booking Successful'),
                        //       content: Text(
                        //           'Your appointment has been successfully booked.'),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           onPressed: () {
                        //             // Navigate to the queue list view or any other page
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => NavBar()),
                        //             );
                        //           },
                        //           child: Text('OK'),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // );
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
                        'View My Monthly Report',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: Offset(0, 3), // Offset of the shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: TableCalendar(
                    // firstDay: kFirstDay,
                    // lastDay: kLastDay,

                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      // Use `selectedDayPredicate` to determine which day is currently selected.
                      // If this returns true, then `day` will be marked as selected.

                      // Using `isSameDay` is recommended to disregard
                      // the time-part of compared DateTime objects.
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        // Call `setState()` when updating the selected day
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                        firstTimeEnterPage();
                        loadEventDataAdjust(true);
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                        firstTimeEnterPage();
                        loadEventDataAdjust(true);
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                      loadEventDataAdjust(true);
                      firstTimeEnterPage();
                    },
                  ),
                ),
                // Text(
                //   // '$_focusedDay' + ' ' + '$_selectedDay',
                //   '$_focusedDay',
                //   style: TextStyle(
                //     fontSize: 20,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                // connect to firestore to get data
                // StreamBuilder<QuerySnapshot>(
                //   stream: firestoreService.getEventsStream(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       debugPrint("snapshot has data");
                //       debugPrint("hereeee");
                //       List eventList = snapshot.data!.docs;

                //       // display the event
                //       return ListView.builder(
                //           itemCount: eventList.length,
                //           itemBuilder: (context, index) {
                //             // get each individual document
                //             DocumentSnapshot document = eventList[index];
                //             String docID = document.id;

                //             // get detail from each document
                //             Map<String, dynamic> data = document.data() as Map<
                //                 String,
                //                 dynamic>; // get the data from the document
                //             String eventType = data['name'];

                //             // display as a list tile
                //             return ListTile(
                //               title: Text(eventType),
                //             );
                //           });
                //     }

                //     // if there is no data return nothing
                //     else {
                //       debugPrint("snapshot no data");
                //       return const Text('No data');
                //     }
                //   },
                // ),

                // if (!calendarLoaded)
                //   CircularProgressIndicator(), // Show a loading indicator if data is being loaded

                // load normaally ----------------------------------
                // if (calendarLoaded)
                //   FutureBuilder(
                //     future: getDocId(),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.done) {
                //         return ListView.builder(
                //           shrinkWrap: true,
                //           physics: NeverScrollableScrollPhysics(),
                //           itemCount: docIDs.length,
                //           itemBuilder: (context, index) {
                //             return ListTile(
                //               title: GetEventDetail(documentId: docIDs[index]),
                //             );
                //           },
                //         );
                //       } else if (snapshot.hasError) {
                //         // Handle the error case
                //         return Text('Error: ${snapshot.error}');
                //       } else {
                //         // Handle other loading states, e.g., ConnectionState.waiting
                //         return CircularProgressIndicator();
                //       }
                //     },
                //   ),

                // this one is working
                // FutureBuilder(
                //     future: getDocId(),
                //     builder: (context, snapshot) {
                //       return ListView.builder(
                //         shrinkWrap:
                //             true, // This allows the inner ListView to take the necessary height.
                //         physics:
                //             NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView.
                //         itemCount: docIDs.length,
                //         // debugPrint('eventList.length: ${eventList.length}'),
                //         itemBuilder: (context, index) {
                //           return ListTile(
                //             title: GetEventDetail(
                //               documentId: docIDs[index],
                //             ),
                //             // title: Text(docIDs[index]),
                //             // title: Text('hello'),
                //           );
                //         },
                //       );
                //     }),

                // Expanded(child: FutureBuilder(
                //   builder: (context, snapshot) {
                //     return ListView.builder(
                //       itemCount: 3,
                //       itemBuilder: (context, index) {
                //         return ListTile(
                //           title: Text(docIDs[index]),
                //         );
                //       },
                //     );
                //   },
                // )),

                // original --------------------------------
                // Use ListView.builder to generate EventCard widgets dynamically
                // ListView.builder(
                //   shrinkWrap:
                //       true, // This allows the inner ListView to take the necessary height.
                //   physics:
                //       NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView.
                //   itemCount: eventList.length,
                //   // debugPrint('eventList.length: ${eventList.length}'),
                //   itemBuilder: (context, index) {
                //     return MyTimelineTile(
                //       isFirst: index == 0, // true if index == 0
                //       isLast: index ==
                //           eventList.length - 1, // true if index == last index
                //       isPast: eventList[index][2],
                //       eventCard: eventList[index][0],
                //       isDone: eventList[index][1],
                //       onChanged: (value) => checkBoxTapped(value, index),
                //     );
                //   },
                // ),

                //   child: MyTimelineTile(
                //     isFirst: true,
                //     isLast: false,
                //     isPast: true,
                //     eventCard: "Daily Checkup",
                //     isDone: eventCompleted,
                //     onChanged: (value) => checkBoxTapped(value),
                //   ),
                // ),
                // // midle tile
                // MyTimelineTile(
                //   isFirst: false,
                //   isLast: false,
                //   isPast: true,
                //   eventCard: "Paracetamol 500mg",
                //   isDone: eventCompleted,
                //   onChanged: (value) => checkBoxTapped(value),
                // ),
                // // last tile
                // MyTimelineTile(
                //   isFirst: false,
                //   isLast: true,
                //   isPast: false,
                //   eventCard: "Daily exercise",
                //   isDone: eventCompleted,
                //   onChanged: (value) => checkBoxTapped(value),
                // ),

                // if (calendarLoaded)
                Column(
                  children: [
                    FutureBuilder(
                      future: getDocId(_focusedDay, firstEnter),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: docIDs.length,
                            // itemCount: 2,
                            itemBuilder: (context, index) {
                              return MyTimelineTile(
                                documentId: docIDs[index],
                                isFirst: index == 0,
                                isLast: index == docIDs.length - 1,
                                // isPast: eventList[index][2],
                                // eventCard: eventList[index][0],
                                // isDone: eventList[index][1],
                                onChanged: (value) =>
                                    checkBoxTapped(value, index),
                              );
                              // return ListTile(
                              //   title:
                              //       GetEventDetail(documentId: docIDs[index]),
                              // );
                              // return MyTimelineTile(
                              //   isFirst: index == 0,
                              //   isLast: index == eventDataList.length - 1,
                              //   isPast: eventDataList[index]['isPast'],
                              //   eventCard: eventDataList[index]['eventCard'],
                              //   isDone: eventDataList[index]['isDone'],
                              //   onChanged: (value) =>
                              //       checkBoxTapped(value, index),
                              // );
                              // return ListTile(
                              //   // title: Text(eventDataList.length.toString()),
                              //   title: Text(eventDataList[0].toString()),
                              // );
                              // return ListView.builder(
                              //   shrinkWrap: true,
                              //   physics: NeverScrollableScrollPhysics(),
                              //   itemCount: docIDs.length,
                              //   itemBuilder: (context, index) {
                              //     return ListTile(
                              //       // title: Text(eventDataList.length.toString()),
                              //       title: GetEventDetail(
                              //           documentId: docIDs[index]),
                              //     );
                              //     // return MyTimelineTile(
                              //     //   documentId: docIDs[index],
                              //     //   isFirst: index == 0,
                              //     //   isLast: index == docIDs.length - 1,
                              //     //   isPast: eventList[index][2],
                              //     //   eventCard: eventList[index][0],
                              //     //   isDone: eventList[index][1],
                              //     //   onChanged: (value) =>
                              //     //       checkBoxTapped(value, index),
                              //     // );
                              //   },
                              // );
                            },
                          );
                        } else if (snapshot.hasError) {
                          // Handle the error case
                          return Text('Error: ${snapshot.error}');
                        } else {
                          // Handle other loading states, e.g., ConnectionState.waiting
                          // return CircularProgressIndicator();
                          // return Placeholder();
                          // return Text('loading');
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(height: 20), // Add some spacing
                                Text(
                                  "Refreshing...",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          );
                          // return Center(
                          //   child: CircularProgressIndicator(),
                          // );
                          // return Scaffold(
                          //   body: Container(
                          //     decoration: BoxDecoration(
                          //       gradient: LinearGradient(
                          //         begin: Alignment.topCenter,
                          //         end: Alignment.bottomCenter,
                          //         colors: [Colors.blue, Colors.lightBlue],
                          //       ),
                          //     ),
                          //     child: Center(
                          //       child: Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           CircularProgressIndicator(
                          //             valueColor: AlwaysStoppedAnimation(
                          //                 Colors.white),
                          //           ),
                          //           SizedBox(height: 20), // Add some spacing
                          //           Text(
                          //             "Loading...",
                          //             style: TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 18,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );

                          // return ListView.builder(
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemCount: docIDs.length,
                          //   itemBuilder: (context, index) {
                          //     return MyTimelineTile(
                          //       documentId: docIDs[index],
                          //       isFirst: index == 0,
                          //       isLast: index == docIDs.length - 1,
                          //       isPast: eventList[index][2],
                          //       // eventCard: eventList[index][0],
                          //       // isDone: eventList[index][1],
                          //       onChanged: (value) =>
                          //           checkBoxTapped(value, index),
                          //     );
                          //   },
                          // );
                        }
                      },
                    ),
                    // ListView.builder(
                    //   shrinkWrap: true,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   itemCount: docIDs.length,
                    //   itemBuilder: (context, index) {
                    //     return MyTimelineTile(
                    //       documentId: docIDs[index],
                    //       isFirst: index == 0,
                    //       isLast: index == eventList.length - 1,
                    //       isPast: eventList[index][2],
                    //       eventCard: eventList[index][0],
                    //       isDone: eventList[index][1],
                    //       onChanged: (value) => checkBoxTapped(value, index),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
