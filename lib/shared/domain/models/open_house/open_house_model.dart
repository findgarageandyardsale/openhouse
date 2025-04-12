// To parse this JSON data, do
//
//     final OpenHouse = OpenHouseFromJson(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/propert_size_model/propert_size_model.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';

part 'open_house_model.freezed.dart';
part 'open_house_model.g.dart';

@freezed
class OpenHouse with _$OpenHouse {
  const factory OpenHouse({
    int? id,
    String? title,
    String? description,
    int? price,
    @JsonKey(name: 'furnish_status') FurnishingEnum? furnishingStatus,
    StatusEnum? status,
    LocationModel? location,
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'available_time_slots')
    List<AvailableTimeSlot>? availableTimeSlots,
    List<Category>? category,
    @JsonKey(name: 'images') List<AttachmentModel>? attachments,
    @JsonKey(name: 'amenities') List<String>? amenities,
    @JsonKey(name: 'property_size') PropertSizeModel? propertyModel,

    @JsonKey(name: 'property_type') PropertyTypeModel? propertyType,
    @JsonKey(name: 'year_built') DateTime? yearBuilt,
    @JsonKey(name: 'is_pet_friendly') bool? isPetFriendly,
    @JsonKey(name: 'is_utility_include') bool? isUtilityInclude,
    @JsonKey(name: 'distance_from_location')
    double? distanceFromLocation, // in miles
  }) = _OpenHouse;

  factory OpenHouse.fromJson(Map<String, dynamic> json) =>
      _$OpenHouseFromJson(json);
}

// Enum for Garage
enum StatusEnum {
  @JsonValue('active')
  active,
  @JsonValue('expired')
  expired,
}

// Enum for Garage
enum FurnishingEnum {
  @JsonValue('Fully Furnished')
  fullyFurnished,
  @JsonValue('Semi-Furnished')
  semiFurnished,
  @JsonValue('Unfurnished')
  unfurnished,
  @JsonValue('Under Construction')
  underConstruction,
}

@freezed
class AvailableTimeSlot with _$AvailableTimeSlot {
  const factory AvailableTimeSlot({
    int? id,
    DateTime? date,
    bool? isEditable,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'garage_yard_id') int? garageYardId,
  }) = _AvailableTimeSlot;

  factory AvailableTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimeSlotFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    String? name,
    @JsonKey(name: 'property_category') String? propertyCategory,
    @JsonKey(name: 'property_type') String? propertyType,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    int? id,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'sub_locality') String? subLocality,
    String? locality,
    @JsonKey(name: 'sub_throughfare') String? subThoroughfare,
    String? throughfare,
    @JsonKey(name: 'sub_admin_area') String? subAdminArea,
    @JsonKey(name: 'admin_area') String? adminArea,
    @JsonKey(name: 'address_line') String? addressLine,
    @JsonKey(name: 'zip_code') String? zipCode,
    @JsonKey(name: 'apartment_number') String? apartmentNumber,
    @JsonKey(name: 'distance_from_user') double? distanceFromUser, // in miles
  }) = _LocationModel;

  /*
                "id": 9,
                "latitude": 27.6588,
                "longitude": 85.3247,
                "sub_locality": "Suite 101",
                "locality": "Lalitpur",
                "sub_admin_area": null,
                "admin_area": "Bagmati Province",
                "address_line": null,
                "zip_code": "44700",
                "apartment_number": null,
                "sub_throughfare": "1234",
                "throughfare": "Jhamsikhel Rd"
                

                -------------------------------
                  "sub_locality": data['suite_apt'],
        "locality": data['city'],
        "admin_area": data['state'],
        "zip_code": data['zip_code'],
        "sub_throughfare": data['street_number'],
        "throughfare": data['street_name'],
        "latitude": data['latitude'],
        "longitude": data['longitude'],

*/
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
