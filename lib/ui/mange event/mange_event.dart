import 'package:event_app/core/app_dialog.dart';
import 'package:event_app/fireBase/events_database.dart';
import 'package:event_app/models/Category_Dm.dart';
import 'package:event_app/models/event_Dm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/Theme/app_Color.dart';
import '../../core/provider/app_config_provider.dart';

class MangeEvent extends StatefulWidget {
   const MangeEvent({super.key});
  static const String routeName = "Mange Event Screen ";

  @override
  State<MangeEvent> createState() => _MangeEventState();
}

class _MangeEventState extends State<MangeEvent> {
 CategoryDm  selectedCategory = categoriesList.first;
 TextEditingController titleController = TextEditingController();
 TextEditingController descriptionController = TextEditingController();
 DateTime? selectedDate;
 TimeOfDay? selectedTime;



 late var provider =  Provider.of<AppConfigProvider>(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Create Event"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(
              aspectRatio: 361 / 203,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(selectedCategory.imagePath
                  )
              )
          ),
          SizedBox(height: 16),
          DefaultTabController(
              length: categoriesList.length,
              child: TabBar(
                isScrollable: true,
                indicator:null ,
                indicatorColor: Colors.transparent,
                dividerHeight: 0,
                labelPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,
                onTap: (index){
                  setState(() {
                    selectedCategory = categoriesList[index];
                  });
                },
                tabs:
                categoriesList.map((category)=> Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: category.id == selectedCategory.id
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                        borderRadius: BorderRadius.circular(1000),
                        border: Border.all(width: 1,
                            color: category.id == selectedCategory.id
                                ? Theme.of(context).colorScheme.surface
                                : Theme.of(context).colorScheme.primary,
                        )
                    ),
                    child: Row(
                      children: [
                        Icon(category.icon ,
                          color:Theme.of(context).colorScheme.primary ),
                        SizedBox(height: 8,),
                        Text(provider.isEn()?category.nameEn:category.nameAr,
                          style: TextStyle(
                            color: category.id == selectedCategory.id
                                ? Theme.of(context).colorScheme.surface
                                : Theme.of(context).colorScheme.primary,
                          ),)
                      ],
                    )
                )
                ).toList(),
              )


          ),
          SizedBox(height: 16),
          Text("Title"),
          SizedBox(height: 16),
          TextFormField(
            controller: titleController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (input){
            return titleValidation(input);
            },
            decoration: InputDecoration(
              hintText: "Enter title",
              prefixIcon: Icon(Icons.edit),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            )
          ),
          SizedBox(height: 16),
          Text("description"),
          SizedBox(height: 16),
          TextFormField(
              controller: descriptionController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (input){
             return descriptionValidation(input);
              },
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              )
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.date_range),
              SizedBox(width: 8),
              Text("Date"),
              Spacer(),
              InkWell(
                onTap: (){
                  getEventDate(context);
                  },
                child: Text(
                  selectedDate == null ?
                  "choose Date": "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                style: Theme.of(context).textTheme.titleSmall,),
              ),
              Icon(Icons.arrow_drop_down),

            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 8),
              Text("Time"),
              Spacer(),
              InkWell(
               onTap: () {
                 selectTime(context);
               },
                child: Text( selectedTime == null ?
                "choose Time": "${selectedTime!.hour}:${selectedTime!.minute}",
                  style: Theme.of(context).textTheme.titleSmall,),
              ),
              Icon(Icons.arrow_drop_down),

            ],
          ),
          SizedBox(height: 16),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.location_on,
                    color: AppColor.purple,
                    size: 18,
                  ),
                ),
                title: const Text(
                  "Choose Event Location",
                  style: TextStyle(
                    color: AppColor.purple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.purple,
                  size: 18,
                ),
                onTap: () {
                  // todo choose location
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          FilledButton(onPressed: ()async{
            String errorMessage = "";
            if(selectedTime==null){errorMessage +="please choose event time\n";}
            if(selectedDate==null){errorMessage +="please choose event date\n";}
            if(titleController.text.isEmpty){errorMessage +="please enter event title\n";}
            if(descriptionController.text.isEmpty){errorMessage +="please enter event description\n";}
            if(errorMessage.isNotEmpty) {
              AppDialog.showActionDialog(content: errorMessage,
                  context: context ,
                  title: "Invalid Data" ,
                positiveActionTitle: "Try Again"
              );
              return;
            }
            AppDialog.showLoadingDialog(
              context: context,
             loadingMessage: "Creating Event......",
              dismissible: false,
            );
            try{
              EventsDatabase eventsDatabase = EventsDatabase();
              await eventsDatabase.createEvent(
                  EventDm(
    title:  titleController.text,
    description:  descriptionController.text,
    id:  "",
    category:  selectedCategory,
   date:  selectedDate!.millisecondsSinceEpoch,
    time:  DateTime(
      0,0,0,
      selectedTime!.hour,
      selectedTime!.minute,
    ).millisecondsSinceEpoch,
                  )
              );
              Navigator.pop(context);
              AppDialog.showActionDialog(
                context: context,
                title: "Success",
                content: "Event Created Successfully",
                positiveActionTitle: "Ok",
                positiveAction: (){
                  Navigator.pop(context);
                },
              );
            }catch(e){
              Navigator.pop(context);
              AppDialog.showActionDialog(
                context: context,
                title: "Error",
                content: e.toString(),
                positiveActionTitle: "Try Again",
              );
            }
          }, child: Text("Add Event"))
        ], 
      ),
    );

  }
 getEventDate(BuildContext context)async   {
    var date = await showDatePicker(
        context: context,
        initialDate: selectedDate ,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
if(date != null){
  setState(() {
    selectedDate = date;
  });
}



 }

 static String? titleValidation(String? input) {
   input??= "";
   if(input.isEmpty){
     return "please enter title";
   }
   return null;
 }
 static String? descriptionValidation(String? input) {
   input??= "";
   if(input.isEmpty){
     return "please enter description";
   }
   return null;
 }
   selectTime(BuildContext context) async {
    var time = await showTimePicker (
      context: context,
      initialTime: selectedTime??TimeOfDay.now(),
    );
    if(time != null){
      setState(() {
        selectedTime = time;
      });
    };
  }}





