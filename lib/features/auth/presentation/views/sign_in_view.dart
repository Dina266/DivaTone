import 'dart:developer';
import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/widgets/custom_app_bar.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/routes/routing.dart';
import '../../../../core/utils/app_images.dart';
import '../../../onboarding/presentation/view/widgets/custom_logo.dart';
import '../view_model/auth_cubit.dart';
import 'widgets/Custom_text_switch.dart';
import 'widgets/custom_text_form_field.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: CustomLogo()),
        body: Form(
          key: formkey,
          child: Padding(
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
                CustomTextFormField(
                  hintTxt: "Enter Username Or Email",
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                CustomTextFormField(
                    hintTxt: "Password",
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                    suffixIcon: Icons.remove_red_eye),
                const SizedBox(height: 21),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      title: "Sign In",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context).loginWithEmailAndPassword(email: email, password: password);
                          log("logged in ");
                          Navigator.pushNamed(context, Routing.homeView);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                        setState(() {});
                      },
                    );
                  },
                ),
                const SizedBox(height: 21),
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
                const SizedBox(height: 80),
                CustomTextHasAnEmail(
                  btnTxt: "Register Now",
                  txt: "Not a Member?",
                  onPressed: () =>
                      Navigator.pushNamed(context, Routing.signUpView),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
