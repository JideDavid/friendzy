import 'package:flutter/material.dart';
import 'package:friendzy/custom_widgets/interest_card.dart';
import 'package:friendzy/custom_widgets/user_card.dart';
import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';
import '../utility/constants/size_config.dart';
import '../utility/constants/sizes.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  FriendsPartnerTab friendsPartnerTab = FriendsPartnerTab.friend;
  List<String> interests = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        children: [
          /// appbar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: TSizes.paddingSpaceXl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(
                      width: SizeConfig.screenWidth * 0.22,
                      child: FittedBox(
                        child: Row(
                          children:[
                            Image.asset("assets/icons/location_icon.png"),
                            const SizedBox(width: TSizes.paddingSpaceMd,),
                            const Text("Germany"),
                            const SizedBox(width: TSizes.paddingSpaceMd,),
                            Image.asset("assets/icons/arrow_down_icon.png"),
                          ]

                        ),
                      ),
                    ),
                    Text("Discover",
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 30, fontWeight: FontWeight.bold, color: TColors.buttonPrimary)),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      height: 50, width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.5, color: TColors.buttonPrimary.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/icons/search_icon.png"),
                      )),
                    const SizedBox(width: TSizes.paddingSpaceXl,),
                    Container(
                        height: 50, width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: TColors.buttonPrimary.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/icons/setting_icon.png"),
                        )),
                  ]
                )
              ],
            ),
          ),

          ///status bar
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: TSizes.paddingSpaceXl,),
                UserCard(image: "assets/images/discover_image_1.jpeg", distance: "16km away", name: "Halima, 19", location: '"BERLIN"',),
                UserCard(image: "assets/images/user_1.jpg", distance: "16km away", name: "Halima, 19", location: '"BERLIN"',),
                UserCard(image: "assets/images/user_2.jpg", distance: "16km away", name: "Halima, 19", location: '"BERLIN"',),
                UserCard(image: "assets/images/user_3.jpg", distance: "16km away", name: "Halima, 19", location: '"BERLIN"',),
                UserCard(image: "assets/images/user_4.jpg", distance: "16km away", name: "Halima, 19", location: '"BERLIN"',),
              ],
            ),
          ),

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// interest
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Interest", style: TextStyle(color: TColors.buttonPrimary, fontWeight: FontWeight.w700, fontSize: 24),),
                Text("View all", style: TextStyle(color: TColors.buttonSecondary),)
              ],
            )
          ),

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// home cards
          const SingleChildScrollView(
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

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// home cards
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: TSizes.paddingSpaceXl,
                ),

                InterestCard(text: "✍🏻 Writing"),
                InterestCard(text: "🗣 Language"),
                InterestCard(text: "📸 Photography"),
                InterestCard(text: "⚽️ Football"),
                InterestCard(text: "✍🍃  Nature"),
                InterestCard(text: "🎵 Music"),
              ],
            ),
          ),

          const SizedBox(height: TSizes.paddingSpaceXl,),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Around me", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("People with", style: TextStyle(  ),),
                        Text("\"Music\"", style: TextStyle( color: TColors.buttonSecondary ),),
                        Text("interest round you", style: TextStyle(  ),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// map
          Container(
            height: SizeConfig.screenWidth * 0.91,
            width: SizeConfig.screenWidth * 0.91,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: TColors.buttonSecondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
                image: const DecorationImage(image: AssetImage("assets/images/map.jpeg"), fit: BoxFit.fill)
            ),
            child: Center(
              child: Image.asset("assets/images/map_user_1.png", scale: 1.5,)
            ),
          ),

          const SizedBox(height: 130,),

        ],
      ),
    );
  }
}
