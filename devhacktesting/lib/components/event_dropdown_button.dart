import 'package:flutter/material.dart';

class EventDropdownWidget extends StatefulWidget {
  // final void Function(String) updateTextField;
  final void Function(String)
      onChanged; // Callback for when the dropdown value changes
  final String selectedEventType;

  // const EventDropdownWidget({
  //   super.key,
  //   required this.onChanged,
  //   required this.selectedEventType,
  // });

  EventDropdownWidget({
    Key? key,
    required this.onChanged,
    required this.selectedEventType,
  }) : super(key: key);

  @override
  State<EventDropdownWidget> createState() => _EventDropdownWidgetState();
}

class _EventDropdownWidgetState extends State<EventDropdownWidget> {
  // for user to add event
  var eventOptions = [
    'Medicine Reminder',
    'Exercise',
    'Diet Plan',
    'Lifestyle Modification',
    'Others'
  ];

  // String _currentEventOptionsSelected = '';
  // var _currentEventOptionsSelected = eventOptions[0];
  var _currentEventOptionsSelected = "Medicine Reminder";
  // var event = "Medicine Reminder";

  // @override
  // void initState() {
  //   super.initState();
  //   _currentEventOptionsSelected = widget.eventOptions[0];
  // }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Colors.blue[900],
      isDense: true,
      isExpanded: false,
      iconEnabledColor: Colors.black,
      focusColor: Colors.blue,
      items: eventOptions.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(
            dropDownStringItem,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        );
      }).toList(),
      onChanged: (newValueSelected) {
        setState(() {
          _currentEventOptionsSelected = newValueSelected!;
          // event = newValueSelected;
          widget.onChanged(
              newValueSelected); // Call the callback to update the selectedEventType
        });
      },
      value: _currentEventOptionsSelected,
    );
  }
}
