import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgv_coffee_machine/core/services/local_storage/local_storage_service.dart';

@Singleton(as: LocalStorageService)
class LocalStorageServiceImpl extends LocalStorageService {
  final SharedPreferences _sharedPreferences;

  LocalStorageServiceImpl(this._sharedPreferences);

  @override
  List<String>? getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  @override
  Future<void> saveStringList(String key, List<String> value) =>
      _sharedPreferences.setStringList(key, value);

  @override
  String? getString(String key) => _sharedPreferences.getString(key);

  @override
  Future<void> saveString(String key, String value) =>
      _sharedPreferences.setString(key, value);
}
