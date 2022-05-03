// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_fact.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailFactAdapter extends TypeAdapter<DetailFact> {
  @override
  final int typeId = 0;

  @override
  DetailFact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailFact(
      description: fields[0] as String,
      data: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DetailFact obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailFactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
