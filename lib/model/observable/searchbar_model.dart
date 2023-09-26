import 'package:get/get.dart';

class SearchbarModel {
  final RxBool _isPlaceExpanded = true.obs;
  final RxBool _isGoodExpanded = false.obs;
  final RxString _selectedPlace = "anywhere".tr.obs;
  final RxString _selectedGood = "anything".tr.obs;
  final RxString _selectedDate = "anytime".tr.obs;
  final RxInt _selectedPlaceIndex = (-1).obs;
  final RxInt _selectedGoodIndex = (-1).obs;

  bool get isPlaceExpanded => _isPlaceExpanded.value;

  set isPlaceExpanded(bool value) => _isPlaceExpanded.value = value;

  bool get isGoodExpanded => _isGoodExpanded.value;

  set isGoodExpanded(bool value) => _isGoodExpanded.value = value;

  int get selectedPlaceIndex => _selectedPlaceIndex.value;

  set selectedPlaceIndex(int value) => _selectedPlaceIndex.value = value;

  int get selectedGoodIndex => _selectedGoodIndex.value;

  set selectedGoodIndex(int value) => _selectedGoodIndex.value = value;

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
