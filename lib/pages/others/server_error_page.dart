import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_repo_projects/providers/state_provider.dart';
import 'package:github_repo_projects/routes.dart';
import 'package:github_repo_projects/services/dio_service.dart';
import 'package:github_repo_projects/utils/assets.dart';
import 'package:github_repo_projects/utils/styles.dart';
import 'package:github_repo_projects/widgets/empty_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServerErrorPage extends ConsumerWidget {
  const ServerErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final err = ref.watch(serverErrorProvider);

    void retry() {
      ref.watch(dioService.select((e) => e.dio)).fetch(err!.requestOptions);
      Get.back();
    }

    void onBack() {
      if (Get.previousRoute == '') {
        Get.offAllNamed(Routes.splash);
      } else {
        Get.back();
      }
    }

    return WillPopScope(
      onWillPop: () async {
        onBack();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: S.colors.transparent,
          leading: IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: err!.response!.statusCode == 500
            ? EmptyWidget(
                image: R.images.errorPage,
                title: 'Bir hata oluştu.',
                description:
                    'Sayfa yüklenirken bir hata oluştu. Lütfen tekrar deneyin.'
                        .tr,
                buttonTitle: "Tekrar dene",
                onTap: retry,
              )
            : EmptyWidget(
                image: R.images.errorPage,
                title: 'Bir hata oluştu',
                description: err.response!.statusMessage,
              ),
      ),
    );
  }
}
