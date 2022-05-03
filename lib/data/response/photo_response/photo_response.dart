import 'package:json_annotation/json_annotation.dart';

part 'photo_response.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'url')
  final String? url;

  Photo({
    this.id,
    this.createdAt,
    this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
