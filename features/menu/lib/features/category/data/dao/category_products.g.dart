// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_products.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryProductsDaoAdapter extends TypeAdapter<CategoryProductsDao> {
  @override
  final int typeId = 2;

  @override
  CategoryProductsDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryProductsDao(
      fields[0] as String,
      (fields[1] as List).cast<ProductDao>(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryProductsDao obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryProductsDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
