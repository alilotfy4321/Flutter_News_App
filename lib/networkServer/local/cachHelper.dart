import 'package:flutter_application_1/controll/newsappcubit/newsappcubit_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences pref;
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future SaveUserKey(String key, dynamic val) async {
    if (val is String) {
      print('the setCachdValue is: $val');
      return await pref.setString(key, val);
    } else if (val is bool) {
      print('the setCachdValue is: $val');
      return await pref.setBool(key, val);
    } else if (val is int) {
      print('the setCachdValue is: $val');
      return await pref.setInt(key, val);
    } else
      return await false;
  }

  static getUserValue({required String key, dynamic userName}) {
    userName = pref.get(key);
    print('the getCachdValue is: $userName');
    return pref.get(key);
  }
}
