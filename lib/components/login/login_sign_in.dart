/* import 'package:closeby/controller/login_controller.dart';
import 'package:closeby/utils/mixins.dart';
import 'package:flutter/material.dart';

class LoginSignIn extends StatefulWidget {
  const LoginSignIn({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  State<LoginSignIn> createState() => _LoginSignInState();
}

class _LoginSignInState extends State<LoginSignIn> with FormValidator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _obscureText = true;

  bool _isRegistered = false;

  String _email = "";
  String _password = "";

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
        final isRegistered = await widget.controller.checkEmail(_email);

        setState(() {
          _isRegistered = isRegistered;

          if (isRegistered) {
            _emailFocusNode.unfocus();
            Future.delayed(const Duration(milliseconds: 100),
                () => {_passwordFocusNode.requestFocus()});
          } else {
            _pageController.nextPage(
                duration: const Duration(milliseconds: 150),
                curve: Curves.bounceIn);
          }
        });
      } catch (err) {
        //setuppare e mostrare messaggio di errore
        print(err);
      }
    }
  }

  void _signIn() async {
    try {
      await widget.controller.signIn(
        _email,
        _password,
      );
    } catch (err) {
      //setuppare e mostrare messaggio di errore
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                secondChild: Padding(
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
    ;
  }
}
 */