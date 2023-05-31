import 'package:core_dependency/core_dependency.dart';
part 'product.g.dart';

@JsonSerializable()
class ProductDto {
  @JsonKey(name: 'idMeal')
  final String id;
  @JsonKey(name: 'strMeal')
  final String name;
  @JsonKey(name: 'strMealThumb')
  final String thumb;

  ProductDto(this.id, this.name, this.thumb);

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
