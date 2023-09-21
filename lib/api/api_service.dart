import 'package:dio/dio.dart';
import 'package:duck_travel/models/city_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:duck_travel/models/scenic_spot_models.dart';
import 'package:duck_travel/models/access_token_models.dart';

var requestHeader = {
  'content-type': 'application/x-www-form-urlencoded',
  'authorization': '',
};

Dio networkDio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'https://tdx.transportdata.tw/',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: requestHeader
    ),
  );

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      handler.next(options);
    },
    onResponse: (Response response, handler) {
      return handler.next(response);
    },
    // onError: (e, handler) {},
  ));

  return dio;
}

// https://ptx.transportdata.tw/MOTC/v2/Tourism/Activity?%24top=5&%24format=JSON
class ApiRequest {
  static final _dio = networkDio();

  static Future getAccessToken() async {
    final res = await _dio
        .post('auth/realms/TDXConnect/protocol/openid-connect/token', data: {
      'grant_type': 'client_credentials',
      'client_id': dotenv.env['CLIENT_ID'],
      'client_secret': dotenv.env['CLIENT_SERCET'],
    });
    return AccessTokenModel.fromJson(res.data);
  }

  static Future<List<CityModel>> getCity() async {
    final res = await _dio.get('api/basic/v2/Basic/City?%24format=JSON');
    return (res.data as List<dynamic>)
      .map((json) => CityModel.fromJson(json as Map<String, dynamic>))
      .toList();
  }

  static Future<List<ScenicSpotModel>> getScenicByCity(city, top, skip) async {
    final res = await _dio.get('api/basic/v2/Tourism/ScenicSpot/$city?%24top=$top&%24skip=$skip&%24format=JSON');
    return (res.data as List<dynamic>)
      .map((json) => ScenicSpotModel.fromJson(json as Map<String, dynamic>))
      .toList();
  }
}
