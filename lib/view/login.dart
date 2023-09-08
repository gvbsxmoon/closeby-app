import 'package:closeby/components/navbar.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ciao'),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
