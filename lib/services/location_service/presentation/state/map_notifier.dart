// lib/notifiers/map_notifier.dart
import 'package:open_house/services/location_service/data/repositories/location_repositoru_impl.dart';
import 'package:open_house/shared/utils/permission_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:state_notifier/state_notifier.dart';
import 'location_state.dart';

class MapNotifier extends StateNotifier<LocationState> {
  final LocationRepositoryImpl locationRepository;

  MapNotifier(this.locationRepository) : super(LocationState.initial()) {
    // Use Future.microtask to schedule the initialization after the widget tree is built
    Future.microtask(() => _initialize());
  }

  Future<void> _initialize() async {
    try {
      bool isGranted = await PermissionUtils().isLocationPermissionGranted();
      if (isGranted) {
        await getUserLocation();
      } else {
        state = state.copyWith(
          isLoading: false,
          error: 'Location permission is required.',
        );
      }
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to check location permission.',
      );
    }
  }

  // Method to get the user location
  Future<void> getUserLocation() async {
    try {
      state = state.copyWith(isLoading: true);
      final position = await locationRepository.getCurrentPosition();
      state = state.copyWith(
        isLoading: false,
        currentLatLng: LatLng(position.latitude, position.longitude),
        error: null,
      );
    } catch (e) {
      if (mounted) {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to get location: $e',
        );
      }
    }
  }
}
