import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/utils/colors.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:closeby/utils/shadow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  double containerHeight = 54;
  double verticalPadding = 9;
  double borderRadius = 36;

  bool isExpanded = false;

  void _toggleContainerHeight() {
    setState(() {
      containerHeight = containerHeight == 54 ? 245 : 54;
      borderRadius = borderRadius == 36 ? 24 : 36;
    });

    if (isExpanded) {
      verticalPadding = verticalPadding == 9 ? 20 : 9;
      isExpanded = !isExpanded;
    } else {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          verticalPadding = verticalPadding == 9 ? 20 : 9;
          isExpanded = !isExpanded;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleContainerHeight,
      child: AnimatedContainer(
          alignment: Alignment.topLeft,
          duration: const Duration(milliseconds: 300), // Animation duration
          width: MediaQuery.of(context).size.width,
          height: containerHeight, // Use the dynamic height
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          decoration: BoxDecoration(
              color: AppColor.offWhite,
              border: Border.all(color: AppColor.lightGrey),
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow:
                  isExpanded ? AppShadow.darkShadow : AppShadow.lightShadow),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 150),
            firstChild: const SearchInit(),
            secondChild: const SearchInputs(),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          )),
    );
  }
}

class SearchInputs extends StatefulWidget {
  const SearchInputs({
    super.key,
  });

  @override
  State<SearchInputs> createState() => _SearchInputsState();
}

class _SearchInputsState extends State<SearchInputs> {
  List<String> places = ["Milano", "Roma", "Torino", "Napoli"];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Where to?',
              textAlign: TextAlign.left,
              style: AppFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CBCard(
                        isSelected: selectedIndex == index,
                        title: places[index],
                        asset: 'assets/places/${places[index]}.png'),
                  ),
                );
              },
            ),
          ),
        ]);
  }
}

class SearchInit extends StatelessWidget {
  const SearchInit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'What are you looking for?',
                style: AppFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Anywhere · Anything',
                style: AppFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColor.secondaryBlack),
              )
            ],
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.darkGrey, width: 1),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
