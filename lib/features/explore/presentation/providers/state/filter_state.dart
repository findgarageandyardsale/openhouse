import 'dart:convert';

import 'package:open_house/shared/domain/models/open_house/open_house.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/utils/cusotm_date_utils.dart';
import 'package:open_house/shared/utils/print_utils.dart';

class FilterState {
  final String? zipCode;
  final double? radius;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isGarage;
  final List<Category>? selectedCategories;

  //  final List<String> selectedCategories;
  final List<PropertyTypeModel>? selectedPropertyTypes;
  final String? propertyType;
  final double priceMin;
  final double priceMax;
  final double? distance;
  final List<String> selectedBedrooms;
  final List<String> selectedBathrooms;
  final bool isPetFriendly;
  final String sortBy;
  final String? yearBuilt;
  final String? coveredArea;
  final String? lotSize;

  FilterState({
    this.zipCode,
    this.radius,
    this.startDate,
    this.endDate,
    this.isGarage,
    this.selectedCategories,
    this.selectedPropertyTypes,
    this.propertyType,
    this.priceMin = 10000,
    this.priceMax = 1000000,
    this.distance,
    this.selectedBedrooms = const [],
    this.selectedBathrooms = const [],
    this.isPetFriendly = false,
    this.sortBy = 'Newest Listings',
    this.yearBuilt,
    this.coveredArea,
    this.lotSize,
  });

  FilterState copyWith({
    String? zipCode,
    double? radius,
    DateTime? startDate,
    bool? isGarage,
    DateTime? endDate,
    List<Category>? selectedCategories,
    List<PropertyTypeModel>? selectedPropertyTypes,
    String? propertyType,
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
      zipCode: zipCode ?? this.zipCode,
      radius: radius ?? this.radius,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isGarage: isGarage ?? this.isGarage,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      selectedPropertyTypes:
          selectedPropertyTypes ?? this.selectedPropertyTypes,
      propertyType: propertyType ?? this.propertyType,
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

  FilterState copyWithDate({DateTime? sDate, DateTime? eDate}) {
    return FilterState(
      zipCode: zipCode,
      radius: radius,
      startDate: sDate,
      endDate: eDate,
      isGarage: isGarage,
    );
  }

  FilterState copyWithRadius({double? rad}) {
    return FilterState(
      zipCode: zipCode,
      radius: rad,
      startDate: startDate,
      endDate: endDate,
      isGarage: isGarage,
    );
  }

  String get formattedStartDate {
    if (startDate != null && endDate != null) {
      return '${CustomDateUtils.formatDate(startDate ?? DateTime.now())} - ${CustomDateUtils.formatDate(endDate ?? DateTime.now())}';
    }
    return startDate != null
        ? CustomDateUtils.formatDate(startDate ?? DateTime.now())
        : '';
  }

  Map<String, dynamic> toJson() {
    String? sortByField;
    String? orderByField;

    // Map sortBy to appropriate sort_by and order_by values
    if (sortBy == 'Newest Listings') {
      sortByField = 'updated_at';
      orderByField = 'desc';
    } else if (sortBy == 'Lowest Price First') {
      sortByField = 'price';
      orderByField = 'asc';
    } else if (sortBy == 'Highest Price First') {
      sortByField = 'price';
      orderByField = 'desc';
    }
    Map<String, dynamic> map = {
      if (zipCode != null) 'zip_code': zipCode,
      if (radius != null) 'max_distance_km': ((radius ?? 0.0) * 1.60934),
      if (PrintUtils.radiusInAllChip)
        // if (radius == null) 'max_distance_km': (15 * 1.60934),

        if (selectedCategories != null)
          'category': (selectedCategories ?? []).map((e) => e.id).toList(),
      if (selectedPropertyTypes != null)
        'type': (selectedPropertyTypes ?? []).map((e) => e.id).toList(),
      if (selectedBedrooms.isNotEmpty) 'bedrooms': selectedBedrooms,
      if (selectedBathrooms.isNotEmpty) 'bathrooms': selectedBathrooms,
      if (isPetFriendly) 'is_pet_friendly': isPetFriendly,
      if (yearBuilt != null && !(yearBuilt ?? '').toLowerCase().contains('any'))
        'year_built': yearBuilt,
      if (coveredArea != null &&
          !(coveredArea ?? '').toLowerCase().contains('any'))
        'covered_area': coveredArea,
      if (lotSize != null && !(lotSize ?? '').toLowerCase().contains('any'))
        'lot_size': lotSize,
      if (priceMin != 10000) 'price_min': priceMin,
      if (priceMax != 1000000) 'price_max': priceMax,
      if (sortByField != null) 'sort_by': sortByField,
      if (orderByField != null) 'order_by': orderByField,
    };
    PrintUtils.customLog('FilterState.toJson: ${jsonEncode(map)}');
    return map;
  }

  // Factory constructor for the initial state
  factory FilterState.initial() {
    return FilterState(
      startDate: DateTime.now(),
      zipCode: null,
      endDate: null,
      radius: PrintUtils.radiusInAllChip ? null : 15,
      selectedCategories: null,
    );
  }
}

//employee daywork date filters enum
enum DateFilter { today, toWeek, toMonth, customRange }

extension DateFilterText on DateFilter {
  String get name {
    switch (this) {
      case DateFilter.today:
        return 'Today';
      case DateFilter.toWeek:
        return 'This Week';
      case DateFilter.toMonth:
        return 'This Month';
      case DateFilter.customRange:
        return 'Custom Range';
    }
  }
}
