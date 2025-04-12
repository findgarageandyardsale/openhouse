import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/routes/app_route.gr.dart';
import 'package:open_house/services/user_cache_service/domain/providers/current_user_provider.dart';
import 'package:open_house/services/user_cache_service/domain/providers/user_cache_provider.dart';
import 'package:open_house/shared/core/app_context.dart';
import 'package:open_house/shared/mixins/exception_handler_mixin.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../../configs/app_configs.dart';
import '../../exceptions/http_exception.dart';
import '../../globals.dart';
import 'network_service.dart';
import 'package:open_house/shared/domain/models/response_data.dart' as response;

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;
  final Ref ref;

  DioNetworkService({required this.dio, required this.ref}) {
   
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true),
        );
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
        ));
      }
    
  }

  BaseOptions get dioBaseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.addAll(
            header,
          ); // Add the updated headers before every request
          return handler.next(options);
        },
        onError: (error, handler) async {
          final val = error.response?.data?['detail'];
          if (val != null) {
            final isTokenExpired = val.toString().toLowerCase().contains(
              'invalid token',
            );
            if (isTokenExpired) {
              BuildContext? context = AppContext().getContext();
              if (context != null) {
                //delete user
                ref.read(userLocalRepositoryProvider).deleteUser();
                context.router.replaceAll([LoginScreen()]).then((_) {
                  ref.invalidate(currentUserProvider);
                });
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
    return header;
  }

  @override
  Future<Either<AppException, response.ResponseData>> post(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
  }) {
    final res = handleException(
      () => dio.post(endpoint, data: data, queryParameters: queryParameter),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.ResponseData>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
  }) {
    final res = handleException(
      () => dio.delete(endpoint, data: data, queryParameters: queryParameter),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.ResponseData>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    final res = handleException(
      () => dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.ResponseData>> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
  }) {
    final res = handleException(
      () => dio.put(endpoint, data: data, queryParameters: queryParameter),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.ResponseData>> postImage(
    String endpoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options?.copyWith(contentType: 'multipart/form-data'),
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
