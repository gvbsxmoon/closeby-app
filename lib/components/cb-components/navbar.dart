import 'package:closeby/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

class CBNavbar extends StatefulWidget {
  const CBNavbar({
    super.key,
  });

  @override
  State<CBNavbar> createState() => _CBNavbarState();
}

class _CBNavbarState extends State<CBNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColor.lightGrey, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0,
        enableFeedback: true,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.rebeccaPurple,
        unselectedIconTheme: IconThemeData(color: AppColor.darkGrey),
        backgroundColor: AppColor.offWhite,
        onTap: _onItemTapped,
        unselectedLabelStyle: AppFonts.figtree(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        selectedLabelStyle:
            AppFonts.figtree(fontSize: 12, fontWeight: FontWeight.w600),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(FontAwesomeIcons.magnifyingGlass),
            ),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(FontAwesomeIcons.heart),
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 4.0),
              child: Icon(FontAwesomeIcons.circleUser),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
