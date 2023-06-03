abstract class AppConfig {
  String get baseUrl;
  String get encryptionKey => '';
  List<int> get hiveEncryptionKey => [];
}
