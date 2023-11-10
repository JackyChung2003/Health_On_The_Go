import 'package:flutter/material.dart';

class RepeatEventButton extends StatefulWidget {
  // final void Function(String) updateTextField;
  final bool tick;
  final Function(bool?)?
      onChanged; // Callback for when the dropdown value changes
  // final bool repeatedEvent;

  RepeatEventButton({
    Key? key,
    required this.tick,
    required this.onChanged,
    // required this.repeatedEvent,
  }) : super(key: key);

  // RepeatEventButton({
  //   super.key,
  //   // required this.isPast,
  //   // required this.child,
  //   required this.tick,
  //   required this.onChanged,
  // });

  @override
  State<RepeatEventButton> createState() => _RepeatEventButtonState();
}

class _RepeatEventButtonState extends State<RepeatEventButton> {
  // for user to add event

  // String _currentEventOptionsSelected = '';
  // var _currentEventOptionsSelected = eventOptions[0];
  // var _currentEventOptionsSelected = "Medicine Reminder";
  bool _currentRepeatTick = false;
  // bool isRepeatEvent = false; // Set an initial value
  // var event = "Medicine Reminder";

  // @override
  // void initState() {
  //   super.initState();
  //   _currentEventOptionsSelected = widget.eventOptions[0];
  // }

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (newBoolSelected) {
        setState(() {
          _currentRepeatTick = newBoolSelected!;
          widget.onChanged!(newBoolSelected);
        });
      },

      value: _currentRepeatTick,
      // onChanged: (value) {
      //   // Handle the switch state change.
      //   setState(() {
      //     isRepeatEvent = value;
      //   });
      // },
    );
  }
}


// ListTile(
//                 title: Text("Repeat Event"),
//                 trailing: Switch(
//                   value: isRepeatEvent, // Set this based on your logic.
//                   onChanged: (value) {
//                     // Handle the switch state change.
//                     setState(() {
//                       isRepeatEvent = value;
//                     });
//                   },
                  
//                 ),
//               ),