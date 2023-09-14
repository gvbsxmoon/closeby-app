import 'package:get/get.dart';

class SearchbarModel {
  final RxBool _isPlaceExpanded = true.obs;
  final RxBool _isGoodExpanded = false.obs;
  final RxString _selectedPlace = "Anywhere".obs;
  final RxString _selectedGood = "Anything".obs;
  final RxString _selectedDate = "Anytime".obs;
  int _selectedPlaceIndex = -1.obs;
  int _selectedGoodIndex = -1.obs;

  bool get isPlaceExpanded => _isPlaceExpanded.value;

  set isPlaceExpanded(bool value) => _isPlaceExpanded.value = value;

  bool get isGoodExpanded => _isGoodExpanded.value;

  set isGoodExpanded(bool value) => _isGoodExpanded.value = value;

  int get selectedPlaceIndex => _selectedPlaceIndex;

  set selectedPlaceIndex(int value) => _selectedPlaceIndex = value;

  int get selectedGoodIndex => _selectedGoodIndex;

  set selectedGoodIndex(int value) => _selectedGoodIndex = value;

  String get selectedPlace => _selectedPlace.value;

  set selectedPlace(String value) => _selectedPlace.value = value;

  String get selectedGood => _selectedGood.value;

  set selectedGood(String value) => _selectedGood.value = value;

  String get selectedDate => _selectedDate.value;

  set selectedDate(String value) => _selectedDate.value = value;

  SearchbarModel._();

  static final SearchbarModel _instance = SearchbarModel._();

  factory SearchbarModel() {
    return _instance;
  }
}
