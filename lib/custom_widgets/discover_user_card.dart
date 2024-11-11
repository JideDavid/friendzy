import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:friendzy/screens/user_details_page.dart';
import 'package:friendzy/utility/constants/size_config.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/sizes.dart';

class DiscoverUserCard extends StatelessWidget {
  const DiscoverUserCard({required this.image, super.key, required this.distance, required this.name, required this.location, required this.percentage, });
  final String image;
  final String distance;
  final String name;
  final String location;
  final String percentage;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => UserDetailsPage(image: image, distance: distance, name: name, location: location, matchPercent: percentage,))
        );
      },
      child: Container(
        width: SizeConfig.screenWidth * 0.28,
        height: SizeConfig.screenWidth * 0.45,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image:  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(TSizes.borderRadiusXl),
            border: Border.all(color: TColors.buttonSecondary, width: 5)
        ),
        child: Stack(
          children: [

            ///gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, TColors.buttonPrimary.withOpacity(0.9)], // Gradient colors
                  begin: Alignment.topCenter, // Gradient start point
                  end: Alignment.bottomCenter, // Gradient end point
                ),
                borderRadius: BorderRadius.circular(22),
              ),
            ),

            /// contents
            Padding(
              padding: const EdgeInsets.only(bottom: TSizes.borderRadiusMd),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  /// match percentage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: TColors.buttonSecondary,
                            border: Border.all(color: TColors.buttonSecondary, width: 2),
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(TSizes.borderRadiusLg), bottomRight: Radius.circular(TSizes.borderRadiusLg)  )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceLg, vertical: TSizes.paddingSpaceSm),
                            child: Text("$percentage% match ", style: const TextStyle(color: TColors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$distance away", style: const TextStyle(fontWeight: FontWeight.normal, color: TColors.white, fontSize: 12),),
                      ). frosted(
                        frostColor: TColors.grey,
                        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: TColors.white, fontSize: 18),),
                          const Icon(Icons.circle, size: 10, color: TColors.success)
                        ],
                      ),

                      Text(location, style: const TextStyle(fontWeight: FontWeight.w300, color: TColors.white, fontSize: 12, letterSpacing: 5),),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
