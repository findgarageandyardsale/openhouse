import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open_house/configs/app_configs.dart';
import 'package:open_house/shared/data/remote/network_service.dart';
import 'package:open_house/shared/domain/models/response_data.dart';

import '../../../../shared/exceptions/http_exception.dart';

abstract class AttachmentFileDataSource {
  Future<Either<AppException, ResponseData>> uploadAttachment({
    required FormData map,
  });
}

class AttachmentFileRemoteDataSource implements AttachmentFileDataSource {
  final NetworkService networkService;
  AttachmentFileRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, ResponseData>> uploadAttachment({
    required FormData map,
  }) async {
    try {
      final url = AppConfigs.uploadAttachment;
      final eitherType = await networkService.postImage(url, data: map);
      return eitherType.fold(
        (exception) {
          return Left(exception);
        },
        (response) {
          return Right(response);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occured',
          statusCode: 1,
          identifier:
              '${e.toString()} AttachmentFileDataSource.uploadAttachment',
        ),
      );
    }
  }
}
