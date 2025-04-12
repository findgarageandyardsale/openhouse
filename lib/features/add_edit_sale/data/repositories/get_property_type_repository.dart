import 'package:dartz/dartz.dart';
import 'package:open_house/shared/domain/models/paginated_response.dart';
import '../../../../shared/domain/models/response_data.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../datasource/add_garage_remote_datasource.dart';

abstract class GetPropertyTypeRepository {
  Future<Either<AppException, PaginatedResponse>> getPopertyTypeList();
  Future<Either<AppException, ResponseData>> addPropertyType(String catName);
}

class GetPropertyTypeRepositoryImpl extends GetPropertyTypeRepository {
  final AddGarageDatasource addGarageDatasource;
  GetPropertyTypeRepositoryImpl(this.addGarageDatasource);

  @override
  Future<Either<AppException, PaginatedResponse>> getPopertyTypeList() {
    return addGarageDatasource.getPopertyTypeList();
  }

  @override
  Future<Either<AppException, ResponseData>> addPropertyType(String catName) {
    return addGarageDatasource.addPropertyType(catName);
  }
}
