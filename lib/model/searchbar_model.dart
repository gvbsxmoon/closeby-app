class SearchbarModel {
  bool state = false;

  bool isPlaceExpanded = true;
  bool isGoodExpanded = false;

  int selectedPlaceIndex = -1;
  int selectedGoodIndex = -1;

  String selectedPlace = "Anywhere";
  String selectedGood = "Anything";
  String selectedDate = "Anytime";

  SearchbarModel._();

  static final SearchbarModel _instance = SearchbarModel._();

  factory SearchbarModel() {
    return _instance;
  }
}
