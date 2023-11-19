import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;

  ApiServices(this.dio);
  final _baseUrl = '';
  Future<Map<String, dynamic>> get({required String endPoint})async{
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
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
}
