import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/components/searchbar/search_section.dart';
import 'package:closeby/components/cb-components/chips.dart';
import 'package:closeby/controller/searchbar_controller.dart';

import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final SearchbarController controller = SearchbarController();

  List<String> places = ["Milano", "Roma", "Torino", "Napoli"];

  List<String> goods = [
    "Garage",
    "Box",
    "Open spaces",
    "Spazi professionali",
    "Seminterrato",
    "Soffitta"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SearchSection(
            isExpanded: controller.model.isPlaceExpanded,
            title: 'Where to?',
            selected: controller.model.selectedPlace,
            callback: () {
              setState(() {
                controller.onPlaceExpanded();
              });
            },
            child: SizedBox(
              height: 145,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: places.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.0, right: index == places.length - 1 ? 20.0 : 0.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.onPlaceSelected(places[index]);
                        });
                      },
                      child: CBCard(
                          isSelected:
                              controller.model.selectedPlaceIndex == index,
                          title: places[index],
                          asset: 'assets/places/${places[index]}.png'),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          SearchSection(
            isExpanded: controller.model.isGoodExpanded,
            title: 'What?',
            selected: controller.model.selectedGood,
            callback: () {
              setState(() {
                controller.onGoodExpanded();
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                runSpacing: 12,
                spacing: 12,
                children: goods
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.onGoodSelected(goods.indexOf(e), e);
                          });
                        },
                        child: CBChips(
                          isSelected: controller.model.selectedGoodIndex ==
                              goods.indexOf(e),
                          title: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
