import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/explore/data/datasource/explore_remote_datasource.dart';
import 'package:open_house/features/explore/data/repositories/explore_repository_imp.dart';
import 'package:open_house/features/explore/domain/repositories/explore_repository.dart';
import 'package:open_house/shared/data/remote/network_service.dart';

import '../../../../shared/domain/providers/dio_network_service_provider.dart';

final exploreDatasourceProvider =
    Provider.family<ExploreDatasource, NetworkService>(
      (_, networkService) => ExploreRemoteDatasource(networkService),
    );

final exploreRepositoryProvider = Provider<ExploreRepository>((ref) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.read(exploreDatasourceProvider(networkService));
  final respository = ExploreRepositoryImpl(datasource);
  return respository;
});
