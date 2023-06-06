import 'dart:async';

import 'package:core_dependency/core_dependency.dart';
import 'package:customers/features/customers/data/dto/customer_dto.dart';
part 'customers_dto.g.dart';

@JsonSerializable()
class CustomersDto {
  @JsonKey(name: 'meals')
  final List<CustomerDto> data;

  CustomersDto(this.data);

  factory CustomersDto.fromJson(Map<String, dynamic> json) =>
      _$CustomersDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CustomersDtoToJson(this);
}

FutureOr<CustomersDto> deserializeCustomersDto(Map<String, dynamic> json) =>
    CustomersDto.fromJson(json);
