import 'package:json_annotation/json_annotation.dart';

part 'production_country.g.dart';

@JsonSerializable(createToJson: false)
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;

  const ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(json) => _$ProductionCountryFromJson(json);
}
