abstract class AppConfig {
  String get baseUrl;

  String get encryptionKey => '';

  List<int> get hiveEncryptionKey {
    return encryptionKey.split(',').map((e) => int.parse(e)).toList();
  }
}
