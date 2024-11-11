import 'package:flutter/material.dart';
import '../custom_widgets/discover_user_card.dart';
import '../custom_widgets/status_likes.dart';
import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';
import '../utility/constants/size_config.dart';
import '../utility/constants/sizes.dart';

class MatchesPage extends StatefulWidget {
  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {

  FriendsPartnerTab friendsPartnerTab = FriendsPartnerTab.friend;
  List<String> interests = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          /// appbar
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: TSizes.paddingSpaceXl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50, width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: TColors.buttonPrimary.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/icons/back_arrow.png", color: TColors.buttonPrimary, scale: 1.5,),
                    )),

                Text("Matches",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold, color: TColors.buttonPrimary)),

                Row(
                  children: [

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
          const SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: TSizes.paddingSpaceXl,),
                  StatusLikes(isMyStory: false, image: "assets/images/selena.png", text: "Likes", counts: "32", icon: "assets/icons/like_icon_2.png",),
                  StatusLikes(isMyStory: false, image: "assets/images/user_1.jpg", text: "Connect", counts: "15", icon: "assets/icons/chat_icon.png",),
                ],
              ),
            ),
          ),

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// interest
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
            child: Row(
              children: [
                Text("Your Matches", style: TextStyle(color: TColors.buttonPrimary, fontWeight: FontWeight.w700, fontSize: 24),),
                SizedBox(width: TSizes.paddingSpaceMd,),
                Text("47", style: TextStyle(color: TColors.buttonSecondary, fontWeight: FontWeight.w700, fontSize: 24),),
              ],
            )
          ),

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.paddingSpaceXl),
                child: GridView.count(crossAxisCount: 2,
                  crossAxisSpacing: TSizes.paddingSpaceXl,
                  mainAxisSpacing: TSizes.paddingSpaceXl,
                  childAspectRatio: 0.7,
                  children: const [
                    DiscoverUserCard(image: "assets/images/discover_image_1.jpeg", distance: "16km", name: "Halima, 19", location: "BERLIN", percentage: "100",),
                    DiscoverUserCard(image: "assets/images/user_1.jpg", distance: "2km", name: "Josiah, 29", location: "DORTMUND", percentage: "94",),
                    DiscoverUserCard(image: "assets/images/user_3.jpg", distance: "2.5km", name: "Joyce, 22", location: "Brandon", percentage: "89",),
                    DiscoverUserCard(image: "assets/images/user_4.jpg", distance: "3km", name: "Stella, 24", location: "Alfredo", percentage: "80",),
                    SizedBox(height: 10,),
                  ],),
              ),),

        ],
      ),
    );
  }
}
