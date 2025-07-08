
import 'dart:io';

import 'package:dio/src/form_data.dart';

import 'dio_network_helper.dart';

part 'app_response.dart';

abstract class NetworkHelper {

  factory NetworkHelper() => DioNetworkHelper();
  NetworkHelper.create();



  Future<AppResponse> get(String url, {Map<String, String>? headers});

  Future<AppResponse> post(
      String url,
      {
        Map<String, String>? headers,
        Map<String, dynamic>? body,
        Map<String,String>? files,
        FormData? data
      });


  Future<AppResponse> put(
      String url,
      {
        Map<String, String>? headers,
        Map<String, dynamic>? body,
        Map<String,dynamic>? files
      });

  Future<AppResponse> delete(
      String url,
      {
        Map<String, String>? headers,
        Map<String, dynamic>? body
      });
  Future<AppResponse> reject(
      String url,
      {
        Map<String, String>? headers,
        Map<String, dynamic>? body
      });
  Future<AppResponse> approved(
      String url,
      {
        Map<String, String>? headers,
        Map<String, dynamic>? body
      });

}