import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> get preferences async {
    if (_preferences != null) {
      return _preferences!;
    }

    _preferences = await SharedPreferences.getInstance();
    return _preferences!;
  }

  static Future<void> saveToken(String token) async {
    final prefs = await preferences;
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final prefs = await preferences;
    return prefs.getString('token');
  }

  static Future<void> removeToken() async {
    final prefs = await preferences;
    prefs.remove('token');
  }

  /* ==================Search Shared Pref =================== */
  static void addSearchHistory({required String search}) async {
    final prefs = await preferences;

    final searchHistoryList = prefs.getStringList('searchHistory');

    //add search to list
    searchHistoryList?.insert(0, search);

    //convert from list => set => list
    await prefs.setStringList(
        'searchHistory', searchHistoryList?.toSet().toList() ?? []);
  }

  static void deleteSearchHistory(int index) async {
    final prefs = await preferences;

    //get the list of string
    final searchHistoryList = prefs.getStringList('searchHistory');

    //delete searchHistoryList base on index
    searchHistoryList!.removeAt(index);

    //set to the list
    await prefs.setStringList('searchHistory', searchHistoryList);
  }

  static void clearAllSearchHistory() async {
    final prefs = await preferences;

    final searchHistoryList = prefs.getStringList('searchHistory');

    searchHistoryList!.clear();

    await prefs.setStringList('searchHistory', searchHistoryList);
  }

  static Future<List<String>?> getSearchHistoryList() async {
    final prefs = await preferences;

    return prefs.getStringList('searchHistory') ?? [];
  }
}
