import 'dart:async';

import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';

part 'products.g.dart';

@JsonSerializable()
class ProductsDto {
  @JsonKey(name: 'meals')
  final List<ProductDto> products;

  ProductsDto(this.products);

  factory ProductsDto.fromJson(Map<String, dynamic> json) =>
      _$ProductsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsDtoToJson(this);
}

FutureOr<ProductsDto> deserializeProductsDto(Map<String, dynamic> json) =>
    ProductsDto.fromJson(json);
