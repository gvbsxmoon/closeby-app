import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/components/cb-components/chips.dart';

import 'package:closeby/components/searchbar/search_close.dart';
import 'package:closeby/components/searchbar/search_date_section.dart';
import 'package:closeby/components/searchbar/search_datepicker.dart';
import 'package:closeby/components/searchbar/search_footer.dart';
import 'package:closeby/components/searchbar/search_section.dart';

import 'package:closeby/controller/searchbar_controller.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.offWhite,
        foregroundColor: AppColor.primaryBlack,
        leading: SearchClose(onTap: () => finish(context)),
        elevation: 0,
      ),
      body: searchbarSections(),
      bottomNavigationBar: SearchFooter(
        onSearch: () {
          setState(() {
            controller.onSearchbarClose();
            finish(context);
          });
        },
        onClear: () {
          setState(() {
            controller.onSearchbarClear();
          });
        },
      ),
    );
  }

  Padding searchbarSections() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        children: [
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
                      left: 24.0,
                      right: index == places.length - 1 ? 24.0 : 0.0,
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
    );
  }
}
