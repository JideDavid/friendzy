import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/size_config.dart';
import '../utility/constants/sizes.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.backgroundImage, required this.category, required this.description, required this.image, required this.name, required this.location,});
  final String backgroundImage;
  final String category;
  final String description;
  final String image;
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TSizes.paddingSpaceXl),
      child: Container(
          height: SizeConfig.screenWidth * 0.91,
          width: SizeConfig.screenWidth * 0.91,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: TColors.buttonSecondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
              image: DecorationImage(image: AssetImage(backgroundImage), fit: BoxFit.fill)
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, TColors.buttonSecondary.withOpacity(0.4)], // Gradient colors
                    begin: Alignment.topCenter, // Gradient start point
                    end: Alignment.bottomCenter, // Gradient end point
                  ),
                ),
              ),

              /// side icons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: SizeConfig.screenWidth * 0.35,
                      child: FittedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: TSizes.paddingSpaceMd, horizontal: TSizes.paddingSpaceMd),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: TColors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: TSizes.paddingSpaceMd, horizontal: TSizes.paddingSpaceMd),
                                    child: Image.asset("assets/icons/like_icon.png", scale: 1.5,)
                                ),
                              ),
                            ),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: TSizes.paddingSpaceMd, horizontal: TSizes.paddingSpaceMd),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: TColors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: TSizes.paddingSpaceMd, horizontal: TSizes.paddingSpaceMd),
                                    child: Image.asset("assets/icons/chat_icon.png", scale: 1.5,)
                                ),
                              ),
                            ),
                        
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: TSizes.paddingSpaceMd, horizontal: TSizes.paddingSpaceMd),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: TColors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: TSizes.paddingSpaceMd, horizontal: TSizes.paddingSpaceMd),
                                    child: Image.asset("assets/icons/more_icon.png", scale: 1.5,)
                                ),
                              ),
                            ),
                        
                        
                          ],
                        ),
                      ),
                    ).frosted(
                      blur: 3,
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                      padding: const EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
              /// content
              Padding(
                padding: const EdgeInsets.all(TSizes.paddingSpaceXl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category, style: const TextStyle(color: TColors.white, fontSize: 20, fontWeight: FontWeight.w400),).frosted(
                        blur: 1,
                        borderRadius: BorderRadius.circular(20),
                        padding: const EdgeInsets.all(8),
                        frostColor: TColors.white
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: SizeConfig.screenWidth * 0.55,
                            child: Text(description, style: const TextStyle(color: TColors.white, fontWeight: FontWeight.w600, fontSize: 20),)),

                        /// space
                        const SizedBox(height: TSizes.paddingSpaceXl,),

                        Row(
                          children: [
                            Image.asset(image, scale: 2,),

                            /// space
                            const SizedBox(width: TSizes.paddingSpaceXl,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: TColors.white)),
                                Text(location, style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: TColors.white)),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
