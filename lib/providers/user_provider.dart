import 'package:flutter/widgets.dart';
import 'package:github_repo_projects/services/user_service.dart';
import 'package:github_repo_projects/utils/enums.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = ChangeNotifierProvider((ref) => UserProvider(ref));

class UserProvider extends ChangeNotifier {
  final Ref _ref;
  late final UserService _service;

  UserProvider(this._ref) {
    _service = _ref.watch(userService);
  }

  Role? userRole;
}
