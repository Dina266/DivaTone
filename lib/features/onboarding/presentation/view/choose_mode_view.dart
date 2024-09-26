import 'package:diva_tone/core/routes/routing.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/utils/app_images.dart';
import 'widgets/custom_logo.dart';
import 'widgets/item_change_mode.dart';

class ChooseModeView extends StatelessWidget {
  const ChooseModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(AppImages.changeMoodBG))),
              ),
          Container(color: Colors.black.withOpacity(0.15)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(children: [
                  const CustomLogo(),
                  const Spacer(),
                  const Text(
                    "Choose Mode",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  const ItemChangeMode(),
                  const SizedBox(height: 60),
                  CustomElevatedButton(onPressed: () {
                    Navigator.pushNamed(context, Routing.signInOrSignUpView);
                  }, title: "Continue")
                ]),
          )
        ],
      )),
    );
  }
}


