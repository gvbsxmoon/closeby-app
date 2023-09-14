import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/controller/login_controller.dart';

import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  final RegExp _emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  bool _obscureTextPrimary = true;
  bool _obscureTextSecondary = true;

  bool _isRegistered = false;
  bool _isEmailSubmitted = false;

  @override
  void initState() {
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget _buildAlreadySignedUp() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: CBTextField(
        hintText: "Password",
        obscureText: _obscureTextPrimary,
        showEye: true,
        showPassword: () {
          setState(() {
            _obscureTextPrimary = !_obscureTextPrimary;
          });
        },
        onChanged: (v) => widget.controller.model.user.password = v,
        inputFormatters: [
          FilteringTextInputFormatter.deny(
            RegExp(r'\s'),
          ),
        ],
      ),
    );
  }

  Widget _buildNotSignedUp() {
    return Column(
      children: [
        CBTextField(
          hintText: "Full name",
          onChanged: (v) => widget.controller.model.user.fullName = v,
          validator: (value) {
            if (value != null && value.isEmpty) {
              return 'Full name is required';
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
          onChanged: (v) => widget.controller.model.user.password = v,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'\s'),
            ),
          ],
          validator: (value) {
            if (value != null && value.isEmpty ||
                value != null && value.isNotEmpty && value.length < 8) {
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
          inputFormatters: [
            FilteringTextInputFormatter.deny(
              RegExp(r'\s'),
            ),
          ],
          validator: (value) {
            if (value != widget.controller.model.user.password) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  void _onSubmit() {
    //TODO: add api call
    if (_formKey.currentState!.validate()) {
      print("form validated");

      if (!_isEmailSubmitted) {
        setState(() {
          _isEmailSubmitted = true;
          //_isregistered should be setted by the api
          _isRegistered = false;
        });
      } else {
        // sign up sign in
        print(
            "${widget.controller.model.user.email} -- ${widget.controller.model.user.password}");
      }

      _formKey.currentState!.reset();
    } else {
      print("form not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Continue with email",
          style: AppFonts.figtree(fontSize: 14),
        ),
        backgroundColor: AppColor.offWhite,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 18,
            color: AppColor.primaryBlack,
          ),
          onPressed: () => Get.back(),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CBTextField(
                    hintText: "Email",
                    focusNode: _focusNode,
                    onChanged: (v) =>
                        widget.controller.model.user.email = v,
                    validator: (value) {
                      if (value != null && value.isEmpty ||
                          !_emailRegex.hasMatch(value!)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    child: Text(
                      "Enter the email with which you are signed in or the one with which you intend to sign up.",
                      style: AppFonts.figtree(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.secondaryBlack),
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: _buildAlreadySignedUp(),
                    secondChild:
                        _isEmailSubmitted ? _buildNotSignedUp() : Container(),
                    crossFadeState: _isRegistered
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 150),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: CBButton(
                expanded: true,
                label: _isRegistered
                    ? "Log in"
                    : _isEmailSubmitted
                        ? "Sign up"
                        : "Continue",
                onTap: _onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
