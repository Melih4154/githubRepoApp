import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:github_repo_projects/providers/connectivity_provider.dart';
import 'package:github_repo_projects/providers/user_provider.dart';
import 'package:github_repo_projects/services/storage_service.dart';
import 'package:github_repo_projects/utils/assets.dart';
import 'package:github_repo_projects/utils/constants.dart';
import 'package:github_repo_projects/utils/enums.dart';
import 'package:github_repo_projects/utils/styles.dart';
import 'package:github_repo_projects/widgets/custom_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../routes.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.watch(connectivityProvider);
        final storage = ref.watch(storageService);
        final user = ref.watch(userProvider);

        if (storage.box().get(C.token) == '') {
          user.userRole = Role.guest;
          Get.offAllNamed(Routes.home);
        }

        Get.offAllNamed(Routes.home);
      });
      return null;
    }, []);
    return Scaffold(
      backgroundColor: S.colors.white,
      body: Center(
        child: CustomImage.asset(R.images.logo),
      ),
    );
  }
}
