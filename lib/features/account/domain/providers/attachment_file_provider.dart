import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/data/datasource/attachment_file_data_source.dart';
import 'package:open_house/features/account/data/repository/attachment_file_respository_impl.dart';
import 'package:open_house/features/account/domain/repository/attachment_file_repository.dart';
import 'package:open_house/shared/data/remote/network_service.dart';
import 'package:open_house/shared/domain/providers/dio_network_service_provider.dart';

final attachmentFileDataSourceProvider =
    Provider.family<AttachmentFileDataSource, NetworkService>(
      (_, networkService) => AttachmentFileRemoteDataSource(networkService),
    );

final attachmentFileRepositoryProvider = Provider<AttachmentFileRepository>((
  ref,
) {
  final NetworkService networkService = ref.watch(netwokServiceProvider);

  final AttachmentFileDataSource dataSource = ref.read(
    attachmentFileDataSourceProvider(networkService),
  );

  return AttachmentFileRespositoryImpl(dataSource);
});
