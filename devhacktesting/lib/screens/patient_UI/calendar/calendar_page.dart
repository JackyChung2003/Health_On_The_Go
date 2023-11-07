import 'package:devhacktesting/components/event_dropdown_button.dart';
import 'package:devhacktesting/components/my_timeline_tile.dart';
import 'package:devhacktesting/screens/services/firestore.dart';
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
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  bool eventCompleted = false;

  // text controller for adding event
  final TextEditingController eventTextController = TextEditingController();
  final TextEditingController eventOccurrenceController =
      TextEditingController();
  final TextEditingController eventFrequencyController =
      TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController eventTimeController = TextEditingController();

  // TextEditingController eventTextController =
  //     TextEditingController(text: _currentEventOptionsSelected);

  // list of event
  // eventList[index][0] == event name
  // eventList[index][1] == event completed or not
  // eventList[index][2] == event passed or not
  List eventList = [
    ['Daily Checkup', true, true],
    ['Paracetamol 500mg', true, true],
    ['Daily exercise', false, false],
    ['Virtual Consultation', false, false],
  ];

  // for user to add event
  // var eventOptions = [
  //   'Medicine Reminder',
  //   'Exercise',
  //   'Diet Plan',
  //   'Lifestyle Modification',
  //   'Others'
  // ];
  var _currentEventOptionsSelected = "Medicine Reminder";
  var event = "Medicine Reminder";

//
  // method for checkbox to be tap
  void checkBoxTapped(bool? value, int index) {
    // debugPrint('checkbox tapped  value: $value');
    setState(() {
      // eventCompleted = value!;
      eventList[index][1] = !eventList[index][1];
    });
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

  // method to open dialog box for adding event
  void openAddEventBox() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          constraints: BoxConstraints(
            maxHeight: 350,
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
                  )),
              TextField(
                  controller: eventOccurrenceController,
                  decoration: InputDecoration(
                    hintText:
                        "Event Occurrence(button to on or off to indicate repeat event or not)",
                  )),
              TextField(
                  controller: eventFrequencyController,
                  decoration: InputDecoration(
                    hintText: "Frequency （future should be button)",
                  )),
              TextField(
                  controller: startDateController,
                  decoration: InputDecoration(
                    hintText: "Start Date(should be date picker)",
                  )),
              TextField(
                  controller: endDateController,
                  decoration: InputDecoration(
                    hintText: "End Date(should be date picker)",
                  )),
              TextField(
                  controller: eventTimeController,
                  decoration: InputDecoration(
                    hintText: "Time(should be time picker)",
                  )),
            ],
          ),
        ),
        actions: [
          // button to save
          ElevatedButton(
              onPressed: () {
                // add the event to the list
                firestoreService.createEvent(
                    event,
                    eventTextController.text,
                    eventFrequencyController.text,
                    startDateController.text,
                    endDateController.text,
                    eventTimeController.text);

                // clear the text controller
                eventTextController.clear();

                // close the dialog box
                Navigator.pop(context);
              },
              child: Text("Add"))
        ],
      ),
    );
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
                      }
                    },
                    onFormatChanged: (format) {
                      if (_calendarFormat != format) {
                        // Call `setState()` when updating calendar format
                        setState(() {
                          _calendarFormat = format;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      // No need to call `setState()` here
                      _focusedDay = focusedDay;
                    },
                  ),
                ),

                // Use ListView.builder to generate EventCard widgets dynamically
                ListView.builder(
                  shrinkWrap:
                      true, // This allows the inner ListView to take the necessary height.
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView.
                  itemCount: eventList.length,
                  // debugPrint('eventList.length: ${eventList.length}'),
                  itemBuilder: (context, index) {
                    return MyTimelineTile(
                      isFirst: index == 0, // true if index == 0
                      isLast: index ==
                          eventList.length - 1, // true if index == last index
                      isPast: eventList[index][2],
                      eventCard: eventList[index][0],
                      isDone: eventList[index][1],
                      onChanged: (value) => checkBoxTapped(value, index),
                    );
                  },
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
