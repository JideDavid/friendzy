import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/sizes.dart';
import '../view_Models/user_settings_provider.dart';

class InterestCard extends StatelessWidget {
  const InterestCard({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.paddingSpaceLg),
      child: GestureDetector(
        onTap: (){
          Provider.of<UserSettingsProvider>(context, listen: false).modifyInterestList(text);
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
                border: Border.all(color: TColors.buttonSecondary),
                color: Provider.of<UserSettingsProvider>(context).interests.contains(text) ? TColors.buttonSecondary : TColors.white
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl, vertical: TSizes.paddingSpaceLg),
              child: Text(text, style: TextStyle(color: Provider.of<UserSettingsProvider>(context).interests.contains(text)
                  ? TColors.white : TColors.buttonPrimary),),
            )),
      ),
    );
  }
}
