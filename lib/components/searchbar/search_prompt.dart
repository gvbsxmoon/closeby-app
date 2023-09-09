import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPrompt extends StatefulWidget {
  const SearchPrompt(
      {super.key, required this.place, required this.good, required this.date});

  final String place;
  final String good;
  final String date;

  @override
  State<SearchPrompt> createState() => _SearchPromptState();
}

class _SearchPromptState extends State<SearchPrompt> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
      child: Container(
        padding:
            const EdgeInsets.only(left: 20.0, right: 10, bottom: 12, top: 12),
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.lightGrey),
            borderRadius: BorderRadius.circular(36),
            boxShadow: AppShadow.darkShadow),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.good == 'Anything'
                      ? 'What are you looking for?'
                      : widget.good,
                  style: AppFonts.figtree(),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${widget.place} · ${widget.date}',
                  style: AppFonts.figtree(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColor.secondaryBlack),
                )
              ],
            ),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColor.darkGrey, width: 1),
              ),
              child: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
