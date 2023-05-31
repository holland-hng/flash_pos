// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDaoAdapter extends TypeAdapter<ProductDao> {
  @override
  final int typeId = 1;

  @override
  ProductDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDao(
      id: fields[0] as String,
      name: fields[1] as String,
      thumb: fields[2] as String,
      price: fields[3] as double,
      options: (fields[4] as List).cast<ProductOptionDao>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductDao obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.thumb)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
