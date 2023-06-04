import 'package:hive/hive.dart';

class Database<T> extends Box<T> {
  final Box<T> box;

  Database(this.box);

  @override
  Future<int> add(T value, {bool notify = true}) {
    return box.add(value, notify: notify);
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values, {bool notify = true}) {
    return box.addAll(values, notify: notify);
  }

  @override
  Future<int> clear({bool notify = true}) {
    return box.clear(notify: notify);
  }

  @override
  Future<void> close() {
    return box.close();
  }

  @override
  Future<void> compact() {
    return box.compact();
  }

  @override
  bool containsKey(key) {
    return box.containsKey(key);
  }

  @override
  Future<void> delete(key, {bool notify = true}) {
    return box.delete(key, notify: notify);
  }

  @override
  Future<void> deleteAll(Iterable keys, {bool notify = true}) {
    return box.deleteAll(keys, notify: notify);
  }

  @override
  Future<void> deleteAt(int index, {bool notify = true}) {
    return box.deleteAt(index, notify: notify);
  }

  @override
  Future<void> deleteFromDisk() {
    return box.deleteFromDisk();
  }

  @override
  Future<void> flush() {
    return box.flush();
  }

  @override
  T? get(key, {T? defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  T? getAt(int index) {
    return box.getAt(index);
  }

  @override
  bool get isEmpty => box.isEmpty;

  @override
  bool get isNotEmpty => box.isNotEmpty;

  @override
  bool get isOpen => box.isOpen;

  @override
  keyAt(int index) {
    return box.keyAt(index);
  }

  @override
  Iterable get keys => box.keys;

  @override
  bool get lazy => box.lazy;

  @override
  int get length => box.length;

  @override
  String get name => box.name;

  @override
  String? get path => box.path;

  @override
  Future<void> put(key, T value, {bool notify = true}) {
    return box.put(key, value, notify: notify);
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries, {bool notify = true}) {
    return box.putAll(entries, notify: notify);
  }

  @override
  Future<void> putAt(int index, T value, {bool notify = true}) {
    return box.putAt(index, value, notify: notify);
  }

  @override
  Map<dynamic, T> toMap() {
    return box.toMap();
  }

  @override
  Iterable<T> get values => box.values;

  @override
  Iterable<T> valuesBetween({startKey, endKey}) {
    return box.valuesBetween(startKey: endKey);
  }

  @override
  Stream<BoxEvent> watch({key}) {
    return box.watch(key: key);
  }
}
