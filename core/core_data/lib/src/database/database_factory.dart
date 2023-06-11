import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'database.dart';

abstract class DatabaseFactory {
  DatabaseFactory(this.path) {
    initialize();
  }

  void initialize();

  final String path;

  void registerAdapter<T>(
    TypeAdapter<T> adapter, {
    bool internal = false,
    bool override = false,
  }) {
    try {
      Hive.registerAdapter<T>(
        adapter,
        internal: internal,
        override: override,
      );
    } catch (e) {
      debugPrint("Hive.registerAdapter ${T.runtimeType} fail: ${e.toString()}");
    }
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
