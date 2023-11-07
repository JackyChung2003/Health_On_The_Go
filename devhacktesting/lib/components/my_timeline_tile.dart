import 'package:devhacktesting/components/event_card.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  final bool isDone;
  final Function(bool?)? onChanged;

  const MyTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
    required this.isDone,
    required this.onChanged,
  });

  Color getTileColor(bool isPast, bool isDone) {
    if (isPast && isDone) {
      return Colors.deepPurple;
    } else if (isPast && !isDone) {
      return Colors.red.shade200;
    } else if (isDone && !isPast) {
      return Colors.green.shade200;
    } else {
      return Colors.deepPurple.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // control the gap between the event
      height: 150,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        // isPast: isPast,

        // decorate the lines
        beforeLineStyle: LineStyle(color: getTileColor(isPast, isDone)),
        // color: isPast ? Colors.deepPurple : Colors.deepPurple.shade200),

        // decorate the circle
        indicatorStyle: IndicatorStyle(
          width: 40,
          height: 40,
          color: getTileColor(isPast, isDone),
          // isPast ? Colors.deepPurple : Colors.deepPurple.shade200,
          iconStyle: IconStyle(
              // iconData: Icons.done,
              iconData: isDone ? Icons.done : Icons.close,
              color: isPast ? Colors.white : Colors.deepPurple.shade200),

          // draw the indicator
          // indicator: Container(
          //   decoration: BoxDecoration(
          //     color: Colors.deepPurple,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: Center(
          //     child: Text(
          //       '1',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //       ),
          //     ),
          //   ),
          // ),
        ),

        // event card
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,
          isDone: isDone,
          onChanged: onChanged,
          // onChanged: (value) => checkBoxTapped(value),
        ),
      ),
    );
  }
}
