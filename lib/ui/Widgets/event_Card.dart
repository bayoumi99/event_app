import 'package:event_app/fireBase/events_database.dart';
import 'package:event_app/fireBase/fireBase_auth_servces.dart';
import 'package:event_app/models/event_Dm.dart';
import 'package:flutter/material.dart';


class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event});
final EventDm event;


  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 361/203 ,
      child: Container(
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(EventDm.category.imagePath)),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color:Theme.of(context).colorScheme.primary, width: 2),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Container(
  padding: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: BorderRadius.circular(16),
  ),
    child: Text(EventDm.date.formattedDate,textAlign: TextAlign.center,)
    ) ,           Spacer(),
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(EventDm.title)),
                  InkWell(
                    onTap: ()async{
                        var dataBase = EventsDatabase();
                        var auth = FirebaseAuthServces();
                        await  dataBase.updateEventLike(auth.getUserData()!.uid, EventDm as EventDm);
                      setState(() {

                      });
                    },
                    child: Icon(EventDm.favoriteUser.contains(FirebaseAuthServces().getUserData()?.uid)?
                    Icons.favorite:Icons.favorite_border,
                      color: Theme.of(context).primaryColor,),
                  )
                ],
              ),

            )

          ],
        ),
      ),
    );
  }
}
