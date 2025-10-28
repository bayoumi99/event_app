import 'package:event_app/ui/edit%20event/edit_even.dart';
import 'package:flutter/material.dart';

import '../../models/Category_Dm.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});
  static const String routeName = "Event Details Screen ";

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  CategoryDm  selectedCategory = categoriesList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Event Details",
          style: TextStyle(
            color: Color(0xFF4169E1),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF4169E1)),
          onPressed: () => Navigator.pop(context),
        ),
        actions:  [
          InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context,EditEven.routeName);
              },
              child: Icon(Icons.edit, color: Color(0xFF4169E1))),
          SizedBox(width: 10),
          Icon(Icons.delete, color: Colors.redAccent),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child:AspectRatio(
                  aspectRatio: 361 / 203,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(selectedCategory.imagePath
                      )
                  )
              ),

            ),
            const SizedBox(height: 15),

            const Text(
              "We Are Going To Play Football",
              style: TextStyle(
                color: Color(0xFF4169E1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: const [
                  Icon(Icons.calendar_month, color: Color(0xFF4169E1)),
                  SizedBox(width: 10),
                  Text(
                    "21 November 2024",
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "12:12 PM",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),


            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Color(0xFF4169E1)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Cairo, Egypt",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded,
                      color: Color(0xFF4169E1), size: 16),
                ],
              ),
            ),
            const SizedBox(height: 15),

            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/image/mapping.png",
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF4169E1),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Lorem ipsum dolor sit amet consectetur. "
                  "Vulputate eleifend suscipit eget neque senectus a. "
                  "Nulla at non malesuada odio duis lectus amet nisi sit. "
                  "Risus hac enim maecenas auctor et. At cras massa diam porta facilisi lacus purus. "
                  "Iaculis eget quis ut amet. Sit ac malesuada nisi quis feugiat.",
              style: TextStyle(
                color: Colors.black87,
                height: 1.5,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
