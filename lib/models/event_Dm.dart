import 'package:cloud_firestore/cloud_firestore.dart';
import 'Category_Dm.dart';

 class EventDm{
  final String title;
  final String description;
  String id;
  final CategoryDm category;
  final int date;
  final int time;
  final List<String> favoriteUser;

  EventDm( {
    required this.title,
    required this.description,
    required this.id,
    required this.category,
    required this.date,
    required this.time,
    this.favoriteUser = const[],}
      );

  factory EventDm.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return EventDm(
        title: data?["title"],
        description: data?["description"],
         id:  data?["id"],
        category: categoriesList.firstWhere((e)=>e.id==data?["categoryId"],),
        date: data?["date"],
        time:  data?["time"],
         favoriteUser:  (data?["favoriteUser"]as List<dynamic>).map((e)=>e.toString()).toList()??[],
    );
}

  Map<String, dynamic> toFirestore() {
    return {
      "title" : title,
      "description" : description,
      "id" : id,
      "categoryId" : category.id,
      "date" : date,
      "time" : time,
      "favoriteUser" : favoriteUser,
    };
  }
}
