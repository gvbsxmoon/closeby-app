class SearchbarModel {
  bool isPlaceExpanded = false;
  bool isGoodExpanded = false;
  String whatTo = "Anything";
  String whereTo = "Anywhere";
  int selectedPlaceIndex = -1;
  int selectedGoodIndex = -1;

  String selectedPlace = "";
  String selectedGood = "";

  SearchbarModel._privateConstructor();

  static final SearchbarModel _instance = SearchbarModel._privateConstructor();

  factory SearchbarModel.getInstance() {
    return _instance;
  }
}