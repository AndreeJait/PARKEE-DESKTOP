part of 'util.dart';

class PreferencesUtils {
  late SharedPreferences _sharedPreferences;

  SharedPreferences get sharedPreferences => _sharedPreferences;

  PreferencesUtils(this._sharedPreferences);

  bool getBool(String name, bool defaults) {
    return _sharedPreferences.getBool(name) ?? defaults;
  }

  int getInt(String name, int defaults) {
    return _sharedPreferences.getInt(name) ?? defaults;
  }

  double getDouble(String name, double defaults) {
    return _sharedPreferences.getDouble(name) ?? defaults;
  }

  String getString(String name, String defaults) {
    return _sharedPreferences.getString(name) ?? defaults;
  }

  Object get(String name, Object defaults) {
    return _sharedPreferences.get(name) ?? defaults;
  }

  List<String> getStringList(String name) {
    return _sharedPreferences.getStringList(name) ?? [];
  }

  Future<void> clearWithExcept(List<String> exceptions) async {
    List<Future<bool>> order = [];
    for (String key in pref.getKeys()) {
      if (!exceptions.contains(key)) {
        order.add(pref.remove(key));
      }
    }
    await Future.wait(order);
  }
}
