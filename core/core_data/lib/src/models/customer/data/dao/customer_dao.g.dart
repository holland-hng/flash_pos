// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerDaoAdapter extends TypeAdapter<CustomerDao> {
  @override
  final int typeId = 7;

  @override
  CustomerDao read(BinaryReader reader) {
    return CustomerDao();
  }

  @override
  void write(BinaryWriter writer, CustomerDao obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.loyaltyPoint);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
