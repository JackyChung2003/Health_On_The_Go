// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class GetEventDetail extends StatelessWidget {
//   // const GetEventName({super.key});

//   final String documentId;

//   GetEventDetail({required this.documentId});

//   @override
//   Widget build(BuildContext context) {
//     // get the collection
//     CollectionReference events =
//         FirebaseFirestore.instance.collection('events');
//     return FutureBuilder<DocumentSnapshot>(
//       future: events.doc(documentId).get(),
//       builder: ((builder, snapshot) {
//         // determine if the data is load or not
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           return Text('${data['event_type']}' + ' ' + '${data['name']}');
//         }
//         return Text('loading');
//       }),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   final events = FirebaseFirestore.instance.collection('events');

//   //   return FutureBuilder<DocumentSnapshot>(
//   //     future: events.doc(documentId).get(),
//   //     builder: (context, snapshot) {
//   //       if (snapshot.connectionState == ConnectionState.done) {
//   //         Map<String, dynamic> data =
//   //             snapshot.data!.data() as Map<String, dynamic>;

//   //         // Create a widget to display the event details
//   //         Widget eventDetailsWidget = Column(
//   //           children: [
//   //             Text('${data['event_type']} ${data['name']}'),
//   //           ],
//   //         );

//   //         return eventDetailsWidget;
//   //       }
//   //       return Text('Loading');
//   //     },
//   //   );
//   // }
// }
// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class GetEventDetail {
// //   final String documentId;

// //   GetEventDetail({required this.documentId});

// //   Future<Map<String, dynamic>?> fetchEventData() async {
// //     CollectionReference events =
// //         FirebaseFirestore.instance.collection('events');
// //     final documentSnapshot = await events.doc(documentId).get();

// //     if (documentSnapshot.exists) {
// //       final data = documentSnapshot.data() as Map<String, dynamic>;
// //       return data;
// //     } else {
// //       return null;
// //     }
// //   }
// // }
