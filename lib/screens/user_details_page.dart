import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:friendzy/utility/constants/size_config.dart';
import '../custom_widgets/interest_card.dart';
import '../custom_widgets/radial_progress_indicator.dart';
import '../utility/constants/colors.dart';
import '../utility/constants/sizes.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage(
      {super.key,
      required this.image,
      required this.distance,
      required this.name,
      required this.location,
      required this.matchPercent});
  final String image;
  final String distance;
  final String name;
  final String location;
  final String matchPercent;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: TColors.pastelVar1,
                leading: Container(),
                // title: Text("LOAN P2P"),
                centerTitle: true,
                floating: false,
                pinned: false,
                snap: false,
                expandedHeight: 580,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover)),
                      ),

                      ///gradient overlay
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                TColors.buttonPrimary.withOpacity(1)
                              ], // Gradient colors
                              begin: Alignment.topCenter, // Gradient start point
                              end: Alignment.bottomCenter, // Gradient end point
                              stops: const [0, 0.85]),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),

                      SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// distance
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: TSizes.paddingSpaceXl),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ///back button
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1.5,
                                                color:
                                                    TColors.white.withOpacity(0.5)),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/icons/back_arrow.png",
                                            color: TColors.white,
                                            scale: 1.5,
                                          ),
                                        )),
                                  ),

                                  /// distance
                                  Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: TColors.white.withOpacity(0.8)),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: TSizes.paddingSpaceLg,
                                            vertical: TSizes.paddingSpaceMd),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/icons/distance_icon.png",
                                              color: TColors.white,
                                              scale: 1.5,
                                            ),
                                            const SizedBox(
                                              width: TSizes.paddingSpaceMd,
                                            ),
                                            Text(
                                              widget.distance,
                                              style: const TextStyle(
                                                  color: TColors.white,
                                                  fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ).frosted(
                                          borderRadius: BorderRadius.circular(30),
                                          blur: 1)),
                                ],
                              ),
                            ),

                            Expanded(child: Container()),

                            /// name location and match percent
                            Column(
                              children: [
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: TColors.white,
                                      fontSize: 40),
                                ),
                                Text(
                                  widget.location,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: TColors.white.withOpacity(0.6),
                                      fontSize: 20),
                                ),

                                /// space
                                const SizedBox(
                                  height: TSizes.paddingSpaceMd,
                                ),

                                /// match percentage
                                Container(
                                  decoration: BoxDecoration(
                                      color: TColors.buttonPrimary.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(
                                          TSizes.borderRadiusXl * 2),
                                      border: Border.all(
                                          color: TColors.buttonSecondary,
                                          width: 3)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: TSizes.paddingSpaceLg,
                                        vertical: TSizes.paddingSpaceLg),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Stack(
                                              children: [
                                                FittedBox(
                                                    child: RadialProgressIndicator(
                                                        progress: (double.parse(
                                                                widget
                                                                    .matchPercent)) /
                                                            100)),
                                                Center(
                                                    child: Text(
                                                  "${widget.matchPercent}%",
                                                  style: const TextStyle(
                                                      color: TColors.white,
                                                      fontWeight: FontWeight.bold),
                                                ))
                                              ],
                                            )),
                                        const SizedBox(
                                          width: TSizes.paddingSpaceXl,
                                        ),
                                        const Text(
                                          "Match",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: TColors.white,
                                              fontSize: 25),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(height: TSizes.paddingSpaceXl * 2,),

                            Container(
                              height: 50, width: SizeConfig.screenHeight,
                              decoration: const BoxDecoration(
                                color: TColors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(TSizes.borderRadiusXl), topLeft: Radius.circular(TSizes.borderRadiusXl),)
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                ),
              ),

              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceLg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About", style: TextStyle(color: TColors.grey, fontSize: 20),
                      ),

                      SizedBox(
                        height: TSizes.paddingSpaceXl,
                      ),

                      Text(
                        "A good listener. I love having a good talk to know each other’s side 😍.",
                        style: TextStyle(color: TColors.buttonPrimary, fontSize: 20, fontWeight: FontWeight.w500),
                      ),

                      SizedBox(
                        height: TSizes.paddingSpaceXl,
                      ),

                      Text(
                        "Interest", style: TextStyle(color: TColors.grey, fontSize: 20),
                      ),

                      SizedBox(
                        height: TSizes.paddingSpaceXl,
                      ),

                      /// home cards
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: TSizes.paddingSpaceXl,
                            ),
                            InterestCard(text: "⚽️ Football"),
                            InterestCard(text: "✍🍃  Nature"),
                            InterestCard(text: "🗣 Language"),
                            InterestCard(text: "📸 Photography"),
                            InterestCard(text: "🎵 Music"),
                            InterestCard(text: "✍🏻 Writing"),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: TSizes.paddingSpaceMd,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: TSizes.paddingSpaceXl,
                            ),
                            InterestCard(text: "⚽️ Football"),
                            InterestCard(text: "✍🍃  Nature"),
                            InterestCard(text: "🗣 Language"),
                            InterestCard(text: "📸 Photography"),
                            InterestCard(text: "🎵 Music"),
                            InterestCard(text: "✍🏻 Writing"),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 150,
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),

          /// navbar
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl * 2),
                  child: Container(
                    height: 80,
                    width: SizeConfig.screenWidth * 0.7,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// cancel
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap:(){
                                Navigator.pop(context);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),  // Shadow color
                                          spreadRadius: 10,  // Spread radius
                                          blurRadius: 10,    // Blur radius
                                          offset: const Offset(0, 10),  // changes position of shadow (x, y)
                                        ),
                                      ],
                                  color: TColors.white
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset( "assets/icons/cancel_icon.png"),
                                  ))),
                        ),

                        /// star
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap:(){
                                setState(() {
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),  // Shadow color
                                          spreadRadius: 10,  // Spread radius
                                          blurRadius: 10,    // Blur radius
                                          offset: const Offset(0, 10),  // changes position of shadow (x, y)
                                        ),
                                      ],
                                      color: TColors.buttonPrimary
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset( "assets/icons/star_icon.png", ),
                                  ))),
                        ),

                        /// love
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap:(){
                                setState(() {
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),  // Shadow color
                                          spreadRadius: 10,  // Spread radius
                                          blurRadius: 10,    // Blur radius
                                          offset: const Offset(0, 10),  // changes position of shadow (x, y)
                                        ),
                                      ],
                                      color: TColors.buttonSecondary
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/icons/love_icon.png", ),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
