import 'package:dartz/dartz.dart';

import '../../../../shared/domain/models/response_data.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../datasource/add_garage_remote_datasource.dart';

abstract class AddRepository {
  Future<Either<AppException, ResponseData>> addPost({
    required Map<String, dynamic> singleItem,
  });
  Future<Either<AppException, ResponseData>> editPost({
    required Map<String, dynamic> singleItem,
    required String id,
  });
  Future<Either<AppException, ResponseData>> payementForPost({
    required Map<String, dynamic> singleItem,
    required String id,
  });
}

class AddRepositoryImpl extends AddRepository {
  final AddGarageDatasource addDatasource;
  AddRepositoryImpl(this.addDatasource);

  @override
  Future<Either<AppException, ResponseData>> addPost({
    required Map<String, dynamic> singleItem,
  }) {
    return addDatasource.addPost(singleItem: singleItem);
  }

  @override
  Future<Either<AppException, ResponseData>> editPost({
    required Map<String, dynamic> singleItem,
    required String id,
  }) {
    return addDatasource.editPost(singleItem: singleItem, id: id);
  }

  @override
  Future<Either<AppException, ResponseData>> payementForPost({
    required Map<String, dynamic> singleItem,
    required String id,
  }) {
    return addDatasource.payementForGaragePost(singleItem: singleItem, id: id);
  }
}
