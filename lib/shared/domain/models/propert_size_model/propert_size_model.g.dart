// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propert_size_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertSizeModelImpl _$$PropertSizeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertSizeModelImpl(
      coveredArea: (json['covered_area'] as num?)?.toDouble(),
      lotSize: (json['lot_size'] as num?)?.toDouble(),
      bedrooms: json['bedrooms'] as String?,
      bathrooms: json['bathrooms'] as String?,
    );

Map<String, dynamic> _$$PropertSizeModelImplToJson(
        _$PropertSizeModelImpl instance) =>
    <String, dynamic>{
      'covered_area': instance.coveredArea,
      'lot_size': instance.lotSize,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
    };
