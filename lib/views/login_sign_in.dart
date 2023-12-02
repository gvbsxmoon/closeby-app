import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/snackbar.dart';
import 'package:closeby/components/cb-components/text_button.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_header.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/mixins.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginSignIn extends StatefulWidget {
  const LoginSignIn({
    super.key,
  });

  @override
  State<LoginSignIn> createState() => _LoginSignInState();
}

class _LoginSignInState extends State<LoginSignIn> with FormValidator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final LoginController _controller = Get.put(LoginController());

  bool _obscureText = true;

  bool _isRegistered = false;

  String _email = "";
  String _password = "";

  String _errorMessage = "";

  @override
  void initState() {
    _emailFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _checkEmail() async {
    if (_formKey.currentState!.validate()) {
      try {
        final isRegistered = await _controller.checkEmail(_email);

        setState(() {
          _isRegistered = isRegistered;

          if (isRegistered) {
            _emailFocusNode.unfocus();
            Future.delayed(
              const Duration(milliseconds: 100),
              () {
                _passwordFocusNode.requestFocus();
              },
            );
          } else {
            Get.toNamed('login/signup');
          }
        });
      } catch (err) {
        if (context.mounted) {
          showCBSnackbar(context, err.toString());
        }
      }
    }
  }

  void _signIn() async {
    try {
      await _controller.signIn(
        _email,
        _password,
      );
    } catch (err) {
      if (context.mounted) {
        showCBSnackbar(context, err.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      header: const LoginHeader(),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildSignInForm(),
      ),
    );
  }

  Column _buildSignInForm() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CBTextField(
                hintText: "Email",
                focusNode: _emailFocusNode,
                onChanged: (v) => setState(() {
                  _email = v;
                }),
                validator: (v) => validateEmail(v),
                keyboardType: TextInputType.emailAddress,
              ),
              AnimatedCrossFade(
                firstChild: Padding(
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
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: CBTextField(
                        hintText: "Password",
                        obscureText: _obscureText,
                        focusNode: _passwordFocusNode,
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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, right: 4),
                      child: CBTextButton(
                        onPressed: () {},
                        label: 'forgot_password'.tr,
                      ),
                    ),
                  ],
                ),
                crossFadeState: _isRegistered
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 150),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: CBButton(
            expanded: true,
            label: _isRegistered ? 'login'.tr : 'continue'.tr,
            onTap: _isRegistered ? _signIn : _checkEmail,
          ),
        ),
      ],
    );
  }
}
