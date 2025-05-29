import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:state_notifier/state_notifier.dart';
import 'filter_state.dart';

class FilterNotifier extends StateNotifier<FilterState> {
  FilterNotifier() : super(FilterState.initial());
  void resetToInitial() {
    state = FilterState.initial();
  }

  void updateState({
    String? zipCode,
    double? radius,
    DateTime? startDate,
    DateTime? endDate,
    bool? isGarage,
    List<Category>? selectedCategories,
    List<PropertyTypeModel>? selectedPropertyTypes,
    String? propertyType,
    double? priceMin,
    double? priceMax,
    double? distance,
    List<String>? selectedBedrooms,
    List<String>? selectedBathrooms,
    String? sortBy,
    String? yearBuilt,
    String? coveredArea,
    String? lotSize,
  }) {
    state = state.copyWith(
      zipCode: zipCode ?? state.zipCode,
      radius: radius ?? state.radius,
      startDate: startDate ?? state.startDate,
      endDate: endDate ?? state.endDate,
      selectedCategories: selectedCategories ?? state.selectedCategories,
      selectedPropertyTypes:
          selectedPropertyTypes ?? state.selectedPropertyTypes,
      propertyType: propertyType ?? state.propertyType,
      priceMin: priceMin ?? state.priceMin,
      priceMax: priceMax ?? state.priceMax,
      distance: distance ?? state.distance,
      selectedBedrooms: selectedBedrooms ?? state.selectedBedrooms,
      selectedBathrooms: selectedBathrooms ?? state.selectedBathrooms,
      isGarage: isGarage ?? state.isGarage,
      isPetFriendly: state.isPetFriendly,
      sortBy: sortBy ?? state.sortBy,
      yearBuilt: yearBuilt ?? state.yearBuilt,
      coveredArea: coveredArea ?? state.coveredArea,
      lotSize: lotSize ?? state.lotSize,
    );
  }

  void updateGarage({bool? isGarage}) {
    state = state.copyWith(isGarage: isGarage);
  }

  void updateToInitial() {
    final stateVal = FilterState.initial();
    state = stateVal;
  }

  void toDateInitalState() {
    state = state.copyWithDate(sDate: DateTime.now(), eDate: null);
  }

  void toRadiusInitalState() {
    state = state.copyWithRadius(rad: null);
  }

  void updateRadius(double radius) {
    state = state.copyWith(radius: radius);
  }

  void updateZipCode(String zipCode) {
    state = state.copyWith(zipCode: zipCode);
  }

  void updateStartDate(DateTime startDate) {
    state = state.copyWith(startDate: startDate);
  }

  void updateEndDate(DateTime endDate) {
    state = state.copyWith(endDate: endDate);
  }

  void updateIsGarage(bool isGarage) {
    state = state.copyWith(isGarage: isGarage);
  }

  void updateCategories(Category category) {
    final List<Category> selectedCategories = [
      ...state.selectedCategories ?? []
    ];

    final isCatExist =
        selectedCategories.any((element) => element.id == category.id);
    if (isCatExist) {
      // Remove the category if it's already selected
      selectedCategories.removeWhere((element) => element.id == category.id);
    } else {
      // Add the category if it's not selected
      selectedCategories.add(category);
    }

    // Update the state with the modified list
    state = state.copyWith(selectedCategories: selectedCategories);
  }

  bool isSelectedCategory(Category category) {
    return (state.selectedCategories ?? []).any(
      (element) => element.id == category.id,
    );
  }

  void updateCat(Category cat) {
    try {
      // Create a new list of categories to ensure state change
      List<Category> categories = List.from(state.selectedCategories ?? []);

      if (categories.contains(cat)) {
        // Remove the category if it's already selected
        categories.removeWhere((element) => element.id == cat.id);
      } else {
        // Add the category if it's not selected
        categories.add(cat);
      }

      // Update the state with a new instance of Garageayard
      state = state.copyWith(selectedCategories: categories);
    } catch (e) {
      // log('UpdateCat Error: ${e.toString()}');
    }
  }

  void updatePropertyTypes(PropertyTypeModel propertyTypes) {
    try {
      // Create a new list of categories to ensure state change
      List<PropertyTypeModel> model = [...state.selectedPropertyTypes ?? []];

      if (model.contains(propertyTypes)) {
        // Remove the category if it's already selected
        model.removeWhere((element) => element.id == propertyTypes.id);
      } else {
        // Add the category if it's not selected
        model.add(propertyTypes);
      }

      // Update the state with a new instance of Garageayard
      state = state.copyWith(selectedPropertyTypes: model);
    } catch (e) {
      // log('UpdateCat Error: ${e.toString()}');
    }
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

  void updatePropertyType(String? propertyType) {
    state = state.copyWith(propertyType: propertyType);
  }

  void resetFilters() {
    state = FilterState();
  }
}
