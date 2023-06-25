import 'package:flutter/material.dart';
import 'package:lms_apps/View/screens/category_course_screen.dart';
import 'package:lms_apps/utils/shared_pref.dart';

class SearchViewModel with ChangeNotifier {
  //to save value from TextField to _value
  String _value = '';

  String get value => _value;

  //to set _value variable
  set setValue(String val) {
    _value = val;
    notifyListeners();
  }

  List<String>? _searchHistoryList = [];

  //search history will return _searchHistory where it's find search based on input value
  List<String> get searchHistoryList => _searchHistoryList!
      .where((search) => search.toLowerCase().contains(_value))
      .toList();

  //get List
  void getSearchHistory({String? search}) async {
    _searchHistoryList = await SharedPref.getSearchHistoryList();
    if (_searchHistoryList!.length > 10) {
      removeSearch(index: _searchHistoryList!.length - 1);
    }
    notifyListeners();
  }

  void addSearch({required String search}) {
    SharedPref.addSearchHistory(search: search);
    getSearchHistory();
  }

  void removeSearch({required int index}) {
    SharedPref.deleteSearchHistory(index);
    getSearchHistory();
  }

  void clearAllSearch() {
    SharedPref.clearAllSearchHistory();
    getSearchHistory();
  }

  //to delete value from search bar
  void clearValue() {
    _value = '';
    notifyListeners();
  }

  void checkValue({required String search, required BuildContext context}) {
    if (search.isEmpty) {
      return;
    } else {
      addSearch(
        search: search,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryCourseScreen(search: search),
        ),
      );
      getSearchHistory(search: search);
      _value = '';
    }
  }
}
