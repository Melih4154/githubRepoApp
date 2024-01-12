import 'package:flutter/widgets.dart';
import 'package:github_repo_projects/models/repo/repo_model.dart';
import 'package:github_repo_projects/services/repo_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final repoProvider = ChangeNotifierProvider((ref) => RepoProvider(ref));

class RepoProvider extends ChangeNotifier {
  final Ref _ref;
  late final RepoService _service;

  RepoProvider(this._ref) {
    _service = _ref.watch(repoService);
  }

  List<Repo> repos = [];

  Future<void> getRepo({required String username}) async {
    try {
      repos = await _service.getRepos(username: username);
      notifyListeners();
    } catch (e) {}
  }
}
