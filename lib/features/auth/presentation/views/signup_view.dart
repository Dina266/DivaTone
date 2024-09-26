import 'package:diva_tone/core/helpers/is_dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/widgets/custom_app_bar.dart';
import '../../../../core/components/widgets/custom_button.dart';
import '../../../../core/routes/routing.dart';
import '../../../onboarding/presentation/view/widgets/custom_logo.dart';
import '../view_model/auth_cubit.dart';
import 'widgets/Custom_text_switch.dart';
import 'widgets/custom_text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String userName, email, password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        
        return Scaffold(
          appBar: const CustomAppBar(title: CustomLogo()),
          body: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text("Register",
                        style: TextStyle(
                          color:
                              context.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 40),
                  CustomTextFormField(
                    hintTxt: "full Name",
                    onSaved: (value) {
                      setState(() {
                        userName = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintTxt: "Email",
                    onSaved: (value) {
                      setState(() {
                        email = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 21),
                  CustomTextFormField(
                    hintTxt: "Password",
                    onSaved: (value) {
                      setState(() {
                        password = value!;
                      });
                    },
                    suffixIcon: Icons.remove_red_eye_outlined,
                  ),
                  const SizedBox(height: 21),
                  CustomElevatedButton(
                    title: "Create Account",
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        BlocProvider.of<AuthCubit>(context).createUserWithEmailAndPassword(email: email, password: password, name: userName);
                        Navigator.pushNamed(context, Routing.signInView);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomTextHasAnEmail(
                    btnTxt: "Sign In",
                    txt: "Do You Have an Account?",
                    onPressed: () =>
                        Navigator.pushNamed(context, Routing.signInView),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
