import 'package:json_annotation/json_annotation.dart';

part 'fact_response.g.dart';

@JsonSerializable()
class Fact {
  @JsonKey(name: '_id')
  final String? sId;
  @JsonKey(name: 'text')
  final String? text;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'createdAt')
  final String? createdAt;

  Fact({
    this.sId,
    this.text,
    this.updatedAt,
    this.type,
    this.createdAt,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => _$FactFromJson(json);

  Map<String, dynamic> toJson() => _$FactToJson(this);
}
