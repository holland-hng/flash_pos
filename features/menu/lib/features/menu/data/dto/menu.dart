import 'dart:async';

import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/data/dto/category.dart';
part 'menu.g.dart';

@JsonSerializable()
class MenuDto {
  @JsonKey(name: 'categories')
  final List<CategoryDto> data;

  MenuDto(this.data);
  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MenuDtoToJson(this);
}

FutureOr<MenuDto> deserializeMenuDto(Map<String, dynamic> json) =>
    MenuDto.fromJson(json);
