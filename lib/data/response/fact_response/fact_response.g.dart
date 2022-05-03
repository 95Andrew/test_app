// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fact _$FactFromJson(Map<String, dynamic> json) => Fact(
      sId: json['_id'] as String?,
      text: json['text'] as String?,
      updatedAt: json['updatedAt'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$FactToJson(Fact instance) => <String, dynamic>{
      '_id': instance.sId,
      'text': instance.text,
      'updatedAt': instance.updatedAt,
      'type': instance.type,
      'createdAt': instance.createdAt,
    };
