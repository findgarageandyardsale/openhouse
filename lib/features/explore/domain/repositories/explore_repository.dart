import 'package:dartz/dartz.dart';
import '../../../../shared/domain/models/paginated_response.dart';
import '../../../../shared/exceptions/http_exception.dart';

abstract class ExploreRepository {
  Future<Either<AppException, PaginatedResponse>> fetchExplorePost({
    required int page,
    required Map<String, dynamic> filter,
  });
}
