import 'package:closeby/model/searchbar_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchbarController {
  SearchbarModel model = SearchbarModel();

  // WHEN SOMETHING IS SELECTED
  void onPlaceSelected(int index, String selected) {
    if (index == model.selectedPlaceIndex) {
      model.selectedPlace = 'Anywhere';
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
      model.selectedGood = 'Anything';
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
  }

  // WHEN SOMETHING IS EXPANDED
  void onPlaceExpanded() {
    model.isPlaceExpanded = !model.isPlaceExpanded;
    model.isGoodExpanded = false;
  }

  void onGoodExpanded() {
    model.isGoodExpanded = !model.isGoodExpanded;
    model.isPlaceExpanded = false;
  }

  void onDateExpanded() {
    model.isGoodExpanded = false;
  }

  // TRACK SEARCHBAR STATE
  void onSearchbarOpened() {
    model.state = true;
    model.isPlaceExpanded = true;
  }

  void onSearchbarClosed() {
    model.state = false;
  }

  void onSearchbarClear() {
    model.state = false;
    model.selectedPlace = 'Anywhere';
    model.selectedPlaceIndex = -1;
    model.selectedGood = 'Anything';
    model.selectedGoodIndex = -1;
    model.selectedDate = 'Anytime';
  }
}
