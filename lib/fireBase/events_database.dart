import 'package:cloud_firestore/cloud_firestore.dart';
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


















  }