import 'package:dartz/dartz.dart';
import 'package:open_house/features/account/data/datasource/account_remote_data_source.dart';
import 'package:open_house/features/account/domain/repository/account_repository.dart';
import 'package:open_house/shared/domain/models/response_data.dart';
import 'package:open_house/shared/exceptions/http_exception.dart';

class AccountRespositoryImpl extends AccountRepository {
  final AccountDatasource datasource;
  AccountRespositoryImpl(this.datasource);
  @override
  Future<Either<AppException, ResponseData>> changePassword({
    required Map<String, dynamic> map,
  }) {
    return datasource.changePassword(map: map);
  }

  @override
  Future<Either<AppException, ResponseData>> editProfile({
    required Map<String, dynamic> map,
    required String userId,
  }) {
    return datasource.editProfile(map: map, userId: userId);
  }

  @override
  Future<Either<AppException, ResponseData>> getProfile() {
    return datasource.getProfile();
  }

  @override
  Future<Either<AppException, ResponseData>> deleteProfile(String id) {
    return datasource.deleteProfile(id);
  }
}
