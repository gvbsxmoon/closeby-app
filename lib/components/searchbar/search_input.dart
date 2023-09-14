import 'package:closeby/controller/searchbar_controller.dart';
import 'package:closeby/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/components/cb-components/chips.dart';

import 'package:closeby/components/searchbar/search_close.dart';
import 'package:closeby/components/searchbar/search_date_section.dart';
import 'package:closeby/components/searchbar/search_datepicker.dart';
import 'package:closeby/components/searchbar/search_footer.dart';
import 'package:closeby/components/searchbar/search_section.dart';

import 'package:get/get.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput>
    with SingleTickerProviderStateMixin {
  final SearchbarController controller = Get.put(SearchbarController());

  List<String> places = ["Milan", "Rome", "Turin", "Naples"];

  List<String> goods = [
    "Garage",
    "Box",
    "Open spaces",
    "Professional spaces",
    "Basement",
    "Ceiling"
  ];

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> openDatePicker() async {
    final datePickerRange = await searchDatePickerRange(context);

    if (datePickerRange != null) controller.onDateSelected(datePickerRange);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.offWhite,
          foregroundColor: AppColor.primaryBlack,
          leading: SearchClose(onTap: () => Get.back()),
          elevation: 0,
        ),
        body: searchbarSections(),
        bottomNavigationBar: SearchFooter(
          onSearch: () => Get.back(),
          onClear: () => controller.onSearchbarClear(),
        ),
      ),
    );
  }

  AnimatedBuilder searchbarSections() {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            SearchSection(
              isExpanded: controller.model.isPlaceExpanded.value,
              title: 'Where to?',
              selected: controller.model.selectedPlace.value,
              onTap: () => controller.onPlaceExpanded(),
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
                        onTap: () =>
                            controller.onPlaceSelected(index, places[index]),
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
              isExpanded: controller.model.isGoodExpanded.value,
              title: 'What?',
              selected: controller.model.selectedGood.value,
              onTap: () => controller.onGoodExpanded(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  runSpacing: 12,
                  spacing: 12,
                  children: goods
                      .map(
                        (e) => GestureDetector(
                          onTap: () => controller.onGoodSelected(
                              goods.indexOf(e), e, openDatePicker),
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
              selected: controller.model.selectedDate.value,
              onTap: openDatePicker,
            ),
          ],
        ),
      ),
    );
  }
}
