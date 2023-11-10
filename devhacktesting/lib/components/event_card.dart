import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatelessWidget {
  final String documentId;
  // final bool isPast;
  // final child;
  // final List<String> child;
  // final Widget child; // Change eventCard's type to Widget
  final bool isDone;
  final Function(bool?)? onChanged;

  const EventCard({
    super.key,
    required this.documentId,
    // required this.isPast,
    // required this.child,
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
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       // child.toString(),
            //       // '${data['event_type']}' + ' ' + '${data['name']}',
            //       '${data['event_name']}',
            //       style: TextStyle(
            //           decoration: isDone ? TextDecoration.lineThrough : null),
            //     ),
            //     Checkbox(
            //       value: isDone,
            //       onChanged: onChanged,
            //     ),
            //   ],
            // ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${data['event_name']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                decoration:
                                    isDone ? TextDecoration.lineThrough : null,
                              ),
                            ),
                            Text(
                              '${data['event_type']}',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${data['event_type']}',
                            style: TextStyle(
                              fontSize: 10,
                              decoration:
                                  isDone ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                ),
              ],
            ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             '${data['event_type']}',
            //             style: TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 10,
            //             ),
            //           ),
            //           // Text(
            //           //   '${data['event_type']}',
            //           //   style: TextStyle(
            //           //     fontWeight: FontWeight.bold,
            //           //     fontSize: 10,
            //           //     decoration: isDone ? TextDecoration.lineThrough : null,
            //           //   ),
            //           // ),
            //           // Text(
            //           //   'Event Name:',
            //           //   style: TextStyle(
            //           //     fontWeight: FontWeight.bold,
            //           //   ),
            //           // ),
            //           Text(
            //             '${data['event_name']}',
            //             style: TextStyle(
            //               fontSize: 16,
            //               decoration:
            //                   isDone ? TextDecoration.lineThrough : null,
            //             ),
            //           ),
            //           Text(
            //             '${data['event_type']}' +
            //                 ' ' +
            //                 '${data['event_name']}' +
            //                 '${data['event_type']}',
            //             style: TextStyle(
            //               fontSize: 10,
            //               decoration:
            //                   isDone ? TextDecoration.lineThrough : null,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     Checkbox(
            //       value: isDone,
            //       onChanged: onChanged,
            //     ),
            //   ],
            // ),
          );
        }
        // return Text('loading');
        return Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 200, // Adjust the width based on your design
                      height: 20, // Adjust the height based on your design
                      color: Colors.white,
                    ),
                  ),
                  Checkbox(
                    value:
                        false, // You can set a default value or leave it false
                    onChanged: (bool? value) {},
                  ),
                ],
              ),
            ));
        // return Container(
        //   margin: const EdgeInsets.all(25),
        //   padding: const EdgeInsets.all(25),
        //   decoration: BoxDecoration(
        //     color: Colors.yellow.shade200,
        //     borderRadius: BorderRadius.circular(20),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.5), // Shadow color
        //         spreadRadius: 2, // Spread radius
        //         blurRadius: 7, // Blur radius
        //         offset: Offset(0, 3), // Offset of the shadow
        //       ),
        //     ],
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         // child.toString(),
        //         // '${data['event_type']}' + ' ' + '${data['name']}',
        //         'loading',
        //         style: TextStyle(
        //             decoration: isDone ? TextDecoration.lineThrough : null),
        //       ),
        //       Checkbox(
        //         value: isDone,
        //         onChanged: onChanged,
        //       ),
        //     ],
        //   ),
        // );
      }),
    );
  }
}
