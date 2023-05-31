import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:menu/features/category/data/dto/products.dart';
part 'category_remote_data_source.g.dart';

@lazySingleton
@RestApi(parser: Parser.FlutterCompute)
abstract class CategoryRemoteDataSource {
  @factoryMethod
  factory CategoryRemoteDataSource(Dio dio) = _CategoryRemoteDataSource;

  @GET("/filter.php")
  Future<ProductsDto> getProducts(
    @Query("c") String category,
  );
}
