import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:duck_travel/models/activity_models.dart';

Dio networkDio() {
  var dio = Dio(BaseOptions(
    baseUrl: 'https://ptx.transportdata.tw/MOTC/v2/Tourism/',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    // headers: getAuthorizationHeader()
  ));

  dio.interceptors.add(InterceptorsWrapper(
    // onRequest: (options, handler) {
    //   print();
    // },
    onResponse: (Response response, handler) {
      // print(getAuthorizationHeader());
      print(dotenv.env['CLIENT_ID']);
      // print(response.data);
    },
    // onError: (e, handler) {},
  ));

  return dio;
}

// https://ptx.transportdata.tw/MOTC/v2/Tourism/Activity?%24top=5&%24format=JSON
class apiRequest {
  static final _dio = networkDio();

  static Future getActivityData() async {
    try {
      print(';;;;;');
      print(dotenv.env['CLIENT_ID']);
      print(';;;;;');
      final response = await _dio.get('Activity?%24top=5&%24format=JSON');
      // print(response);
      return ActivityModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }
}

// final dio = Dio(); // With default `Options`.

// void configureDio() {
//   // Set default configs
//   dio.options.baseUrl = 'https://api.pub.dev';
//   dio.options.connectTimeout = Duration(seconds: 5);
//   dio.options.receiveTimeout = Duration(seconds: 3);

//   // Or create `Dio` with a `BaseOptions` instance.
//   final options = BaseOptions(
//     baseUrl: 'https://api.pub.dev',
//     connectTimeout: Duration(seconds: 5),
//     receiveTimeout: Duration(seconds: 3),
//   );
//   final anotherDio = Dio(options);
// }

// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('REQUEST[${options.method}] => PATH: ${options.path}');
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
//     super.onResponse(response, handler);
//   }

//   @override
//   Future onError(DioException err, ErrorInterceptorHandler handler) async {
//     print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
//     super.onError(err, handler);
//   }
// }
