import 'package:closeby/model/observable/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void _onPressed() {
    LoginModel().isLogged = false;
    Get.toNamed('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         TextButton(
            onPressed: _onPressed,
            child: const Text('Log out per dio'),
          ),
      ],
    );
  }
}
