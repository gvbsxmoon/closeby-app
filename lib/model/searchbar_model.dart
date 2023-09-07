class SearchbarModel {
  bool state = false;
  bool isPlaceExpanded = true;
  bool isGoodExpanded = false;
  int selectedPlaceIndex = -1;
  int selectedGoodIndex = -1;

  String selectedPlace = "Anywhere";
  String selectedGood = "Anything";

  SearchbarModel._privateConstructor();

  static final SearchbarModel _instance = SearchbarModel._privateConstructor();

  factory SearchbarModel.getInstance() {
    return _instance;
  }
}
