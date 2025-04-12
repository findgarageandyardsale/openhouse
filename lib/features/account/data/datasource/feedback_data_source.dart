import 'package:dartz/dartz.dart';
import 'package:open_house/configs/app_configs.dart';
import 'package:open_house/shared/data/remote/network_service.dart';
import 'package:open_house/shared/domain/models/response_data.dart';

import '../../../../shared/exceptions/http_exception.dart';

abstract class FeedbackDataSource {
  Future<Either<AppException, ResponseData>> postFeedback({
    required Map<String, dynamic> map,
  });
}

class FeedbackRemoteDataSource implements FeedbackDataSource {
  final NetworkService networkService;
  FeedbackRemoteDataSource(this.networkService);

  @override
  Future<Either<AppException, ResponseData>> postFeedback({
    required Map<String, dynamic> map,
  }) async {
    try {
      final url = AppConfigs.postFeedback;
      final eitherType = await networkService.post(url, data: map);
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
