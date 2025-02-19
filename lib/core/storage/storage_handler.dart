// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
//
// class StorageHandler {
//
//   StorageHandler._();
//   static StorageHandler? _instance;
//   factory StorageHandler() => _instance ??= StorageHandler._();
//
//   final _storage = GetStorage();
//
//   static Future<void> init() async {
//     await GetStorage.init();
//   }
//
//   Future<void> setToken(String token) =>
//       _storage.write('token', token);
//
//   Future<void> removeToken() =>
//       _storage.remove('token');
//
//   String get token => _storage.read('token');
//
//   bool get hasToken => _storage.hasData('token');
//
//   Future<void> setLocale(String locale) =>
//       _storage.write('locale', locale);
//
//   Locale get locale {
//     if(_storage.hasData('locale')){
//       var lang = _storage.read('locale');
//       switch(lang){
//         case 'ar':
//           return const Locale('ar','sy');
//         default:
//           return const Locale('en','us');
//       }
//     }
//     return const Locale('en','us');
//   }
//
//   String get lang {
//   if(_storage.hasData('locale')){
//     var lang = _storage.read('locale');
//     return lang;
//   }
//   return 'en';
// }
//
//
// }