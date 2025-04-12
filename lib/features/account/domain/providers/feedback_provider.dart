import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_house/features/account/data/datasource/feedback_data_source.dart';
import 'package:open_house/features/account/domain/repository/feedback_repository.dart';
import 'package:open_house/shared/data/remote/network_service.dart';
import 'package:open_house/shared/domain/providers/dio_network_service_provider.dart';
import '../../data/repository/feedback_repository_impl.dart';

final feedbackSourceProvider =
    Provider.family<FeedbackDataSource, NetworkService>(
      (_, networkService) => FeedbackRemoteDataSource(networkService),
    );

final feedbackRepositoryProvider = Provider<FeedbackRepository>((ref) {
  final NetworkService networkService = ref.watch(netwokServiceProvider);

  final FeedbackDataSource dataSource = ref.read(
    feedbackSourceProvider(networkService),
  );

  return FeedbackRepositoryImpl(dataSource);
});
