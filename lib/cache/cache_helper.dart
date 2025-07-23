import 'dart:convert';
import 'package:sakni/models/Auth_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserCacheHelper {
  static const String _userKey = 'user';

  // حفظ بيانات المستخدم
  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString(_userKey, userJson);
  }

  // استرجاع بيانات المستخدم
  static Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString(_userKey);

    if (userString != null) {
      final Map<String, dynamic> userMap = jsonDecode(userString);
      return UserModel.fromjson(userMap);
    }
    return null;
  }

  // حذف بيانات المستخدم
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
