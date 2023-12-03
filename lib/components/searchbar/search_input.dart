import 'package:closeby/components/cb-components/button.dart';
import 'package:closeby/components/cb-components/datepicker.dart';
import 'package:closeby/components/cb-components/wrapper.dart';
import 'package:closeby/components/cb-navigation/footer.dart';
import 'package:closeby/controller/searchbar_controller.dart';
import 'package:closeby/utils/fonts.dart';
import 'package:flutter/material.dart';

import 'package:closeby/components/cb-components/card.dart';
import 'package:closeby/components/cb-components/chips.dart';

import 'package:closeby/components/cb-components/rounded_button.dart';
import 'package:closeby/components/searchbar/search_date_section.dart';
import 'package:closeby/components/searchbar/search_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

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
    final datePickerRange = await showCBDatePicker(context);

    if (datePickerRange != null) controller.onDateSelected(datePickerRange);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CBWrapper(
          header: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: CBRoundedButton(
              onTap: () => Get.back(),
              icon: FontAwesomeIcons.xmark,
            ),
          ),
          footer: CBFooter(
            leftWidget: TextButton(
              onPressed: () => controller.onSearchbarClear(),
              child: Text(
                'clear'.tr,
                style: AppFonts.figtree()
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
            rightWidget: CBButton(
              label: 'search'.tr,
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () => Get.back(),
            ),
          ),
          child: searchbarSections(),
        ));
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
              isExpanded: controller.model.isPlaceExpanded,
              title: 'where'.tr,
              selected: controller.model.selectedPlace,
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
            const Gap(16),
            SearchSection(
              isExpanded: controller.model.isGoodExpanded,
              title: 'what'.tr,
              selected: controller.model.selectedGood,
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
              title: 'when'.tr,
              selected: controller.model.selectedDate,
              onTap: openDatePicker,
            ),
          ],
        ),
      ),
    );
  }
}
