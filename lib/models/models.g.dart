// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyDatasAdapter extends TypeAdapter<MyDatas> {
  @override
  final int typeId = 0;

  @override
  MyDatas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyDatas(
      category: fields[0] as dynamic,
      timeSpend: fields[1] as dynamic,
      dateAndTime: fields[2] as dynamic,
      description: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MyDatas obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.timeSpend)
      ..writeByte(2)
      ..write(obj.dateAndTime)
      ..writeByte(3)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyDatasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 1;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      name: fields[0] as dynamic,
      age: fields[1] as dynamic,
      email: fields[2] as dynamic,
      address: fields[3] as dynamic,
      image: fields[4] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
