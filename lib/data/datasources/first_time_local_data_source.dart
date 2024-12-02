import 'package:shared_preferences/shared_preferences.dart';

class FirstTimeLocalDataSource {
  static const String _keyFirstTime = 'isFirstTime';
  final SharedPreferences sharedPreferences;

  FirstTimeLocalDataSource(this.sharedPreferences);

  Future<bool> isFirstTime() async {
    final result = sharedPreferences.getBool(_keyFirstTime) ?? true;
    print('isFirstTime called: $result'); // Debug
    return result;
  }

  Future<void> setFirstTimeDone() async {
    print('setFirstTimeDone called'); // Debug
    await sharedPreferences.setBool(_keyFirstTime, false);
    // Verifica si se guardó
    final saved = sharedPreferences.getBool(_keyFirstTime);
    print('Value saved: $saved'); // Debug
  }
}
