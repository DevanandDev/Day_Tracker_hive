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
      category: fields[0] as String,
      timeSpend: fields[1] as String,
      dateAndTime: fields[2] as String?,
      description: fields[3] as String,
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
