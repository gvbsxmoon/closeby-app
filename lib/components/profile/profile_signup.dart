import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileSignUp extends StatefulWidget {
  const ProfileSignUp({
    super.key,
    required this.onSignIn,
  });

  final Function() onSignIn;

  @override
  State<ProfileSignUp> createState() => _ProfileSignUpState();
}

class _ProfileSignUpState extends State<ProfileSignUp> {
  final _formKey = GlobalKey<FormState>();
  final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  String _fullName = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";

  bool _obscureTextPrimary = true;
  bool _obscureTextSecondary = true;

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      print(
          _fullName + " " + _email + " " + _password + " " + _confirmPassword);
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
          "Become a member!",
          style: AppFonts.figtree(fontSize: 24),
        ),
        const SizedBox(height: 32),
        Form(
          key: _formKey,
          child: Column(
            children: [
              CBTextField(
                hintText: "Full name",
                onChanged: (v) => setState(() {
                  _fullName = v;
                }),
              ),
              const SizedBox(height: 16),
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
                obscureText: _obscureTextPrimary,
                showEye: true,
                showPassword: () {
                  setState(() {
                    _obscureTextPrimary = !_obscureTextPrimary;
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
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CBTextField(
                hintText: "Confirm password",
                obscureText: _obscureTextSecondary,
                showEye: true,
                showPassword: () {
                  setState(() {
                    _obscureTextSecondary = !_obscureTextSecondary;
                  });
                },
                onChanged: (v) => setState(() {
                  _confirmPassword = v;
                }),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(r'\s'),
                  ),
                ],
                validator: (value) {
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Row(
                  children: [
                    Text(
                      'Already a member?',
                      style: AppFonts.figtree(
                          color: AppColor.secondaryBlack,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: widget.onSignIn,
                      child: Text(
                        'Sign in',
                        style: AppFonts.figtree(color: AppColor.rebeccaPurple),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              CBButton(expanded: true, label: "Sign up", onTap: _onSubmit)
            ],
          ),
        )
      ],
    );
  }
}
