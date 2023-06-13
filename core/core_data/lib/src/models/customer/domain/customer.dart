import 'package:core_dependency/core_dependency.dart';
import '../data/dto/customer_dto.dart';

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
    final cells = dto.phoneNumber.split(' ');
    cells.removeAt(0);
    final phone = '0${cells.join()}';
    return Customer(
      dto.name,
      dto.email,
      phone,
      dto.address,
      dto.loyaltyPoint.toInt(),
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
