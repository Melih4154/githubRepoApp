import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:github_repo_projects/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox(
    C.defaultBoxName,
    encryptionCipher: HiveAesCipher(utf8.encode(C.secureKey)),
  );
}
