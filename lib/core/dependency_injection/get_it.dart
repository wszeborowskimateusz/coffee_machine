import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgv_coffee_machine/core/dependency_injection/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
Future<GetIt> configureDependencies() => $initGetIt(getIt);

@module
abstract class CoreExternalServices {
  @preResolve
  Future<SharedPreferences> get sharedPreferences async =>
      SharedPreferences.getInstance();

  Dio get dio => Dio();
}
