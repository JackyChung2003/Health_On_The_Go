import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final bool isPast;
  final child;
  final bool isDone;
  final Function(bool?)? onChanged;

  const EventCard({
    super.key,
    required this.isPast,
    required this.child,
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
    return Container(
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        // color: isPast ? Colors.deepPurple : Colors.deepPurple.shade200,
        color: getTileColor(isPast, isDone),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 3), // Offset of the shadow
          ),
        ],
      ),
      // child: child,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            child.toString(),
            style: TextStyle(
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          Checkbox(
            value: isDone,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
