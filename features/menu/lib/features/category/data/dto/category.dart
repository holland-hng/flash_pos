import 'package:core_dependency/core_dependency.dart';
part 'category.g.dart';

@JsonSerializable()
class CategoryDto {
  @JsonKey(name: 'idCategory')
  final String id;
  @JsonKey(name: 'strCategory')
  final String name;
  @JsonKey(name: 'strCategoryThumb')
  final String thumb;

  CategoryDto(this.id, this.name, this.thumb);

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);
}
