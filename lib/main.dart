import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/components/searchbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Searchbar(),
        )),
      ),
    );
  }
}
