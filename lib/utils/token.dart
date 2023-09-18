import 'package:shared_preferences/shared_preferences.dart';
import 'package:duck_travel/api/api_service.dart';

class AccessToken {
  static init () async {
    final prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');

    if (token != null) {
      AccessToken.set(token);
      return;
    }

    final response = await ApiRequest.getAccessToken();
    AccessToken.set(response.access_token);
    return;
  }

  static set(token) async {
    requestHeader['authorization'] = 'Bearer ' + token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static get() {

  }

  static bool isExpire() {
    return false;
  }

}