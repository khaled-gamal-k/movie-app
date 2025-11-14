import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable(createToJson: false)
class Genre {
  final int? id;
  final String? name;

  const Genre({this.id, this.name});

  factory Genre.fromJson(json) => _$GenreFromJson(json);
}
