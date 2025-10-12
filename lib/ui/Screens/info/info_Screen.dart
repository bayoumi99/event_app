// import 'package:event_app/ui/setup_Screen.dart';
// import 'package:flutter/material.dart';
//
// import '../core/app_Color.dart';
//
//
// class InfoScreen extends StatefulWidget {
//   const InfoScreen({super.key});
//   static const String routeName = "Info Screen ";
//
//   @override
//   State<InfoScreen> createState() => _InfoScreen();
// }
//
// class _InfoScreen extends State<InfoScreen> {
//   final PageController _controller = PageController();
//   int currentPage = 0;
//
//   List<Map<String, String>> introData = [
//     {
//       "title": "Welcome To Islami App",
//       "image": "assets/Islami Files/PNG Images/marhaba.png",
//       "desc": ""
//     },
//     {
//       "title": "Welcome To Islami",
//       "image": "assets/Islami Files/PNG Images/kabba.png",
//       "desc": "We Are Very Excited To Have You In Our Community"
//     },
//     {
//       "title": "Reading the Quran",
//       "image": "assets/Islami Files/PNG Images/welcome.png",
//       "desc": "Read, and your Lord is the Most Generous"
//     },
//     {
//       "title": "Tasbeeh",
//       "image": "assets/Islami Files/PNG Images/bearish.png",
//       "desc": "Praise the name of your Lord, the Most High"
//     },
//     {
//       "title": "Holy Quran Radio",
//       "image": "assets/Islami Files/PNG Images/radio.png",
//       "desc": "You can listen to the Holy Quran Radio easily"
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         controller: _controller,
//         itemCount: introData.length,
//         onPageChanged: (index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         itemBuilder: (context, index) => buildIntroPage(
//           image: introData[index]["image"]!,
//           title: introData[index]["title"]!,
//           desc: introData[index]["desc"]!,
//         ),
//       ),
//       bottomSheet: currentPage == introData.length - 1
//           ? TextButton(
//         style: TextButton.styleFrom(
//           minimumSize: const Size.fromHeight(60),
//           backgroundColor: Colors.amber,
//         ),
//         onPressed: () {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                   builder: (context) =>  LoginScreen()));
//         },
//         child: const Text(
//           "Finish",
//           style: TextStyle(color: AppColor.black, fontSize: 18),
//         ),
//       )
//           : Container(
//         height: 60,
//         color: AppColor.black,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             TextButton(
//               onPressed: () {
//                 _controller.jumpToPage(introData.length - 1);
//               },
//               child: const Text("Skip", style: TextStyle(color: Colors.amber)),
//             ),
//             Row(
//               children: List.generate(
//                 introData.length,
//                     (index) => Container(
//                   margin: const EdgeInsets.all(4),
//                   width: 10,
//                   height: 10,
//                   decoration: BoxDecoration(
//                     color: currentPage == index ? AppColor.gold : AppColor.grey,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 _controller.nextPage(
//                     duration: const Duration(milliseconds: 300),
//                     curve: Curves.easeIn);
//               },
//               child: const Text("Next", style: TextStyle(color: AppColor.gold)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildIntroPage({required String image, required String title, required String desc}) {
//     return Container(
//       color: AppColor.black,
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image, height: 250, color: AppColor.gold),
//           const SizedBox(height: 30),
//           Text(title,
//               style: const TextStyle(
//                   color: AppColor.gold,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center),
//           const SizedBox(height: 15),
//           Text(desc,
//               style: const TextStyle(color: Colors.white70, fontSize: 16),
//               textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }
