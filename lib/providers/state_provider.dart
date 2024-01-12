import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final serverErrorProvider = StateProvider<DioException?>((_) => null);
final loadingProvider = StateProvider<bool>((_) => false);
