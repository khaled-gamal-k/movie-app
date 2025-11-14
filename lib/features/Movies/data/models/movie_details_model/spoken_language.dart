import 'package:json_annotation/json_annotation.dart';

part 'spoken_language.g.dart';

@JsonSerializable(createToJson: false)
class SpokenLanguage {
  @JsonKey(name: 'english_name')
  final String? englishName;
  @JsonKey(name: 'iso_639_1')
  final String? iso6391;
  final String? name;

  const SpokenLanguage({this.englishName, this.iso6391, this.name});

  factory SpokenLanguage.fromJson(json) => _$SpokenLanguageFromJson(json);
}
