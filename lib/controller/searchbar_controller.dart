import 'package:closeby/model/searchbar_model.dart';

class SearchbarController {
  SearchbarModel model = SearchbarModel.getInstance();

  void onPlaceSelected(String index) {
    model.selectedPlace = index;
    model.isPlaceExpanded = false;
    model.isGoodExpanded = true;
  }

  void onGoodSelected(int index, String selected) {
    model.selectedGood = selected;
    model.selectedGoodIndex = index;
  }

  void onPlaceExpanded() {
    model.isPlaceExpanded = !model.isPlaceExpanded;
    print(model.isPlaceExpanded);
    model.isGoodExpanded = false;
  }

  void onGoodExpanded() {
    model.isGoodExpanded = !model.isGoodExpanded;
    print(model.isGoodExpanded);
    model.isPlaceExpanded = false;
  }
}
