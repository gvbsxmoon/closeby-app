import 'package:closeby/model/searchbar_model.dart';

class SearchbarController {
  SearchbarModel model = SearchbarModel.getInstance();

  void onPlaceSelected(int index, String selected) {
    model.selectedPlace = selected;
    model.selectedPlaceIndex = index;
    model.isPlaceExpanded = false;
    model.isGoodExpanded = true;
  }

  void onGoodSelected(int index, String selected) {
    model.selectedGood = selected;
    model.selectedGoodIndex = index;
  }

  void onPlaceExpanded() {
    model.isPlaceExpanded = !model.isPlaceExpanded;
    model.isGoodExpanded = false;
  }

  void onGoodExpanded() {
    model.isGoodExpanded = !model.isGoodExpanded;
    model.isPlaceExpanded = false;
  }

  void onSearchbarOpened() {
    model.state = true;
  }

  void onSearchbarClosed() {
    model.state = false;
  }
}
