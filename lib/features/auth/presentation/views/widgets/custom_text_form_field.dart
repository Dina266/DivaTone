
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintTxt,
    this.suffixIcon,
    this.onSaved,
  });
  final String hintTxt;
  final IconData? suffixIcon;
  final void Function(String?)? onSaved;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
            onSaved: widget.onSaved,
            obscureText: widget.suffixIcon != null ? isSecure : false,
      decoration: InputDecoration(
        hintText: widget.hintTxt,
        suffixIcon: widget.suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecure = !isSecure;
                          });
                        },
                        icon: Icon(
                          isSecure ? Icons.visibility_off : widget.suffixIcon,
                        ),
                        color: Colors.black,
                      ),
                    )
                  : SizedBox(),
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }
}
