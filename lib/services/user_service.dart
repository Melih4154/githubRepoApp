import 'package:dio/dio.dart';
import 'package:github_repo_projects/services/storage_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_service.dart';

final userService = Provider((ref) => UserService(ref));

class UserService {
  final _service = 'UserService';

  final ProviderRef ref;

  late final DioService _dio;
  late final StorageService _storage;

  UserService(this.ref) {
    _dio = ref.watch(dioService);
    _storage = ref.watch(storageService);
  }
}
