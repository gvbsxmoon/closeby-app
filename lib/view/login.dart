import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/login/login_buttons.dart';
import 'package:closeby/components/login/login_card.dart';
import 'package:closeby/controller/login_controller.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return CBWrapper(
      title: "Profile",
      subtitle: "Welcome to Closeby",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 48),
            child: LoginCard(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LoginSignServiceButtons(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
