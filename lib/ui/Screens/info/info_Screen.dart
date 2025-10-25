// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../core/Theme/app_Color.dart';
// import '../../../core/provider/app_config_provider.dart';
//
//
//
// class InfoScreen extends StatefulWidget {
//   const InfoScreen({super.key});
//   static const String routeName = "InfoScreen";
//
//   @override
//   State<InfoScreen> createState() => _InfoScreenState();
// }
//
// class _InfoScreenState extends State<InfoScreen> {
//   final PageController _controller = PageController();
//   late var provider = Provider.of<AppConfigProvider>(context);
//
//   int currentPage = 0;
//
//   List<Map<String, String>> introData = [
//     {
//       "title": "Find Event That Inspire You",
//       "image": "assets/images/onboard1.png",
//       "desc":
//       "Discover unique experiences and events tailored to your interests. Explore, connect, and enjoy unforgettable moments.",
//     },
//     {
//       "title": "Effortless Event Planning",
//       "image": "assets/images/onboard2.png",
//       "desc":
//       "Simplify your event planning process. From invitations to scheduling, manage everything in one place.",
//     },
//     {
//       "title": "Connect with Friends & Share Moments",
//       "image": "assets/images/onboard3.png",
//       "desc":
//       "Stay in touch with friends, share event memories, and create new ones together effortlessly.",
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
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
//
//       bottomSheet: currentPage == introData.length - 1
//           ? Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Center(
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColor.primaryBlue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: const EdgeInsets.symmetric(
//                   horizontal: 40, vertical: 12),
//             ),
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/home');
//             },
//             child: const Text(
//               "Let's Go",
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//           ),
//         ),
//       )
//           : Container(
//         color: Colors.white,
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             TextButton(
//               onPressed: () {
//                 _controller.jumpToPage(introData.length - 1);
//               },
//               child: const Text(
//                 "Skip",
//                 style: TextStyle(color: AppColor.primaryBlue),
//               ),
//             ),
//             Row(
//               children: List.generate(
//                 introData.length,
//                     (index) => AnimatedContainer(
//                   duration: const Duration(milliseconds: 200),
//                   margin: const EdgeInsets.all(4),
//                   width: currentPage == index ? 12 : 8,
//                   height: currentPage == index ? 12 : 8,
//                   decoration: BoxDecoration(
//                     color: currentPage == index
//                         ? AppColor.primaryBlue
//                         : Colors.grey[300],
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 _controller.nextPage(
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeIn,
//                 );
//               },
//               child: const Text(
//                 "Next",
//                 style: TextStyle(color: AppColor.primaryBlue),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildIntroPage({
//     required String image,
//     required String title,
//     required String desc,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(height: 40),
//           Image.asset(image, height: 250),
//           const SizedBox(height: 50),
//           Text(
//             title,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: AppColor.primaryBlue,
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 15),
//           Text(
//             desc,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               color: AppColor.textColor,
//               fontSize: 16,
//               height: 1.4,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
