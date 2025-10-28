import 'package:event_app/fireBase/events_database.dart';
import 'package:event_app/fireBase/fireBase_auth_servces.dart';
import 'package:event_app/models/Category_Dm.dart';
import 'package:flutter/material.dart';

import '../../Widgets/event_Card.dart';

class FavoriteTab extends StatelessWidget {
   FavoriteTab({super.key});
EventsDatabase database = EventsDatabase();
FirebaseAuthServces auth = FirebaseAuthServces();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search Favorite',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),


            )

          ),
        ),
        StreamBuilder(
            stream: database.getEventsListStream( (auth.getUserData()?.uid??"") as CategoryDm),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(child: Column(
                  children: [
                    CircularProgressIndicator(),
                  ],
                )
                );
              }else if(snapshot.hasError) {
                return Expanded(child: Center(
                  child: Text("Error${snapshot.error}"),
                )
                );
              }else if(snapshot.hasData) {
                var events = snapshot.data?.docs.map((e) => e.data()).toList()??[];
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_,__)=> SizedBox(height: 16,),
                    padding: EdgeInsets.all(16),
                    itemBuilder:(_,index)=> EventCard(
                        event: events[index]
                    ),
                    itemCount: events.length,
                  ),
                );
              }else {
                return SizedBox();
              }
            }
        ),

      ],
    );
  }
}
