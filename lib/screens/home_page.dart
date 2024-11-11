import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:friendzy/custom_widgets/home_card.dart';

import '../custom_widgets/status_picture.dart';
import '../utility/constants/colors.dart';
import '../utility/constants/enums.dart';
import '../utility/constants/size_config.dart';
import '../utility/constants/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FriendsPartnerTab friendsPartnerTab = FriendsPartnerTab.friend;

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
                Text("Friendzy",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 30, fontWeight: FontWeight.bold, color: TColors.buttonPrimary)),

                Container(
                    height: 50, width: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: TColors.buttonPrimary.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/icons/notification.png"),
                    ))
              ],
            ),
          ),

          ///status bar
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: TSizes.paddingSpaceXl,),
                StatusPicture(isMyStory: true, image: "assets/images/my_story.png", text: "My Story"),
                StatusPicture(isMyStory: false, image: "assets/images/selena.png", text: "Selena"),
                StatusPicture(isMyStory: false, image: "assets/images/clara.png", text: "Clara"),
                StatusPicture(isMyStory: false, image: "assets/images/fabian.png", text: "Fabian"),
                StatusPicture(isMyStory: false, image: "assets/images/fabian.png", text: "Fabian"),
                StatusPicture(isMyStory: false, image: "assets/images/fabian.png", text: "Fabian"),
                StatusPicture(isMyStory: false, image: "assets/images/fabian.png", text: "Fabian"),
              ],
            ),
          ),

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// Friends and partner tab
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
            child: Container(
              width: SizeConfig.screenWidth,
              height: 50,
              decoration: BoxDecoration(
                  color: TColors.buttonSecondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)
              ),

              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    /// make friends
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            friendsPartnerTab = FriendsPartnerTab.friend;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: friendsPartnerTab == FriendsPartnerTab.friend ? TColors.white : TColors.transparent,
                                borderRadius: BorderRadius.circular(TSizes.borderRadiusXl)
                            ),
                            child: const Center(child: Text("Make Friends", style: TextStyle(fontWeight: FontWeight.bold, color: TColors.buttonPrimary),))),
                      ),
                    ),
                    ///space
                    const SizedBox(width: 5,),
                    /// search partners
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            friendsPartnerTab = FriendsPartnerTab.partner;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: friendsPartnerTab == FriendsPartnerTab.partner ? TColors.white : TColors.transparent,
                                borderRadius: BorderRadius.circular(TSizes.borderRadiusXl)
                            ),
                            child: const Center(child: Text("Search Partners", style: TextStyle(fontWeight: FontWeight.bold, color: TColors.buttonPrimary),))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          /// space
          const SizedBox(height: TSizes.paddingSpaceXl,),

          /// home cards
          const HomeCard(
            backgroundImage: "assets/images/home_card_1.jpg",
            category: "🏝 Travel",
            description: "If you could live anywhere in the world, where would you pick?",
            image: "assets/images/fabian.png",
            name: "Fabian Rogers",
            location: "STUTTGART",
          ),

          const HomeCard(
            backgroundImage: "assets/images/home_card_2.jpg",
            category: "⚽️ Football",
            description: "If you could live anywhere in the world, where would you pick?",
            image: "assets/images/fabian.png", name: "Fabian Rogers", location: "STUTTGART",
          ),


          const SizedBox(height: 110,)

        ],
      ),
    );
  }
}
