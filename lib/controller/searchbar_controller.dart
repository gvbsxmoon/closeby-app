import 'package:closeby/model/searchbar_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchbarController extends GetxController {
  SearchbarModel model = SearchbarModel();

  void onPlaceSelected(int index, String selected) {
    if (index == model.selectedPlaceIndex) {
      model.selectedPlace.value = 'Anywhere';
      model.selectedPlaceIndex = -1;
      update();
    } else {
      model.selectedPlace.value = selected;
      model.selectedPlaceIndex = index;
      model.isPlaceExpanded.value = false;
      model.isGoodExpanded.value = true;
      update();
    }
  }

  void onGoodSelected(int index, String selected, Function() openDatePicker) {
    if (index == model.selectedGoodIndex) {
      model.selectedGood.value = 'Anything';
      model.selectedGoodIndex = -1;
      update();
    } else {
      model.selectedGood.value = selected;
      model.selectedGoodIndex = index;
      model.isGoodExpanded.value = false;

      Future.delayed(const Duration(milliseconds: 150), () {
        openDatePicker();
      });

      update();
    }
  }

  void onDateSelected(DateTimeRange selected) {
    model.selectedDate.value =
        '${DateFormat.MMMd().format(selected.start)} - ${DateFormat.MMMd().format(selected.end)}';
    if (model.isPlaceExpanded.value) model.isPlaceExpanded.value = false;
    if (model.isGoodExpanded.value) model.isGoodExpanded.value = false;
    update();
  }

  void onPlaceExpanded() {
    model.isPlaceExpanded.value = !model.isPlaceExpanded.value;
    model.isGoodExpanded.value = false;
    update();
  }

  void onGoodExpanded() {
    model.isGoodExpanded.value = !model.isGoodExpanded.value;
    model.isPlaceExpanded.value = false;
    update();
  }

  void onSearchbarClear() {
    model.isPlaceExpanded.value = true;
    model.isGoodExpanded.value = false;
    model.selectedPlace.value = 'Anywhere';
    model.selectedPlaceIndex = -1;
    model.selectedGood.value = 'Anything';
    model.selectedGoodIndex = -1;
    model.selectedDate.value = 'Anytime';
    update();
  }
}
