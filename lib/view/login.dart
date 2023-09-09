import 'package:closeby/components/cb-components/separator.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/profile/profile_buttons.dart';
import 'package:closeby/components/profile/profile_signin.dart';
import 'package:closeby/components/profile/profile_signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _signState = true;

  void _toggleState() {
    setState(() {
      _signState = !_signState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      margin: true,
      title: "Profile",
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: ProfileSignIn(
                onSignUp: _toggleState,
              ),
              secondChild: ProfileSignUp(
                onSignIn: _toggleState,
              ),
              crossFadeState: _signState
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            const CBSeparator(),
            const ProfileSignServiceButtons()
          ],
        ),
      ),
    );
  }
}
