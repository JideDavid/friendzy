import 'package:flutter/material.dart';
import 'package:friendzy/utility/constants/size_config.dart';
import 'package:friendzy/screens/home.dart';

import '../utility/constants/colors.dart';
import '../utility/constants/sizes.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            const SizedBox(height: TSizes.paddingSpaceLg,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/radial_collage.png", scale: 1.8,),
              ],
            ),
        
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
                  child: Text("Let's meet new people around you",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
        
                const SizedBox(height: TSizes.paddingSpaceLg * 4,),
        
                /// phone sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
                  child: FilledButton(onPressed: (){
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Home())
                    );
                  },
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(TColors.buttonPrimary),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        maximumSize: WidgetStatePropertyAll(Size(SizeConfig.screenWidth, 70)),
                      ),
                      child: Stack(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/phone_icon.png", scale: 1.2,),
                                ),
                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("Login with Phone", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: TColors.white),)),
                              ],
                            )
                          ]
                      )),
                ),
        
                const SizedBox(height: TSizes.paddingSpaceLg,),
        
                /// google sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.paddingSpaceXl),
                  child: FilledButton(onPressed: (){},
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(TColors.buttonSecondary.withOpacity(0.5)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        maximumSize: WidgetStatePropertyAll(Size(SizeConfig.screenWidth, 70)),
                      ),
                      child: Stack(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/icons/google_icon.png", scale: 1.2,),
                                ),
                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("Login with Google", style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.bold, color: TColors.buttonPrimary),)),
                              ],
                            )
                          ]
                      )),
                ),
        
                const SizedBox(height: TSizes.paddingSpaceLg * 4,),
        
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                      style: TextStyle(color: TColors.buttonPrimary),),
                    Text(" Sign Up", style: TextStyle(color: TColors.buttonSecondary),),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
