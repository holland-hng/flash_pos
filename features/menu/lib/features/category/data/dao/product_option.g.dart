// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductOptionDaoAdapter extends TypeAdapter<ProductOptionDao> {
  @override
  final int typeId = 3;

  @override
  ProductOptionDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductOptionDao(
      mode: fields[2] as String,
      id: fields[0] as String,
      name: fields[1] as String,
      details: (fields[3] as List).cast<ProductOptionDetailDao>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductOptionDao obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.mode)
      ..writeByte(3)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOptionDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductOptionDetailDaoAdapter
    extends TypeAdapter<ProductOptionDetailDao> {
  @override
  final int typeId = 4;

  @override
  ProductOptionDetailDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductOptionDetailDao(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductOptionDetailDao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOptionDetailDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
