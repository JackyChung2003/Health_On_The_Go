import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of event
  final CollectionReference events =
      FirebaseFirestore.instance.collection('events');

  // Create
  Future<void> createEvent(String event_type, String name, String start_date,
      String end_date, String time) {
    return events.add({
      'event_type': event_type,
      'name': name,
      'start_date': start_date,
      'end_date': end_date,
      'time': time,
      'timestamp': Timestamp.now()
    });
    // .then((value) => print('Event Added'))
    // .catchError((error) => print('Failed to add event: $error'));
  }

  // Read
  Stream<QuerySnapshot> getEvents() {
    final eventsStream = events
        .orderBy('timestamp', descending: true)
        .snapshots(); // for now just order by timestamp
    // final eventsStream = events.orderBy('time', descending: true).snapshots();   // to display the latest event first(but got bug)

    return eventsStream;
  }

  // Update

  // Delete
}
