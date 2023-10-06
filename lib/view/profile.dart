import 'package:closeby/model/observable/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void _onPressed() {
    setState(() {
      LoginModel().isLogged = false;
      Get.toNamed('/profile');
    });
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
