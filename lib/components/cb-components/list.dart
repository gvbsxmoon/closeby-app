import 'package:closeby/components/cb-components/divider.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CBList extends StatelessWidget {
  const CBList({
    super.key,
    required this.listTitle,
    required this.listOptions,
  });

  final String listTitle;
  final List<CBListOptions> listOptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            listTitle,
            style: AppFonts.figtree(fontSize: 18),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: listOptions
                .map(
                  (e) =>
                      CBListTile(onTap: e.onTap, icon: e.icon, label: e.label),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class CBListOptions {
  late Function() onTap;
  late IconData icon;
  late String label;

  CBListOptions(this.onTap, this.icon, this.label);
}

class CBListTile extends StatelessWidget {
  const CBListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
  });

  final Function() onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 18,
                      color: AppColor.secondaryBlack,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      label,
                      style: AppFonts.figtree(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  size: 14,
                  color: AppColor.secondaryBlack,
                ),
              ],
            ),
          ),
        ),
        const CBDivider(
          expanded: true,
          thin: true,
        )
      ],
    );
  }
}
