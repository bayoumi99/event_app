import 'package:cloud_firestore/cloud_firestore.dart';

class EventDm{
  String title;
  String description;
  String id;
  int categoryId;
  int date;
  int time;

  EventDm(this.title,
      this.description,
      this.id,
      this.categoryId,
      this.date,
      this.time);

  factory EventDm.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return EventDm(
        data?["title"],
        data?["description"],
        data?["id"],
        data?["categoryId"],
        data?["date"],
        data?["time"]
    );
}

  Map<String, dynamic> toFirestore() {
    return {
      "title" : title,
      "description" : description,
      "id" : id,
      "categoryId" : categoryId,
      "date" : date,
      "time" : time,
    };
  }
}
