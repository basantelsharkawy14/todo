import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://hader.today/api';
  final Dio dio;


  ApiService(this.dio);
  static Map<String, String> apiHeaders = {
    // "Content-Type": "application/json",
    // "Accept": "application/json",
    // "X-Requested-With": "XMLHttpRequest",
  };

  Future<dynamic> get({required String endPoint , String? token}) async {
    if (token != null) {
      apiHeaders.addAll({'Authorization': token});
    }
    var response = await dio.get('$_baseUrl$endPoint',
        options: Options(
          headers: {...apiHeaders,
          },
        ));
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
         dynamic body,
        String? token}) async {

    if (token != null) {
      apiHeaders.addAll({'Authorization': token});
    }
    var response =
    await dio.post('$_baseUrl$endPoint',
        data: body,
        options: Options(
          headers: {...apiHeaders,
          },
        ));

    return response.data;
  }
}