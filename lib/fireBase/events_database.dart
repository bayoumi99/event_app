import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/date_extantion.dart';
import 'package:event_app/models/Category_Dm.dart';
import 'package:event_app/models/event_Dm.dart';

class EventsDatabase{
FirebaseFirestore FireStore = FirebaseFirestore.instance;

CollectionReference<EventDm> getCollectionReference(){
    return FireStore.collection("Events").withConverter(
        fromFirestore: EventDm.fromFirestore,
        toFirestore: (EventDm event, options) => event.toFirestore(),

  );

}
Future<void> createEvent(EventDm event) async{
  var collection = getCollectionReference();
  var doc = await collection.add(event);
  event.id = doc.id;
  await doc.set(event);
}
Future<List<EventDm>>getEventsList(CategoryDm category) async {
  var collection = getCollectionReference();
  var date =DateTime.now().dateOnly.microsecondsSinceEpoch;
  QuerySnapshot<EventDm> Data ;
  if(category.id == -1){
    Data = await collection.where("date",isGreaterThan: date).get();
  }else{
    Data = await collection
        .where("category",isEqualTo: category.id)
        .where("date",isGreaterThan: date)
        .get();
  }
  var Event =Data.docs.map((element) => element.data()).toList();
  return Event;


}

Stream<QuerySnapshot<EventDm>>getEventsListStream(CategoryDm category)  {
  var collection = getCollectionReference();
  var date =DateTime.now().dateOnly.microsecondsSinceEpoch;
Stream<QuerySnapshot<EventDm>> Data ;
  if(category.id == -1){
      Data =  collection.where("date",isGreaterThan: date).snapshots();
  }else{
    Data =  collection
        .where("category",isEqualTo: category.id)
         .where("date",isGreaterThan: date)
        .snapshots();
  }
  return Data;


}
Future<void> updateEventLike (String userId,EventDm event) async {
  if (event.favoriteUser.contains(userId)) {
    event.favoriteUser.remove(userId);
  } else {
    event.favoriteUser.add(userId);
  }
  var collection = getCollectionReference();
  var doc = collection.doc(event.id);
  await doc.update(event.toFirestore());
}



Stream<QuerySnapshot<EventDm>>getFavroiteStream(String uId)  {
  var collection = getCollectionReference();
  Stream<QuerySnapshot<EventDm>> Data = collection
      .where("favoriteUser",arrayContains: uId)
      .snapshots();
return Data;
}


}




















  