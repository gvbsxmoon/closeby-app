import "package:closeby/components/cb-components/button.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";

class SearchFooter extends StatelessWidget {
  const SearchFooter({
    super.key,
    required this.onSearch,
    required this.onClear,
  });

  final Function() onSearch;
  final Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColor.lightGrey, width: 1)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onClear,
              child: Text(
                'Clear all',
                style:
                    AppFonts.figtree()
                        .copyWith(decoration: TextDecoration.underline),
              ),
            ),
            CBButton(
              label: 'Search',
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: onSearch,
            ),
          ]),
    );
  }
}
