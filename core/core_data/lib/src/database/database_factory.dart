import 'package:hive/hive.dart';
import 'database.dart';

abstract class DatabaseFactory {
  DatabaseFactory(this.path) {
    initialize();
  }

  void initialize();

  final String path;

  void registerAdapter<T>(TypeAdapter<T> adapter) {
    Hive.registerAdapter<T>(adapter);
  }

  Future<Database<T>> open<T>({
    required String name,
    HiveAesCipher? encryptionCipher,
  }) async {
    Database<T> database;
    Box<T> box;

    try {
      box = await Hive.openBox<T>(
        name,
        path: path,
        encryptionCipher: encryptionCipher,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(
        name,
        path: path,
      );
      box = await Hive.openBox<T>(
        name,
        path: path,
        encryptionCipher: encryptionCipher,
      );
    }
    database = Database<T>(box);
    return database;
  }
}
