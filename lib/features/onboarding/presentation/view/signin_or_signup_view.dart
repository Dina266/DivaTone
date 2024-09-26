import 'package:diva_tone/core/components/widgets/custom_app_bar.dart';
import 'package:diva_tone/features/splash/presentation/view/widgets/custom_splash_logo.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/routes/routing.dart';
import '../../../../core/utils/app_images.dart';

class SignInOrSignUpView extends StatelessWidget {
  const SignInOrSignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      const CustomAppBar(),
      Align(
          alignment: Alignment.topRight,
          child: Image.asset(AppImages.topUnion)),
      Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(AppImages.bottomUnion)),
      Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(AppImages.signinOrSignup)),
      Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150, child: AppLogo()),
              const SizedBox(height: 55),
              const Text("Enjoy Listening to Music",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 28),
              const Text(
                "DivaTone is a proprietary Swedish audio streaming and media services provider",
                style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff797979),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 70,
                          width: 180,
                          child: CustomElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routing.signUpView);
                              },
                              title: "Register",
                              height: 20)),
                      CustomTextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routing.signInView),
                        title: "Sign in",
                      ),
                    ]),
              )
            ],
          )),
    ])));
  }
}
