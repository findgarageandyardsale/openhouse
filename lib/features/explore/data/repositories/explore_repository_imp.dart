import 'package:dartz/dartz.dart';
import 'package:open_house/features/explore/data/datasource/explore_remote_datasource.dart';

import 'package:open_house/features/explore/domain/repositories/explore_repository.dart';
import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/models/paginated_response.dart';
import 'package:open_house/shared/exceptions/http_exception.dart';

class ExploreRepositoryImpl extends ExploreRepository {
  final ExploreDatasource exploreDatasource;
  ExploreRepositoryImpl(this.exploreDatasource);

  @override
  Future<Either<AppException, PaginatedResponse>> fetchExplorePost({
    required int page,
    required Map<String, dynamic> filter,
  }) {
    return exploreDatasource.fetchPaginatedPosts(
      skip: page,
      queryParam: filter,
    );
  }

  @override
  Future<Either<AppException, OpenHouse>> fetchDetailPost({
    required int? id,
  }) {
    return exploreDatasource.fetchDetailPosts(
      id: id,
    );
  }
}
