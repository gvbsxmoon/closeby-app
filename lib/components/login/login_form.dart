import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/controller/login_controller.dart';

import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with FormValidator {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();

  bool _obscureTextPrimary = true;
  bool _obscureTextSecondary = true;

  bool _isRegistered = false;
  bool _isEmailSubmitted = false;

  String _email = "";
  String _password = "";
  String _firstName = "";
  String _lastName = "";

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
        onChanged: (v) => setState(() {
          _password = v;
        }),
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
          hintText: 'name'.tr,
          onChanged: (v) => setState(() {
            _firstName = v;
          }),
          validator: (v) => validate(v, 'name'.tr),
        ),
        const SizedBox(height: 16),
        CBTextField(
          hintText: 'surname'.tr,
          onChanged: (v) => setState(() {
            _lastName = v;
          }),
          validator: (v) => validate(v, 'surname'.tr),
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
          validator: (v) => validatePassword(v),
        ),
        const SizedBox(height: 16),
        CBTextField(
          hintText: 'confirm_pass'.tr,
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
          validator: (v) => validateMatch(v, _password, "Passwords"),
        ),
      ],
    );
  }

  void _checkEmailOnSubmit() async {
    if (_formKey.currentState!.validate()) {
      _isEmailSubmitted = true;

      try {
        final isRegistered = await widget.controller.checkEmail(_email);
        setState(() {
          _isRegistered = isRegistered;
        });
      } catch (err) {
        print(err);
      }

      _formKey.currentState!.reset();
    }
  }

  void _loginOnSubmit() async {
    print('sono nella login on prima del current state...');


    if (_formKey.currentState!.validate()) {
      print('sono nella login on submit...');

      try {
        print('sono nella try on submit... $_isRegistered');

        _isRegistered
            ? await widget.controller.signIn(_email, _password)
            : await widget.controller
                .signUp(_firstName, _lastName, _email, _password);

        print('sono nella login on submit...');
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      header: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Center(
            child: Text(
              'email_button'.tr,
              style: AppFonts.figtree(fontSize: 14),
            ),
          ),
          CBRoundedButton(
            leftMargin: true,
            onTap: () => Get.back(),
            icon: FontAwesomeIcons.chevronLeft,
          )
        ],
      ),
      footer: const SizedBox(),
      child: _buildLoginForm(),
    );
  }

  Padding _buildLoginForm() {
    return Padding(
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
                  onChanged: (v) => setState(() {
                    _email = v;
                  }),
                  validator: (v) => validateEmail(v),
                  keyboardType: TextInputType.emailAddress,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                  child: Text(
                    'banner'.tr,
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
                  ? 'login'.tr
                  : _isEmailSubmitted
                      ? 'signup'.tr
                      : 'continue'.tr,
              onTap: _isEmailSubmitted ? _loginOnSubmit : _checkEmailOnSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
