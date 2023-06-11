import 'package:core_data/core_data.dart';
import 'package:menu/features/category/data/dao/category.dart';
import 'package:menu/features/category/data/dto/category.dart';

class Category {
  final String id;
  final String name;
  final String thumb;
  List<Product> products = [];

  Category(this.id, this.name, this.thumb);

  factory Category.fromDto(CategoryDto dto) {
    return Category(
      dto.id,
      dto.name,
      dto.thumb,
    );
  }
  factory Category.fromDao(CategoryDao dto) {
    return Category(
      dto.id,
      dto.name,
      dto.thumb,
    );
  }

  CategoryDao toDao() {
    return CategoryDao(
      id: id,
      name: name,
      thumb: thumb,
    );
  }
}
