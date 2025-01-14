import 'package:closeby/model/observable/searchbar_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchbarController extends GetxController {
  SearchbarModel model = SearchbarModel();

  void onPlaceSelected(int index, String selected) {
    if (index == model.selectedPlaceIndex) {
      model.selectedPlace = 'anywhere'.tr;
      model.selectedPlaceIndex = -1;
    } else {
      model.selectedPlace = selected;
      model.selectedPlaceIndex = index;
      model.isPlaceExpanded = false;
      model.isGoodExpanded = true;
    }
  }

  void onGoodSelected(int index, String selected, Function() openDatePicker) {
    if (index == model.selectedGoodIndex) {
      model.selectedGood = 'anything'.tr;
      model.selectedGoodIndex = -1;
    } else {
      model.selectedGood = selected;
      model.selectedGoodIndex = index;
      model.isGoodExpanded = false;

      Future.delayed(const Duration(milliseconds: 150), () {
        openDatePicker();
      });
    }
  }

  void onDateSelected(DateTimeRange selected) {
    model.selectedDate =
        '${DateFormat.MMMd().format(selected.start)} - ${DateFormat.MMMd().format(selected.end)}';
    if (model.isPlaceExpanded) model.isPlaceExpanded = false;
    if (model.isGoodExpanded) model.isGoodExpanded = false;
  }

  void onPlaceExpanded() {
    model.isPlaceExpanded = !model.isPlaceExpanded;
    model.isGoodExpanded = false;
  }

  void onGoodExpanded() {
    model.isGoodExpanded = !model.isGoodExpanded;
    model.isPlaceExpanded = false;
  }

  void onSearchbarClear() {
    model.isPlaceExpanded = true;
    model.isGoodExpanded = false;
    model.selectedPlace = 'anywhere'.tr;
    model.selectedPlaceIndex = -1;
    model.selectedGood = 'anything'.tr;
    model.selectedGoodIndex = -1;
    model.selectedDate = 'anytime'.tr;
  }
}
