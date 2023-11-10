import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  User? user = FirebaseAuth.instance.currentUser;

  /// Gets the firebase uid.
  String getUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  // get collection of event
  // final CollectionReference events = FirebaseFirestore.instance
  //     .collection('users');

  // final CollectionReference events = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(getUid())
  //     .collection('events');

  // Create
  // Future<void> createEvent(String event_type, String name, bool repeat,
  //     String frequency, String start_date, String end_date, String time) {
  //   final CollectionReference events = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(getUid())
  //       .collection('events');

  //   return events.add({
  //     'event_type': event_type,
  //     'name': name,
  //     'repeat': repeat,
  //     'frequency': frequency,
  //     'start_date': start_date,
  //     'end_date': end_date,
  //     'time': time,
  //     'timestamp': Timestamp.now(),
  //     'checked': false,
  //   });
  //   // .then((value) => print('Event Added'))
  //   // .catchError((error) => print('Failed to add event: $error'));
  // }

  createEvent(
    String event_type,
    String name,
    String frequency,
    DateTime dateTime,
    // DateTime dateOfEvent,
    String dateOfEvent,
    // Timestamp dateOnlyTimestamp,
  ) {
    final CollectionReference events = FirebaseFirestore.instance
        .collection('users')
        .doc(getUid())
        .collection('events');

    return events.add({
      'event_type': event_type,
      'event_name': name,
      'frequency': frequency,
      'event_date_time': dateTime,
      'timestamp': Timestamp.now(),
      'date_category': dateOfEvent,
      // 'date_category': dateOnlyTimestamp,
      'checked': false,
      'status': 'active',
    });
    // .then((value) => print('Event Added'))
    // .catchError((error) => print('Failed to add event: $error'));
  }

  // Read (not in use)
  // Stream<QuerySnapshot> getEventsStream() {
  //   final eventsStream = events
  //       .orderBy('timestamp', descending: true)
  //       .snapshots(); // for now just order by timestamp
  //   // final eventsStream = events.orderBy('time', descending: true).snapshots();   // to display the latest event first(but got bug)

  //   eventsStream.listen((event) {
  //     print('Received data: $event');
  //   }, onError: (error) {
  //     print('Error: $error');
  //   });

  //   return eventsStream;
  // }

  // Update: update event given the document id
  Future<void> updateEvent(String docID, bool checked) {
    final CollectionReference events = FirebaseFirestore.instance
        .collection('users')
        .doc(getUid())
        .collection('events');
    return events.doc(docID).update({
      'checked': checked,
      'timestamp': Timestamp.now(),
    });
  }

  // Delete
}
