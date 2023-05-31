import 'package:core_data/core_data.dart';
import 'package:menu/core/database/database.dart';

part 'category.g.dart';

@HiveType(typeId: HiveIdentify.categoryId)
class CategoryDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String thumb;

  CategoryDao({
    required this.id,
    required this.name,
    required this.thumb,
  });
}
