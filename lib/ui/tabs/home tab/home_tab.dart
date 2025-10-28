import 'package:event_app/fireBase/events_database.dart';
import 'package:event_app/models/Category_Dm.dart';
import 'package:event_app/ui/Widgets/event_Card.dart';
import 'package:event_app/ui/tabs/home%20tab/home_header.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<CategoryDm> categories = [];
  late CategoryDm selectedCategory;
  EventsDatabase database = EventsDatabase();


  @override
  initState(){
    super.initState();
    categories.add(CategoryDm("All", "الكل", -1, "", Icons.explore));
    categories.addAll(categoriesList);
    selectedCategory =categories.first;
  }
  @override
  Widget build(BuildContext context) {


return Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
HomeHeader(categoriesList: categories,
    selectedCategory: selectedCategory,
    changeSelectedCategory:changeSelectedCategory,
),
    StreamBuilder(
        stream: database.getEventsListStream( selectedCategory),
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
changeSelectedCategory(category){
  setState(() {
    selectedCategory = category;
  });
}
}
