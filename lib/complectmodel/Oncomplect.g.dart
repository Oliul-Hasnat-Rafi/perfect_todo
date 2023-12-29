// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Oncomplect.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OncomplectAdapter extends TypeAdapter<Oncomplect> {
  @override
  final int typeId = 12;

  @override
  Oncomplect read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Oncomplect(
      comid: fields[10] as int?,
      comtitle: fields[11] as String?,
      comsubtitle: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Oncomplect obj) {
    writer
      ..writeByte(3)
      ..writeByte(10)
      ..write(obj.comid)
      ..writeByte(11)
      ..write(obj.comtitle)
      ..writeByte(12)
      ..write(obj.comsubtitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OncomplectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
