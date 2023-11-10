import 'package:flutter/material.dart';

class FrequencyDropdownWidget extends StatefulWidget {
  // final void Function(String) updateTextField;
  final void Function(String)
      onChanged; // Callback for when the dropdown value changes
  final String selectedFrequencyType;

  // const EventDropdownWidget({
  //   super.key,
  //   required this.onChanged,
  //   required this.selectedEventType,
  // });

  FrequencyDropdownWidget({
    Key? key,
    required this.onChanged,
    required this.selectedFrequencyType,
  }) : super(key: key);

  @override
  State<FrequencyDropdownWidget> createState() =>
      _FrequencyDropdownWidgetState();
}

class _FrequencyDropdownWidgetState extends State<FrequencyDropdownWidget> {
  // for user to add event
  var eventOptions = ['Daily', 'Weekly', 'Montly', 'Yearly'];

  // String _currentEventOptionsSelected = '';
  // var _currentEventOptionsSelected = eventOptions[0];
  var _currentEventOptionsSelected = "Daily";
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
