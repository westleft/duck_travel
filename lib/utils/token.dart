import 'package:shared_preferences/shared_preferences.dart';
import 'package:duck_travel/api/api_service.dart';

class AccessToken {
  static init() async {
    final prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');

    if (token != null) {
      AccessToken.set(token);
      return;
    }

    final isExpire = await AccessToken.isExpire();

    if (!isExpire) {
      return;
    }

    final response = await ApiRequest.getAccessToken();
    print(response.access_token);
    AccessToken.set(response.access_token);
    AccessToken.storeExpireTime(response.expires_in);
  }

  static set(token) async {
    requestHeader['authorization'] = 'Bearer ' + token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static get() {}

  static storeExpireTime(int expireTime) async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('expireTime', (expireTime + currentTime).toString());
  }

  static Future<bool> isExpire() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final prefs = await SharedPreferences.getInstance();
    final expireTime = await prefs.getString('expireTime');
    if (expireTime == null) return true;

    return currentTime > int.parse(expireTime as String) ? true : false;
  }
}
