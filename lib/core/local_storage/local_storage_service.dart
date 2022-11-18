abstract class LocalStorageService {
  Future<void> saveStringList(String key, List<String> value);

  List<String>? getStringList(String key);

  Future<void> saveString(String key, String value);

  String? getString(String key);
}
