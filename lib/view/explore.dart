import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/text_field.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/navbar.dart';
import 'package:closeby/components/searchbar/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CBWrapper(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: CBTextField(),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
