import 'package:get_storage/get_storage.dart';

class GetStorageUtil {
  static final GetStorage _storage = GetStorage();

  static Future<void> writeString(String key, String value) async {
    _storage.write(key, value);
  }

  static Future<void> writeInt(String key, int value) async {
    _storage.write(key, value);
  }

  static Future<void> writeBool(String key, bool value) async {
    _storage.write(key, value);
  }

  static Future<void> writeDynamic(String key, dynamic value) async {
    _storage.write(key, value);
  }

  static String? readString(String key) {
    return _storage.read(key) as String?;
  }

  static int? readInt(String key) {
    return _storage.read(key) as int?;
  }

  static bool readBool(String key, bool defaultValue) {
    return _storage.read(key) ?? defaultValue;
  }

  static dynamic readDynamic(String key) {
    return _storage.read(key);
  }

  static Future<void> clearKey(String key) async {
    _storage.remove(key);
  }

  static Future<void> clearAll() async {
    _storage.erase();
  }
}
