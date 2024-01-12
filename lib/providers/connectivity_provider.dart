import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/route_manager.dart';
import 'package:github_repo_projects/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final connectivityProvider = StateNotifierProvider<ConnectivityProvider, bool>(
  (_) => ConnectivityProvider(),
);

class ConnectivityProvider extends StateNotifier<bool> {
  ConnectivityProvider() : super(true) {
    _init();
  }

  final _conn = Connectivity();

  Connectivity get conn => _conn;

  void _init() async {
    final e = await _conn.checkConnectivity();
    state = check(e);
    handleState();
    _conn.onConnectivityChanged.listen((e) {
      state = check(e);
      handleState();
    });
  }

  bool check(ConnectivityResult e) {
    return e == ConnectivityResult.none ? false : true;
  }

  handleState() {
    if (state) {
      whenConnetionComeBack();
    } else {
      whenConnectionLost();
    }
  }

  void whenConnectionLost() {
    Get.toNamed(Routes.noConnection);
  }

  void whenConnetionComeBack() {
    Get.back();
  }
}
