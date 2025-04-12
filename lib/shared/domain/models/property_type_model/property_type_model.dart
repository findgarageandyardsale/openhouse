import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_type_model.freezed.dart';
part 'property_type_model.g.dart';

@freezed
class PropertyTypeModel with _$PropertyTypeModel {
  factory PropertyTypeModel({int? id, String? name}) = _PropertyTypeModel;

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeModelFromJson(json);
}
