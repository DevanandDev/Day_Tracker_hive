// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelProfile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDatasAdapter extends TypeAdapter<UserDatas> {
  @override
  final int typeId = 1;

  @override
  UserDatas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDatas(
      username: fields[0] as String?,
      email: fields[1] as String?,
      images: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDatas obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDatasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
