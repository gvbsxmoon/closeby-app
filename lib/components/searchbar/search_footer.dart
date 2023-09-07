import "package:closeby/components/cb-components/button.dart";
import "package:closeby/utils/colors.dart";
import "package:closeby/utils/fonts.dart";
import "package:closeby/utils/shadow.dart";
import "package:flutter/material.dart";

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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
          boxShadow: AppShadow.topShadow,
          gradient: LinearGradient(
            colors: [AppColor.offWhite, Colors.white],
            stops: const [0, 1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          )),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                onClear();
              },
              child: Text(
                'Clear all',
                style: AppFonts.figtree(fontSize: 16),
              ),
            ),
            CBButton(
                title: 'Search',
                searchIcon: true,
                onTap: () {
                  onSearch();
                }),
          ]),
    );
  }
}
