import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/constants.dart';

final dioService = Provider((ref) => DioService(ref));

class DioService {
  final ProviderRef ref;
  DioService(this.ref);

  static const _baseUrl = C.baseUrl;

  static final _headers = <String, dynamic>{};

  final _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    headers: _headers,
    connectTimeout: const Duration(milliseconds: 12000),
    sendTimeout: const Duration(milliseconds: 12000),
  ));

  Dio get dio => _dio;

  Future<Response> get(
    String path, {
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiverProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    required dynamic data,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        onReceiveProgress: onReceiverProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> postForm(
    String path, {
    required FormData formData,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        path,
        data: formData,
        onReceiveProgress: onReceiverProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    required dynamic data,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiverProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> putForm(
    String path, {
    required FormData formData,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put(
        path,
        data: formData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiverProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> patch(
    String path, {
    required dynamic data,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiverProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> patchForm(
    String path, {
    required FormData formData,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiverProgress,
    void Function(int, int)? onSendProgress,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.patch(
        path,
        data: formData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiverProgress,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
    } on DioException {
      rethrow;
    }
  }

  Future<Response> delete(
    String path, {
    CancelToken? cancelToken,
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    try {
      return await _dio.delete(
        path,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
        data: data,
      );
    } on DioException {
      rethrow;
    }
  }
}
