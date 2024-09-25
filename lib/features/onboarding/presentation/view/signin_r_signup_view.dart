import 'package:diva_tone/features/splash/presentation/view/widgets/custom_splash_logo.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/utils/app_images.dart';

class SigninOrSignupView extends StatelessWidget {
  const SigninOrSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : Scaffold(
        body: Stack (
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(AppImages.topUnion)
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(AppImages.bottomUnion)
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(AppImages.signinOrSignup)
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogo(),
                  const SizedBox(height: 55),

                  const Text("Enjoy Listening to Music", style: TextStyle (
                    fontSize: 26,
                    fontWeight: FontWeight.bold
                  )),
                  const SizedBox(height: 28),
                  const Text("DivaTone is a proprietary Swedish audio streaming and media services provider", style: TextStyle (
                    fontSize: 17,
                    color:Color(0xff797979),
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical : 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        SizedBox(
                          height: 75,
                          width: 180 ,
                          child: CustomElevatedButton(onPressed: (){},title: "Register",height: 20)),
                        TextButton(onPressed: (){}, child: Text("Sign in" , style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        )))
                      ]
                    ),
                  )

              ],)
            ),
          ]
        )
      )
    );
  }
}