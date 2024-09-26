import 'package:diva_tone/core/components/widgets/custom_app_bar.dart';
import 'package:diva_tone/core/components/widgets/custom_button.dart';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:diva_tone/core/utils/app_images.dart';
import 'package:diva_tone/features/onboarding/presentation/view/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routing.dart';
import 'widgets/Custom_text_switch.dart';
import 'widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: CustomLogo()),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Register",
                    style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomTextFormField(hintTxt: "full Name"),
              const SizedBox(height: 20),
              const CustomTextFormField(hintTxt: "Email"),
              const SizedBox(height: 21),
              const CustomTextFormField(hintTxt: "Password"),
              const SizedBox(height: 21),
              CustomElevatedButton(title: "Create Account", onPressed: () {}),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          AppImages.google,
                        )),
                  ),
                  GestureDetector(
                    child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset(AppImages.facebook)),
                  ),
                ],
              ),
              CustomTextHasAnEmail(
                btnTxt: "sign In",
                txt: "Do You Have an Account?",
                onPressed: () =>
                    Navigator.pushNamed(context, Routing.signInView),
              )
            ],
          ),
        ),
      ),
    );
  }
}
