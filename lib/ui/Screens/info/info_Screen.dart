import 'package:event_app/core/Theme/app_Color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/provider/app_config_provider.dart';
import '../login_screen/Login_screen.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});
  static const String routeName = "Info Screen ";

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final PageController _controller = PageController();
  late var provider = Provider.of<AppConfigProvider>(context);

  int currentPage = 0;

  List<Map<String, String>> get introData => [
    {
      "title": "Find Event That Inspire You",
      "desc":
      "Discover unique experiences and events tailored to your interests. Explore, connect, and enjoy unforgettable moments.",
      "image": "assets/image/Group2.png"
    },
    {
      "title": "Effortless Event Planning",
      "desc":
      "Simplify your event planning process. From invitations to scheduling, manage everything in one place.",
      "image": 'assets/image/${provider.isDark()?"wireframe.png":"being-creative2.png"}'
    },
    {
      "title": "Connect with Friends & Share Moments",
      "desc":
      "Stay in touch with friends, share event memories, and create new ones together effortlessly.",
      "image": 'assets/image/${provider.isDark()?"uploading.png":"social-media.png"}'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: introData.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                     EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                             SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Image.asset("assets/image/Group 4.png",width: MediaQuery.sizeOf(context).width*0.4,),

                                SizedBox(width: 6),
                              ],
                            ),
                          ],
                        ),

                        Image.asset(
                          introData[index]["image"]!,
                          height: 260,
                        ),

                        Column(
                          children: [
                            Text(
                              introData[index]["title"]!,
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                color: AppColor.purple,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                             SizedBox(height: 15),
                            Text(
                              introData[index]["desc"]!,
                              textAlign: TextAlign.center,
                              style:  TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                _controller.jumpToPage(introData.length - 1);
                              },
                              child:  InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, LoginScreen.routeName);
                                },
                                child: Text(
                                  "Skip",
                                  style: TextStyle(
                                    color: Color(0xFF4169E1),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: List.generate(
                                introData.length,
                                    (dotIndex) => AnimatedContainer(
                                  duration:
                                   Duration(milliseconds: 300),
                                  margin:
                                   EdgeInsets.symmetric(horizontal: 3),
                                  height: 8,
                                  width:
                                  currentPage == dotIndex ? 20 : 8,
                                  decoration: BoxDecoration(
                                    color: currentPage == dotIndex
                                        ?  AppColor.purple
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (currentPage ==
                                    introData.length - 1) {
                                  Navigator.pushReplacementNamed(
                                      context, LoginScreen.routeName);
                                } else {
                                  _controller.nextPage(
                                    duration:
                                     Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Text(
                                currentPage == introData.length - 1
                                    ? "Done"
                                    : "Next",
                                style:  TextStyle(
                                  color: AppColor.purple,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
