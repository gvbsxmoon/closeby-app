import 'package:closeby/components/cb-components/navbar.dart';
import 'package:closeby/components/searchbar/searchbar.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting('en_EN', null);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: Scaffold(
          body: Container(
            color: AppColor.offWhite,
            child: const SafeArea(
              child: Searchbar(),
            ),
          ),
          bottomNavigationBar: const CBNavbar(),
        ),
      ),
    );
  }
}