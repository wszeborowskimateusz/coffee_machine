import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class CoreServices {
  @preResolve
  Future<SharedPreferences> get sharedPreferences async =>
      SharedPreferences.getInstance();

  Dio get dio => Dio();
}
