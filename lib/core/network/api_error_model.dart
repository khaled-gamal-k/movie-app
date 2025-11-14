// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable(createToJson: false)
class ApiErrorModel {
  final String? code;
  final String? message;
  final String? data;

  const ApiErrorModel({this.code, this.message, this.data});

  factory ApiErrorModel.fromJson(json) => _$ApiErrorModelFromJson(json);
}
