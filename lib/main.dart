import 'package:closeby/components/searchbar/searchbar.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        color: AppColor.offWhite,
        child: const SafeArea(
          child: Searchbar(),
        ),
      )),
    );
  }
}
