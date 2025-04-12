import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterState {
  final List<String> selectedCategories;
  final List<String> selectedPropertyTypes;
  final double priceMin;
  final double priceMax;
  final double distance;
  final List<String> selectedBedrooms;
  final List<String> selectedBathrooms;
  final bool isPetFriendly;
  final String sortBy;
  final String? yearBuilt;
  final String? coveredArea;
  final String? lotSize;

  const FilterState({
    this.selectedCategories = const ['ALL'],
    this.selectedPropertyTypes = const ['ALL'],
    this.priceMin = 10000,
    this.priceMax = 1000000,
    this.distance = 0,
    this.selectedBedrooms = const [],
    this.selectedBathrooms = const [],
    this.isPetFriendly = false,
    this.sortBy = 'Newest Listings',
    this.yearBuilt,
    this.coveredArea,
    this.lotSize,
  });

  FilterState copyWith({
    List<String>? selectedCategories,
    List<String>? selectedPropertyTypes,
    double? priceMin,
    double? priceMax,
    double? distance,
    List<String>? selectedBedrooms,
    List<String>? selectedBathrooms,
    bool? isPetFriendly,
    String? sortBy,
    String? yearBuilt,
    String? coveredArea,
    String? lotSize,
  }) {
    return FilterState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      selectedPropertyTypes:
          selectedPropertyTypes ?? this.selectedPropertyTypes,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      distance: distance ?? this.distance,
      selectedBedrooms: selectedBedrooms ?? this.selectedBedrooms,
      selectedBathrooms: selectedBathrooms ?? this.selectedBathrooms,
      isPetFriendly: isPetFriendly ?? this.isPetFriendly,
      sortBy: sortBy ?? this.sortBy,
      yearBuilt: yearBuilt ?? this.yearBuilt,
      coveredArea: coveredArea ?? this.coveredArea,
      lotSize: lotSize ?? this.lotSize,
    );
  }
}

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(const FilterState());

  void updateCategories(List<String> categories) {
    state = state.copyWith(selectedCategories: categories);
  }

  void updatePropertyTypes(List<String> propertyTypes) {
    state = state.copyWith(selectedPropertyTypes: propertyTypes);
  }

  void updatePriceRange(double min, double max) {
    state = state.copyWith(priceMin: min, priceMax: max);
  }

  void updateDistance(double distance) {
    state = state.copyWith(distance: distance);
  }

  void updateBedrooms(List<String> bedrooms) {
    state = state.copyWith(selectedBedrooms: bedrooms);
  }

  void updateBathrooms(List<String> bathrooms) {
    state = state.copyWith(selectedBathrooms: bathrooms);
  }

  void updateSortBy(String sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void updateYearBuilt(String? yearBuilt) {
    state = state.copyWith(yearBuilt: yearBuilt);
  }

  void updateCoveredArea(String? coveredArea) {
    state = state.copyWith(coveredArea: coveredArea);
  }

  void updateLotSize(String? lotSize) {
    state = state.copyWith(lotSize: lotSize);
  }

  void resetFilters() {
    state = const FilterState();
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, FilterState>((
  ref,
) {
  return FilterNotifier();
});
