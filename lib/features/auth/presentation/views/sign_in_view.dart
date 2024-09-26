import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/widgets/custom_app_bar.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/routes/routing.dart';
import '../../../../core/utils/app_images.dart';
import '../../../onboarding/presentation/view/widgets/custom_logo.dart';
import 'widgets/Custom_text_switch.dart';
import 'widgets/custom_text_form_field.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                child: Text("Sign In",
                    style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              const SizedBox(
                height: 50,
              ),
              const CustomTextFormField(
                hintTxt: "Enter Username Or Email"
              ),
              const SizedBox(
                height: 20
              ),
              const SizedBox(
                height: 20
              ),
              const CustomTextFormField(hintTxt: "Password"),
              const SizedBox(
                height: 21
              ),
                            CustomElevatedButton(title: "Sign In", onPressed: () {}),
                            const SizedBox(
                height: 21
              ),
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
              const SizedBox(
                height: 80
              ),
              


                            

              CustomTextHasAnEmail(
                btnTxt: "Register Now",
                txt: "Not a Member?",
                onPressed: () => Navigator.pushNamed(context, Routing.signUpView),
              )
            ],
          ),
        ),
      ),
    );
  }
}