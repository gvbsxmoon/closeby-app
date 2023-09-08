import 'package:flutter/material.dart';

import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/components/cb-components/chips.dart';

import 'package:closeby/components/searchbar/search_close.dart';
import 'package:closeby/components/searchbar/search_date_section.dart';
import 'package:closeby/components/searchbar/search_datepicker.dart';
import 'package:closeby/components/searchbar/search_footer.dart';
import 'package:closeby/components/searchbar/search_prompt.dart';
import 'package:closeby/components/searchbar/search_section.dart';

import 'package:closeby/controller/searchbar_controller.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final SearchbarController controller = SearchbarController();

  List<String> places = ["Milan", "Rome", "Turin", "Naples"];

  List<String> goods = [
    "Garage",
    "Box",
    "Open spaces",
    "Professional spaces",
    "Basement",
    "Ceiling"
  ];

  Future<void> openDatePicker() async {
    final datePickerRange = await searchDatePickerRange(context);

    if (datePickerRange != null) {
      setState(() {
        controller.onDateSelected(datePickerRange);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstChild: searchbarInit(),
        secondChild: searchbarSections(),
        crossFadeState: controller.model.state
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
      ),
    );
  }

  GestureDetector searchbarInit() {
    return GestureDetector(
      onTap: () {
        setState(() {
          controller.onSearchbarOpen();
        });
      },
      child: SearchPrompt(
        place: controller.model.selectedPlace,
        good: controller.model.selectedGood,
        date: controller.model.selectedDate,
      ),
    );
  }

  Column searchbarSections() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchClose(
              onTap: () {
                setState(() {
                  controller.onSearchbarClose();
                });
              },
            ),
            SearchSection(
              isExpanded: controller.model.isPlaceExpanded,
              title: 'Where to?',
              selected: controller.model.selectedPlace,
              onTap: () {
                setState(() {
                  controller.onPlaceExpanded();
                });
              },
              child: SizedBox(
                height: 152,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        right: index == places.length - 1 ? 20.0 : 0.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.onPlaceSelected(index, places[index]);
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
              height: 16,
            ),
            SearchSection(
              isExpanded: controller.model.isGoodExpanded,
              title: 'What?',
              selected: controller.model.selectedGood,
              onTap: () {
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
                              controller.onGoodSelected(
                                  goods.indexOf(e), e, openDatePicker);
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
            const SizedBox(
              height: 16,
            ),
            SearchDateSection(
              title: 'When?',
              selected: controller.model.selectedDate,
              onTap: openDatePicker,
            ),
          ],
        ),
        SearchFooter(
          onSearch: () {
            setState(() {
              controller.onSearchbarClose();
            });
          },
          onClear: () {
            setState(() {
              controller.onSearchbarClear();
            });
          },
        ),
      ],
    );
  }
}
