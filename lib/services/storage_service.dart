import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants.dart';

final storageService = Provider((_) => StorageService());

class StorageService {
  final _service = 'StorageService';

  Box box([String? name]) {
    return name != null ? Hive.box(name) : Hive.box(C.defaultBoxName);
  }

  void put(String key, dynamic value, [String? boxName]) {
    box().put(key, value);
  }

  void putAt(int index, dynamic value) {
    box().putAt(index, value);
  }

  dynamic get(String key) {
    return box().get(key);
  }

  dynamic getAt(int index) {
    return box().getAt(index);
  }

  Future<void> delete(String key) async {
    await box().delete(key);
  }

  Future<void> deleteAt(int index) async {
    await box().deleteAt(index);
  }

  Future<int> clear(int index) async {
    return await box().clear();
  }

  Stream<BoxEvent> watch(String key) {
    return box().watch(key: key);
  }

  List valuesBetween({dynamic startKey, dynamic endKey}) {
    return box().valuesBetween(startKey: startKey, endKey: endKey).toList();
  }

  void close() async {
    await box().close();
  }
}
