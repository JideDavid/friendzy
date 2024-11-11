import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:friendzy/utility/constants/colors.dart';

class StatusLikes extends StatelessWidget {
  const StatusLikes(
      {super.key,
      required this.isMyStory,
      required this.image,
      required this.text, required this.counts, required this.icon});

  final bool isMyStory;
  final String image;
  final String text;
  final String counts;
  final String icon;

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
                  width: 3,
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
                
                child: Center(
                  child: Image.asset(icon, scale: 1.5,).frosted(
                    blur: 2,
                    padding: const EdgeInsets.all(21),
                    borderRadius: BorderRadius.circular(40)
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(text, style: const TextStyle(fontSize: 18),),
              const SizedBox(width: 8,),
              Text(counts, style: const TextStyle(fontSize: 18, color: TColors.buttonSecondary, fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    );
  }
}
