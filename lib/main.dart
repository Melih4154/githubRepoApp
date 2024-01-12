import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:github_repo_projects/init.dart';
import 'package:github_repo_projects/pages/splash/splash_page.dart';
import 'package:github_repo_projects/routes.dart';
import 'package:github_repo_projects/services/navigation_service.dart';
import 'package:github_repo_projects/utils/assets.dart';
import 'package:github_repo_projects/utils/constants.dart';
import 'package:github_repo_projects/utils/styles.dart';
import 'package:github_repo_projects/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  await dotenv.load();
  await init();
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Utils.cacheImages(cacheImageList);
      });
      return () {};
    }, []);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: C.title,
      initialRoute: Routes.splash,
      home: const SplashPage(),
      navigatorKey: navService.navigatorKey,
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        fontFamily: 'montserrat',
        colorScheme: ColorScheme.light(
          primary: S.colors.orange,
        ),
        scaffoldBackgroundColor: S.colors.backgroundColor,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
    );
  }
}
