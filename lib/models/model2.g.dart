// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyprofileAdapter extends TypeAdapter<Myprofile> {
  @override
  final int typeId = 1;

  @override
  Myprofile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Myprofile(
      name: fields[0] as String?,
      phone: fields[1] as String?,
      email: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Myprofile obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyprofileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
