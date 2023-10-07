import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CBUserCard extends StatelessWidget {
  const CBUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: ShapeDecoration(
        color: AppColor.offWhite,
        shadows: AppShadow.darkShadow,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 32,
            cornerSmoothing: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        width: 88,
                        height: 88,
                        'assets/luca.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        boxShadow: AppShadow.darkShadow,
                        color: AppColor.lightRebeccaPurple,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        FontAwesomeIcons.shieldHeart,
                        size: 14,
                        color: AppColor.offWhite,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Luca",
                  style: AppFonts.figtree(
                      fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3",
                  style: AppFonts.figtree(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Recensioni",
                  style: AppFonts.figtree(fontSize: 10),
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.lightRebeccaPurple,
                ),
                Text(
                  "6",
                  style: AppFonts.figtree(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Mesi su CloseBy",
                  style: AppFonts.figtree(fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
