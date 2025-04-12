import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:open_house/features/account/data/datasource/attachment_file_data_source.dart';
import 'package:open_house/features/account/domain/repository/attachment_file_repository.dart';
import 'package:open_house/shared/domain/models/response_data.dart';
import 'package:open_house/shared/exceptions/http_exception.dart';

class AttachmentFileRespositoryImpl extends AttachmentFileRepository {
  final AttachmentFileDataSource datasource;
  AttachmentFileRespositoryImpl(this.datasource);
  @override
  Future<Either<AppException, ResponseData>> uploadAttachment({
    required FormData map,
  }) {
    return datasource.uploadAttachment(map: map);
  }
}
