import 'package:json_annotation/json_annotation.dart';

part 'base_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseRequest {
  bool? status;
  int? statusCode;
  String? message;

  BaseRequest({this.message, this.status, this.statusCode});

  factory BaseRequest.fromJson(Map<String, dynamic> json) =>
      _$BaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRequestToJson(this);
}
