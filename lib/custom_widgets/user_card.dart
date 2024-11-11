import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:friendzy/utility/constants/size_config.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/sizes.dart';

class UserCard extends StatelessWidget {
  const UserCard({required this.image, super.key, required this.distance, required this.name, required this.location, });
  final String image;
  final String distance;
  final String name;
  final String location;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.paddingSpaceLg),
      child: Container(
        width: SizeConfig.screenWidth * 0.28,
        height: SizeConfig.screenWidth * 0.45,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image:  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(TSizes.borderRadiusMd)
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
              ),
            ),

            /// contents
            Padding(
              padding: const EdgeInsets.all(TSizes.borderRadiusMd),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  /// tag -NEW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: TColors.buttonPrimary,
                            border: Border.all(color: TColors.buttonSecondary, width: 2),
                            borderRadius: BorderRadius.circular(TSizes.borderRadiusSm)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceMd, vertical: TSizes.paddingSpaceSm),
                            child: Text("NEW", style: TextStyle(color: TColors.white, fontWeight: FontWeight.w400, fontSize: 12),),
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
                        child: Text(distance, style: const TextStyle(fontWeight: FontWeight.normal, color: TColors.white, fontSize: 12),),
                      ). frosted(
                        frostColor: TColors.grey,
                        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg)
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: TColors.white),),
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
