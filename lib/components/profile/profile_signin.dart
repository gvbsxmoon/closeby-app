import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/text_button.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileSignIn extends StatefulWidget {
  const ProfileSignIn({
    super.key,
    required this.onSignUp,
  });

  final Function() onSignUp;

  @override
  State<ProfileSignIn> createState() => _ProfileSignInState();
}

class _ProfileSignInState extends State<ProfileSignIn> {
  final _formKey = GlobalKey<FormState>();
  final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String _email = "";
  String _password = "";

  bool _obscureText = true;

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print(_email + " " + _password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColor.rebeccaPurple,
          content: Text(
            "Logging in...",
            style: AppFonts.figtree(color: AppColor.offWhite),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Log in to see your profile",
          style: AppFonts.figtree(fontSize: 24),
        ),
        const SizedBox(height: 32),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CBTextField(
                hintText: "Email",
                onChanged: (v) => setState(() {
                  _email = v;
                }),
                validator: (value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      !_emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CBTextField(
                hintText: "Password",
                obscureText: _obscureText,
                showEye: true,
                showPassword: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                onChanged: (v) => setState(() {
                  _password = v;
                }),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(r'\s'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      "Don't have an account?",
                      style: AppFonts.figtree(
                          color: AppColor.secondaryBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(width: 4),
                  CBTextButton(onPressed: widget.onSignUp, label: "Sign up"),
                ],
              ),
              const SizedBox(height: 32),
              CBButton(expanded: true, label: "Log in", onTap: _onSubmit)
            ],
          ),
        )
      ],
    );
  }
}
