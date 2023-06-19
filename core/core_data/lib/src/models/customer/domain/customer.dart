import 'package:core_dependency/core_dependency.dart';
import '../data/dto/customer_dto.dart';

class CreateCustomerModel extends Customer {
  const CreateCustomerModel();
}

class Customer extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final int loyaltyPoint;

  const Customer({
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.address = '',
    this.loyaltyPoint = 0,
  });

  Customer copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? address,
  }) {
    return Customer(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      loyaltyPoint: loyaltyPoint,
    );
  }

  factory Customer.fromDto(CustomerDto dto) {
    final cells = dto.phoneNumber.split(' ');
    cells.removeAt(0);
    final phone = '0${cells.join()}';
    return Customer(
      name: dto.name,
      email: dto.email,
      phoneNumber: phone,
      address: dto.address,
      loyaltyPoint: dto.loyaltyPoint.toInt(),
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        phoneNumber,
        address,
        loyaltyPoint,
      ];
}
