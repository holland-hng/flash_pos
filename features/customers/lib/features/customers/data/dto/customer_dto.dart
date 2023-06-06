import 'package:core_dependency/core_dependency.dart';
part 'customer_dto.g.dart';

@JsonSerializable()
class CustomerDto {
  @JsonKey(name: 'strMeal')
  final String name;
  @JsonKey(name: 'strMealThumb')
  final String email;
  @JsonKey(name: 'idMeal')
  final String phoneNumber;
  @JsonKey(defaultValue: 'None')
  final String address;
  @JsonKey(defaultValue: 0)
  final int loyaltyPoint;

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
