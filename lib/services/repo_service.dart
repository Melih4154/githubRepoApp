import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:github_repo_projects/models/repo/repo_model.dart';
import 'package:github_repo_projects/services/storage_service.dart';
import 'package:github_repo_projects/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_service.dart';

final repoService = Provider((ref) => RepoService(ref));

class RepoService {
  final _service = 'RepoService';

  final ProviderRef ref;

  late final DioService _dio;
  late final StorageService _storage;

  RepoService(this.ref) {
    _dio = ref.watch(dioService);
    _storage = ref.watch(storageService);
  }

  Future<List<Repo>> getRepos({required String username}) async {
    try {
      final res = await _dio.get(
        '$username/repos',
        options: Options(
          headers: {
            "authorization": "token ${dotenv.env['GENERATE_TOKEN']}",
          },
        ),
      );
      final List list = res.data;
      final List<Repo> tempList = [];
      for (var i = 0; i < list.length; i++) {
        tempList.add(Repo.fromJson(list[i]));
      }

      return tempList;
    } on DioException {
      rethrow;
    }
  }
}
