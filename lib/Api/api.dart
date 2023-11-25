import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: "",
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }

  Future getData({
    required String path,
    Map<String, dynamic>? params,
  }) async {
    return await dio.get(path, queryParameters: params);
  }
}


  // static Dio? dio;
  //
  // static init() {
  //   dio = Dio(BaseOptions(
  //     baseUrl: '',
  //     receiveDataWhenStatusError: true,
  //   ));
  // }
  //
  // static Future<Response> getData({
  //   required String url,
  //   required Map<String, dynamic> query,
  // }) async {
  //   return await dio!.get(
  //     url,
  //     queryParameters: query,
  //   );
  // }
  //
  // static Future<Response> postData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  // }) async {
  //   return dio!.post(
  //     url,
  //     queryParameters: query,
  //   );
  // }

