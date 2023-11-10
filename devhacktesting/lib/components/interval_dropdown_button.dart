import 'package:flutter/material.dart';

class IntervalDropdownWidget extends StatefulWidget {
  // final void Function(String) updateTextField;
  final void Function(String)
      onChanged; // Callback for when the dropdown value changes
  final String selectedIntervalType;

  // const EventDropdownWidget({
  //   super.key,
  //   required this.onChanged,
  //   required this.selectedEventType,
  // });

  IntervalDropdownWidget({
    Key? key,
    required this.onChanged,
    required this.selectedIntervalType,
  }) : super(key: key);

  @override
  State<IntervalDropdownWidget> createState() => _IntervalDropdownWidgetState();
}

class _IntervalDropdownWidgetState extends State<IntervalDropdownWidget> {
  // for user to add event
  // var eventOptions = [
  //   'Once a day',
  //   '2 times a day',
  //   '3 times a day',
  //   '4 times a day',
  //   '5 times a day',
  //   'Every 3 hours',
  //   'Every 4 hours',
  //   'Every 6 hours',
  //   'Every 8 hours',
  //   'Every 12 hours',
  //   'Every 24 hours',
  //   'Bedtime',
  //   'With meals',
  //   'meals & bedtime',
  // ];

  var eventOptions = [
    'Once a day',
    '2 times a day',
    '3 times a day',
    '4 times a day',
    '5 times a day',
  ];

  // String _currentEventOptionsSelected = '';
  // var _currentEventOptionsSelected = eventOptions[0];
  var _currentIntervalOptionsSelected = "Once a day";
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
            textAlign: TextAlign.end, // Set the text alignment to right
          ),
        );
      }).toList(),
      onChanged: (newValueSelected) {
        setState(() {
          _currentIntervalOptionsSelected = newValueSelected!;
          // event = newValueSelected;
          widget.onChanged(
              newValueSelected); // Call the callback to update the selectedEventType
        });
      },
      value: _currentIntervalOptionsSelected,
    );
  }
}
