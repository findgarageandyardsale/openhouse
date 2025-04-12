import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/add_edit_sale/data/datasource/add_garage_remote_datasource.dart';
import 'package:open_house/features/add_edit_sale/data/repositories/get_property_type_repository.dart';

import '../../../shared/data/remote/network_service.dart';
import '../../../shared/domain/providers/dio_network_service_provider.dart';

final propertyTypeDatasourceProvider =
    Provider.family<AddGarageDatasource, NetworkService>(
      (_, networkService) => AddGarageRemoteDatasource(networkService),
    );

final propertyTypeRepositoryProvider = Provider<GetPropertyTypeRepository>((
  ref,
) {
  final networkService = ref.watch(netwokServiceProvider);
  final datasource = ref.read(propertyTypeDatasourceProvider(networkService));
  final respository = GetPropertyTypeRepositoryImpl(datasource);
  return respository;
});
