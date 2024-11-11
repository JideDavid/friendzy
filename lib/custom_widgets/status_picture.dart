import 'package:flutter/material.dart';
import 'package:friendzy/utility/constants/colors.dart';

class StatusPicture extends StatelessWidget {
  const StatusPicture(
      {super.key,
      required this.isMyStory,
      required this.image,
      required this.text});
  final bool isMyStory;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color:
                      !isMyStory ? TColors.buttonSecondary : TColors.transparent,
                ),
                borderRadius: BorderRadius.circular(isMyStory ? 0 : 100),),
            child: Padding(
              padding: EdgeInsets.all(isMyStory ? 0 :4),
              child: Container(
                decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(isMyStory ? 0 : 100),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill)),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(text, style: const TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}
