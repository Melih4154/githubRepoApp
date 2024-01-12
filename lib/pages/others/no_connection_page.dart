import 'package:flutter/material.dart';
import 'package:github_repo_projects/utils/assets.dart';
import 'package:github_repo_projects/widgets/empty_widget.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: EmptyWidget(
          image: R.images.errorPage,
          title: 'İnternet Bağlantısı Gerekli',
          description: 'Lütfen internet bağlantınızı kontrol ediniz.',
        ),
      ),
    );
  }
}
