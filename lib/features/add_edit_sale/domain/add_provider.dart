import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/shared/data/remote/network_service.dart';

import '../../../shared/domain/providers/dio_network_service_provider.dart';
import '../data/datasource/add_garage_remote_datasource.dart';
import '../data/repositories/add_repository.dart';

final addDatasourceProvider =
    Provider.family<AddGarageDatasource, NetworkService>(
      (_, networkService) => AddGarageRemoteDatasource(networkService),
    );
final addRepositoryProvider = Provider<AddRepository>((ref) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.read(addDatasourceProvider(networkService));
  final respository = AddRepositoryImpl(datasource);
  return respository;
});
