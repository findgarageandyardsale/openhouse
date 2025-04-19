// To parse this JSON data, do
//
//     final OpenHouse = OpenHouseFromJson(jsonString);

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_house/shared/domain/models/attachment_file/attachment_model.dart';
import 'package:open_house/shared/domain/models/property_type_model/property_type_model.dart';
import 'package:open_house/shared/domain/models/user/user_model.dart';

part 'open_house.freezed.dart';
part 'open_house.g.dart';

@freezed
class AvailableTimeSlot with _$AvailableTimeSlot {
  const factory AvailableTimeSlot({
    int? id,
    DateTime? date,
    bool? isEditable,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'property_id') String? garageYardId,
  }) = _AvailableTimeSlot;

  factory AvailableTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$AvailableTimeSlotFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({int? id, String? name}) = _Category;

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
                   "sub_locality": data['street_number'],
        "locality": data['city'],
        "admin_area": data['state'],
        "zip_code": data['zip_code'],
        "sub_throughfare": data['suite_apt'],
        "throughfare": data['street_name'],
        "latitude": data['latitude'],
        "longitude": data['longitude'],

*/
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
class OpenHouse with _$OpenHouse {
  const factory OpenHouse({
    LocationModel? location,
    @JsonKey(readValue: readValueForId) int? id,
    @JsonKey(name: 'transaction_id') String? transactionId,
    @JsonKey(name: 'property') OpenHouseProperty? openHouseProperty,
    @JsonKey(name: 'size') PropertySize? propertySize,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'created_by') User? createdBy,
    StatusEnum? status,
  }) = _OpenHouse;

  factory OpenHouse.fromJson(Map<String, dynamic> json) =>
      _$OpenHouseFromJson(json);
}

int? readValueForId(Map map, String key) => map[key] ?? map['id_'];

// Enum for Garage
enum StatusEnum {
  @JsonValue('Active')
  active,
  @JsonValue('Expired')
  expired,
}

@freezed
class OpenHouseProperty with _$OpenHouseProperty {
  const factory OpenHouseProperty({
    String? name,
    String? description,
    int? price,
    @JsonKey(name: 'images') List<AttachmentModel>? attachments,
    Category? category,
    @JsonKey(name: 'type') PropertyTypeModel? propertyType,
    StatusEnum? status,
  }) = _OpenHouseProperty;

  factory OpenHouseProperty.fromJson(Map<String, dynamic> json) =>
      _$OpenHousePropertyFromJson(json);
}

@freezed
class PropertySize with _$PropertySize {
  const factory PropertySize({
    @JsonKey(name: 'covered_area') int? coveredArea,
    @JsonKey(name: 'lot_size') int? lotSize,
    @JsonKey(name: 'bedrooms') int? bedrooms,
    @JsonKey(name: 'bathrooms') int? bathrooms,
    @JsonKey(name: 'year_built') DateTime? yearBuilt,
    @JsonKey(name: 'available_time_slots')
    List<AvailableTimeSlot>? availableTimeSlots,
  }) = _PropertySize;

  factory PropertySize.fromJson(Map<String, dynamic> json) =>
      _$PropertySizeFromJson(json);
}
