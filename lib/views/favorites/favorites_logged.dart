import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class FavoritesLogged extends StatelessWidget {
  const FavoritesLogged({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FavoritesCard(
          title: "Ampio e spazioso garage in milano centrale",
          subtitle: "Garage",
          asset: 'assets/places/Milan.png',
          onTap: () {},
          editMode: false,
        ),
      ],
    );
  }
}

class FavoritesCard extends StatefulWidget {
  const FavoritesCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.asset,
    required this.onTap,
    required this.editMode,
  });

  @override
  State<FavoritesCard> createState() => _FavoritesCardState();

  final String title;
  final String subtitle;
  final String asset;
  final Function() onTap;
  final bool editMode;
}

class _FavoritesCardState extends State<FavoritesCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.editMode ? null : widget.onTap,
      child: SizedBox(
        width: 120,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shadows: AppShadow.mediumShadow,
                    shape: SmoothRectangleBorder(
                      borderRadius: SmoothBorderRadius(
                        cornerRadius: 16,
                        cornerSmoothing: 1,
                      ),
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      widget.asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    widget.title,
                    style: AppFonts.figtree(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    widget.subtitle,
                    style: AppFonts.figtree(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColor.secondaryBlack,
                    ),
                  ),
                ),
              ],
            ),
            if (widget.editMode)
              CBRoundedButton(
                margin: const EdgeInsets.only(left: 8, top: 8),
                // TODO: implement function to delete
                onTap: () {},
                icon: FontAwesomeIcons.xmark,
              ),
          ],
        ),
      ),
    );
  }
}
