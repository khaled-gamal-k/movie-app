import 'package:json_annotation/json_annotation.dart';

part 'trailer_model.g.dart';

@JsonSerializable(createToJson: false)
class TrailerModel {
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  @JsonKey(name: 'published_at')
  final DateTime? publishedAt;
  final String? id;

  const TrailerModel({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  factory TrailerModel.fromJson(json) => _$TrailerModelFromJson(json);
}
