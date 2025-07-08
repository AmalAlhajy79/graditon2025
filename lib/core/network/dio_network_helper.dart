
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import '../storage/storage_handler.dart';
import 'exceptions.dart';
import 'network_helper.dart';

class DioNetworkHelper extends NetworkHelper {
  DioNetworkHelper._() : super.create();
  static DioNetworkHelper? _instance;

  factory DioNetworkHelper() => _instance ??= DioNetworkHelper._();

  Future<Map<String, String>> getHeaders() async {
    final box = GetStorage();
    final token = box.read('api_token') ?? '';

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': 'Bearer 3|I1dhOPspKHPKo6DSrXdxuQq5MeCIn109vnTdIBZ0da313418',//$token',
    };
  }
  // static Map<String, String> get _headers => {
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json',
  //
  //   'Authorization':
  //   'Bearer 2|CMoH9o1ZZpbpf0o9CNGts66wpEC3aafTd4bsV8mHe30004e3',
  //   // user 2|CMoH9o1ZZpbpf0o9CNGts66wpEC3aafTd4bsV8mHe30004e3',    //hall admin   1|mRZts3EcEURCu1CU5bWNrxuwncgwdxLd1ioqUWjQe09d6803'//Jqezsk3ZzgG9aR8QGiAW6IiPsJ2JYtWOMetHKnORxQqQ5CZVmAcvgIFFfQv8'//Jqezsk3ZzgG9aR8QGiAW6IiPsJ2JYtWOMetHKnORxQqQ5CZVmAcvgIFFfQv8' //35Rr1OY6VD5imFy4ER0gwexui82UlE50eNGLwiehd9IfVjJUDHh1yWMh0Rgq'
  //   //   if(StorageHandler().hasToken)
  //   //     'Authorization': 'Bearer ${StorageHandler().token}'
  // };

  final _dio = Dio();

  @override
  Future<AppResponse> get(String url, {Map<String, String>? headers}) async {
    try {
      var headersMap = await getHeaders();
      var response = await _dio.get(url,
          options: Options(
            headers: {...headersMap, if (headers != null) ...headers},
          ));
      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> post(String url,
      {Map<String, String>? headers,
        Map<String, dynamic>? body,
        Map<String, dynamic>? files,
        FormData? data}) async {
    try {
      var headersMap = await getHeaders();
      dynamic requestData = data ?? body;

      if (files != null) {
        requestData = FormData.fromMap({
          if (body != null) ...body,
          ...files.map(
                  (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)))
        });
      }

      var response = await _dio.post(url,
          options:
          Options(headers: {...headersMap, if (headers != null) ...headers}),
          data: requestData);

      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<AppResponse> put(String url,
      {Map<String, String>? headers,
        Map<String, dynamic>? body,
        Map<String, dynamic>? files}) async {
    try {
      var headersMap = await getHeaders();
      dynamic requestData = body;

      if (files != null) {
        requestData = FormData.fromMap({
          if (body != null) ...body,
          ...files.map(
                  (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)))
        });
      }

      var response = await _dio.put(url,
          options:
          Options(headers: {...headersMap, if (headers != null) ...headers}),
          data: requestData);

      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> delete(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      var headersMap = await getHeaders();
      var response = await _dio.delete(url,
          options:
          Options(headers: {...headersMap, if (headers != null) ...headers}),
          data: body);

      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> reject(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      var headersMap = await getHeaders();
      var response = await _dio.post(url,
          options:
          Options(headers: {...headersMap, if (headers != null) ...headers}),
          data: body);

      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AppResponse> approved(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      var headersMap = await getHeaders();
      var response = await _dio.post(url,
          options:
          Options(headers: {...headersMap, if (headers != null) ...headers}),
          data: body);

      return response.toAppResponse;
    } on DioException catch (e) {
      if (e.response != null) {
        throw ServerException('fail with code : ${e.response?.statusCode}');
      }
      throw const ConnectionError();
    } catch (e) {
      rethrow;
    }
  }

}

extension DioToAppResponse on Response {
  AppResponse get toAppResponse => AppResponse(
    statusCode: statusCode ?? 400,
    data: data,
    headers: headers.map.map((key, value) => MapEntry(key, value.join(""))),
  );
}



// import 'package:dio/dio.dart';
// import '../storage/storage_handler.dart';
// import 'exceptions.dart';
// import 'network_helper.dart';
//
// class DioNetworkHelper extends NetworkHelper {
//   DioNetworkHelper._() : super.create();
//   static DioNetworkHelper? _instance;
//
//   factory DioNetworkHelper() => _instance ??= DioNetworkHelper._();
//
//   static Map<String, String> get _headers => {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//
//         'Authorization':
//             'Bearer 2|CMoH9o1ZZpbpf0o9CNGts66wpEC3aafTd4bsV8mHe30004e3',
//         // user 2|CMoH9o1ZZpbpf0o9CNGts66wpEC3aafTd4bsV8mHe30004e3',    //hall admin   1|mRZts3EcEURCu1CU5bWNrxuwncgwdxLd1ioqUWjQe09d6803'//Jqezsk3ZzgG9aR8QGiAW6IiPsJ2JYtWOMetHKnORxQqQ5CZVmAcvgIFFfQv8'//Jqezsk3ZzgG9aR8QGiAW6IiPsJ2JYtWOMetHKnORxQqQ5CZVmAcvgIFFfQv8' //35Rr1OY6VD5imFy4ER0gwexui82UlE50eNGLwiehd9IfVjJUDHh1yWMh0Rgq'
//         //   if(StorageHandler().hasToken)
//         //     'Authorization': 'Bearer ${StorageHandler().token}'
//       };
//
//   final _dio = Dio();
//
//   @override
//   Future<AppResponse> get(String url, {Map<String, String>? headers}) async {
//     try {
//       var response = await _dio.get(url,
//           options: Options(
//             headers: {..._headers, if (headers != null) ...headers},
//           ));
//       return response.toAppResponse;
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw ServerException('fail with code : ${e.response?.statusCode}');
//       }
//       throw const ConnectionError();
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   @override
//   Future<AppResponse> post(String url,
//       {Map<String, String>? headers,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? files,
//       FormData? data}) async {
//     try {
//       dynamic data = body;
//       if (files != null) {
//         data = FormData.fromMap({
//           if (body != null) ...body,
//           ...files.map(
//               (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)))
//         });
//       }
//       var response = await _dio.post(url,
//           options:
//               Options(headers: {..._headers, if (headers != null) ...headers}),
//           data: data);
//       return response.toAppResponse;
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw ServerException('fail with code : ${e.response?.statusCode}');
//       }
//       throw const ConnectionError();
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   @override
//   Future<AppResponse> put(String url,
//       {Map<String, String>? headers,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? files}) async {
//     try {
//       dynamic data = body;
//       if (files != null) {
//         data = FormData.fromMap({
//           if (body != null) ...body,
//           ...files.map(
//               (key, value) => MapEntry(key, MultipartFile.fromFileSync(value)))
//         });
//       }
//       var response = await _dio.put(url,
//           options:
//               Options(headers: {..._headers, if (headers != null) ...headers}),
//           data: data);
//       return response.toAppResponse;
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw ServerException('fail with code : ${e.response?.statusCode}');
//       }
//       throw const ConnectionError();
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   @override
//   Future<AppResponse> delete(String url,
//       {Map<String, String>? headers, Map<String, dynamic>? body}) async {
//     try {
//       var response = await _dio.delete(url,
//           options:
//               Options(headers: {..._headers, if (headers != null) ...headers}),
//           data: body);
//       return response.toAppResponse;
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw ServerException('fail with code : ${e.response?.statusCode}');
//       }
//       throw const ConnectionError();
//     } catch (e) {
//       rethrow;
//     }
//   }
//   @override
//   Future<AppResponse> reject(String url,
//       {Map<String, String>? headers, Map<String, dynamic>? body}) async {
//     try {
//       var response = await _dio.post(url,
//           options:
//           Options(headers: {..._headers, if (headers != null) ...headers}),
//           data: body);
//       return response.toAppResponse;
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw ServerException('fail with code : ${e.response?.statusCode}');
//       }
//       throw const ConnectionError();
//     } catch (e) {
//       rethrow;
//     }
//   }
//   @override
//   Future<AppResponse> approved(String url,
//       {Map<String, String>? headers, Map<String, dynamic>? body}) async {
//     try {
//       var response = await _dio.post(url,
//           options:
//           Options(headers: {..._headers, if (headers != null) ...headers}),
//           data: body);
//       return response.toAppResponse;
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw ServerException('fail with code : ${e.response?.statusCode}');
//       }
//       throw const ConnectionError();
//     } catch (e) {
//       rethrow;
//     }
//   }
//
// }
//
// extension DioToAppResponse on Response {
//   AppResponse get toAppResponse => AppResponse(
//         statusCode: statusCode ?? 400,
//         data: data,
//         headers: headers.map.map((key, value) => MapEntry(key, value.join(""))),
//       );
// }
