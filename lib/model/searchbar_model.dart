import 'package:get/get.dart';

class SearchbarModel {
  RxBool isPlaceExpanded = true.obs;
  RxBool isGoodExpanded = false.obs;

  int selectedPlaceIndex = -1.obs;
  int selectedGoodIndex = -1.obs;

  RxString selectedPlace = "Anywhere".obs;
  RxString selectedGood = "Anything".obs;
  RxString selectedDate = "Anytime".obs;

  SearchbarModel._();

  static final SearchbarModel _instance = SearchbarModel._();

  factory SearchbarModel() {
    return _instance;
  }
}
