// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BaseResponse<T>(
  id: (json['id'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
  results: _$nullableGenericFromJson(json['results'], fromJsonT),
  totalResults: (json['total_results'] as num?)?.toInt(),
);

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);
