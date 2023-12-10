import 'package:closeby/controller/navigation_controller.dart';
import 'package:closeby/model/observable/login_model.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
                route: '/explore',
              ),
              NavbarItem(
                icon: FontAwesomeIcons.heart,
                label: 'favorites'.tr,
                route: '/favorites',
              ),
              NavbarItem(
                icon: FontAwesomeIcons.message,
                label: 'messages'.tr,
                route: '/',
                disabled: true,
              ),
              NavbarItem(
                icon: FontAwesomeIcons.circleUser,
                label: LoginModel().isLogged ? 'profile'.tr : 'login'.tr,
                route: LoginModel().isLogged ? '/profile' : '/login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavbarItem extends StatelessWidget {
  NavbarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.route,
    this.disabled = false,
  });

  final IconData icon;
  final String label;
  final String route;
  final bool disabled;

  final NavigationController _controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => disabled ? null : _controller.navigate(route: route),
      child: Column(
        children: [
          Icon(
            icon,
            size: 18,
            color: _controller.model.route == route
                ? AppColor.rebeccaPurple
                : AppColor.darkGrey,
          ),
          const Gap(8),
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
