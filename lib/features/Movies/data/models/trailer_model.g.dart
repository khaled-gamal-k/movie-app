// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trailer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrailerModel _$TrailerModelFromJson(Map<String, dynamic> json) => TrailerModel(
  iso6391: json['iso_639_1'] as String?,
  iso31661: json['iso_3166_1'] as String?,
  name: json['name'] as String?,
  key: json['key'] as String?,
  site: json['site'] as String?,
  size: (json['size'] as num?)?.toInt(),
  type: json['type'] as String?,
  official: json['official'] as bool?,
  publishedAt: json['published_at'] == null
      ? null
      : DateTime.parse(json['published_at'] as String),
  id: json['id'] as String?,
);
