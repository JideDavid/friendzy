import 'package:flutter/material.dart';
import 'package:friendzy/screens/discover_page.dart';
import 'package:friendzy/screens/home_page.dart';
import 'package:friendzy/screens/matches_page.dart';
import 'package:friendzy/utility/constants/size_config.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/sizes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            tabIndex == 0 ? const HomePage()
            : tabIndex == 1 ? const DiscoverPage()
            : const MatchesPage(),

            /// navbar
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl * 2),
                  child: Container(
                    height: 80,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      color: TColors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),  // Shadow color
                          spreadRadius: 10,  // Spread radius
                          blurRadius: 10,    // Blur radius
                          offset: const Offset(0, 10),  // changes position of shadow (x, y)
                        ),
                      ],
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  tabIndex = 0;
                                });
                              },
                              child: Image.asset( tabIndex == 0 ? "assets/icons/home_icon_s.png" : "assets/icons/home_icon_u.png", scale: 1.5,)),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  tabIndex = 1;
                                });
                              },
                              child: Image.asset( tabIndex == 1 ? "assets/icons/discover_s.png" : "assets/icons/discover_u.png", scale: 1.5,)),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  tabIndex = 2;
                                });
                              },
                              child: Image.asset( tabIndex == 2 ? "assets/icons/add_u.png" : "assets/icons/add_u.png", scale: 1.5,)),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  tabIndex = 3;
                                });
                              },
                              child: Image.asset( tabIndex == 3 ? "assets/icons/matches_s.png" : "assets/icons/matches_u.png", scale: 1.5,)),
                          GestureDetector(
                              onTap:(){
                                setState(() {
                                  tabIndex = 4;
                                });
                              },
                              child: Image.asset( tabIndex == 4 ? "assets/icons/message_s.png" : "assets/icons/message_u.png", scale: 1.5,)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
