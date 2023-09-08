import 'package:closeby/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navbar extends StatelessWidget {
  const Navbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'navbar',
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(top: 16.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColor.lightGrey, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <NavbarItem>[
            NavbarItem(
              icon: FontAwesomeIcons.magnifyingGlass,
              label: 'Explore',
              route: '/',
            ),
            NavbarItem(
              icon: FontAwesomeIcons.heart,
              label: 'Favorites',
              route: '/favorites',
            ),
            NavbarItem(
              icon: FontAwesomeIcons.circleUser,
              label: 'Profile',
              route: '/profile',
            ),
          ],
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
      onTap: () => context.go(route),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Icon(
              icon,
              color: ModalRoute.of(context)!.settings.name == route
                  ? AppColor.rebeccaPurple
                  : AppColor.darkGrey,
            ),
          ),
          Text(
            label,
            style: AppFonts.figtree(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.secondaryBlack,
            ),
          )
        ],
      ),
    );
  }
}
