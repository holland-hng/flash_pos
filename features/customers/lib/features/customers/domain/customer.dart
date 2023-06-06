import 'package:core_dependency/core_dependency.dart';
import 'package:customers/features/customers/data/dto/customer_dto.dart';

class Customer extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final int loyaltyPoint;

  const Customer(
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.loyaltyPoint,
  );

  factory Customer.fromDto(CustomerDto dto) {
    return Customer(
      dto.name,
      dto.email,
      dto.phoneNumber,
      dto.address,
      dto.loyaltyPoint,
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
