import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:menu/features/menu/data/dto/menu.dart';
part 'menu_remote_data_source.g.dart';

@lazySingleton
@RestApi(parser: Parser.FlutterCompute)
abstract class MenuRemoteDataSource {
  @factoryMethod
  factory MenuRemoteDataSource(Dio dio) = _MenuRemoteDataSource;

  @GET("/categories.php")
  Future<MenuDto> getCategories();
}
