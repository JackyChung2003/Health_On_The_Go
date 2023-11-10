import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devhacktesting/components/event_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final String documentId;
  final bool isFirst;
  final bool isLast;
  // final bool isPast;
  // final eventCard;
  // final List<String> eventCard;
  // final Widget eventCard; // Change eventCard's type to Widget
  // final bool isDone;
  final Function(bool?)? onChanged;

  const MyTimelineTile({
    super.key,
    required this.documentId,
    required this.isFirst,
    required this.isLast,
    // required this.isPast,
    // required this.eventCard,
    // required this.isDone,
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

  String getUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference events = FirebaseFirestore.instance
        .collection('users')
        .doc(getUid())
        .collection('events');
    return FutureBuilder<DocumentSnapshot>(
      future: events.doc(documentId).get(),
      builder: ((builder, snapshot) {
        // determine if the data is load or not
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          Timestamp endDate = data['timestamp'];

          bool isPast = endDate.toDate().isBefore(DateTime.now());

          // return Text('${data['event_type']}' + ' ' + '${data['name']}');
          bool isDone = data['checked'];
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
                documentId: documentId,
                // isPast: isPast,
                // child: eventCard,
                isDone: isDone,
                onChanged: onChanged,
                // onChanged: (value) => checkBoxTapped(value),
              ),
            ),
          );
        }
        // return Text('loading');
        return Container();
        // return SizedBox(
        //   height: 150,
        //   child: TimelineTile(
        //     isFirst: isFirst,
        //     isLast: isLast,
        //     // isPast: isPast,

        //     // decorate the lines
        //     beforeLineStyle: LineStyle(color: Colors.deepPurple.shade200),
        //     // color: isPast ? Colors.deepPurple : Colors.deepPurple.shade200),

        //     // decorate the circle
        //     indicatorStyle: IndicatorStyle(
        //       width: 40,
        //       height: 40,
        //       color: Colors.deepPurple.shade200,
        //       // isPast ? Colors.deepPurple : Colors.deepPurple.shade200,
        //       iconStyle: IconStyle(
        //           // iconData: Icons.done,
        //           iconData: Icons.close,
        //           color: Colors.deepPurple.shade200),
        //     ),

        //     // event card
        //     endChild: EventCard(
        //       documentId: documentId,
        //       // isPast: isPast,
        //       // child: eventCard,
        //       isDone: false,
        //       onChanged: onChanged,
        //       // onChanged: (value) => checkBoxTapped(value),
        //     ),
        //   ),
        // );
      }),
    );
  }
}
