// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeSlotModelImpl _$$TimeSlotModelImplFromJson(Map<String, dynamic> json) =>
    _$TimeSlotModelImpl(
      id: (json['id'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$$TimeSlotModelImplToJson(_$TimeSlotModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
