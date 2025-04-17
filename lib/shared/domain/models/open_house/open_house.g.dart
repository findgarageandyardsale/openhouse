// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailableTimeSlotImpl _$$AvailableTimeSlotImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailableTimeSlotImpl(
      id: (json['id'] as num?)?.toInt(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      isEditable: json['isEditable'] as bool?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      garageYardId: json['property_id'] as String?,
    );

Map<String, dynamic> _$$AvailableTimeSlotImplToJson(
        _$AvailableTimeSlotImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'isEditable': instance.isEditable,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'property_id': instance.garageYardId,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      subLocality: json['sub_locality'] as String?,
      locality: json['locality'] as String?,
      subThoroughfare: json['sub_throughfare'] as String?,
      throughfare: json['throughfare'] as String?,
      subAdminArea: json['sub_admin_area'] as String?,
      adminArea: json['admin_area'] as String?,
      addressLine: json['address_line'] as String?,
      zipCode: json['zip_code'] as String?,
      apartmentNumber: json['apartment_number'] as String?,
      distanceFromUser: (json['distance_from_user'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'sub_locality': instance.subLocality,
      'locality': instance.locality,
      'sub_throughfare': instance.subThoroughfare,
      'throughfare': instance.throughfare,
      'sub_admin_area': instance.subAdminArea,
      'admin_area': instance.adminArea,
      'address_line': instance.addressLine,
      'zip_code': instance.zipCode,
      'apartment_number': instance.apartmentNumber,
      'distance_from_user': instance.distanceFromUser,
    };

_$OpenHouseImpl _$$OpenHouseImplFromJson(Map<String, dynamic> json) =>
    _$OpenHouseImpl(
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
      transactionId: json['transaction_id'] as String?,
      openHouseProperty: json['property'] == null
          ? null
          : OpenHouseProperty.fromJson(
              json['property'] as Map<String, dynamic>),
      propertySize: json['size'] == null
          ? null
          : PropertySize.fromJson(json['size'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$OpenHouseImplToJson(_$OpenHouseImpl instance) =>
    <String, dynamic>{
      'location': instance.location,
      'id': instance.id,
      'transaction_id': instance.transactionId,
      'property': instance.openHouseProperty,
      'size': instance.propertySize,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'status': _$StatusEnumEnumMap[instance.status],
    };

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'Active',
  StatusEnum.expired: 'Expired',
};

_$OpenHousePropertyImpl _$$OpenHousePropertyImplFromJson(
        Map<String, dynamic> json) =>
    _$OpenHousePropertyImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      attachments: (json['images'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      propertyType: json['type'] == null
          ? null
          : PropertyTypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OpenHousePropertyImplToJson(
        _$OpenHousePropertyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images': instance.attachments,
      'category': instance.category,
      'type': instance.propertyType,
    };

_$PropertySizeImpl _$$PropertySizeImplFromJson(Map<String, dynamic> json) =>
    _$PropertySizeImpl(
      coveredArea: (json['covered_area'] as num?)?.toInt(),
      lotSize: (json['lot_size'] as num?)?.toInt(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      yearBuilt: json['year_built'] == null
          ? null
          : DateTime.parse(json['year_built'] as String),
      availableTimeSlots: (json['available_time_slots'] as List<dynamic>?)
          ?.map((e) => AvailableTimeSlot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PropertySizeImplToJson(_$PropertySizeImpl instance) =>
    <String, dynamic>{
      'covered_area': instance.coveredArea,
      'lot_size': instance.lotSize,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'year_built': instance.yearBuilt?.toIso8601String(),
      'available_time_slots': instance.availableTimeSlots,
    };
