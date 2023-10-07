import 'package:closeby/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'navbar',
      child: Container(
          padding: const EdgeInsets.only(top: 16.0),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: AppColor.lightGrey, width: 1),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <NavbarItem>[
                NavbarItem(
                  icon: FontAwesomeIcons.magnifyingGlass,
                  label: 'explore'.tr,
                  route: '/',
                ),
                NavbarItem(
                  icon: FontAwesomeIcons.heart,
                  label: 'favorites'.tr,
                  route: '/favorites',
                ),
                NavbarItem(
                  icon: FontAwesomeIcons.circleUser,
                  label: 'profile'.tr,
                  route: '/profile',
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(route),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Icon(
              icon,
              size: 18,
              color: ModalRoute.of(context)?.settings.name == route
                  ? AppColor.rebeccaPurple
                  : AppColor.darkGrey,
            ),
          ),
          Text(
            label,
            style: AppFonts.figtree(
              fontSize: 12,
              color: AppColor.secondaryBlack,
            ),
          )
        ],
      ),
    );
  }
}
