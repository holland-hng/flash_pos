import 'package:core_dependency/core_dependency.dart';
part 'customer_dto.g.dart';

@JsonSerializable()
class CustomerDto {
  @JsonKey(name: 'firstName')
  final String name;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'phone')
  final String phoneNumber;
  @JsonKey(name: 'eyeColor', defaultValue: 'None')
  final String address;
  @JsonKey(name: 'height', defaultValue: 0)
  final double loyaltyPoint;

  CustomerDto(
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.loyaltyPoint,
  );

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDtoToJson(this);
}
