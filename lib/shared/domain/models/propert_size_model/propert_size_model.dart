import 'package:freezed_annotation/freezed_annotation.dart';

part 'propert_size_model.freezed.dart';
part 'propert_size_model.g.dart';

@freezed
class PropertSizeModel with _$PropertSizeModel {
  factory PropertSizeModel({
    @JsonKey(name: 'covered_area') double? coveredArea,
    @JsonKey(name: 'lot_size') double? lotSize,
    int? bedrooms,
    int? bathrooms,
  }) = _PropertSizeModel;

  factory PropertSizeModel.fromJson(Map<String, dynamic> json) =>
      _$PropertSizeModelFromJson(json);
}
