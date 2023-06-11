import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/data/dao/category_products.dart';
import 'package:menu/features/category/data/repository/category_remote_data_source.dart';
import 'package:menu/features/category/domain/category_repository.dart';
import 'category_local_data_source.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final CategoryLocalDataSource localDataSource;

  CategoryRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Product>> getProducts(String category) async {
    final response = await remoteDataSource.getProducts(category);
    final result =
        response.products.map((dto) => Product.fromDto(dto)).toList();
    localDataSource.cacheProducts(CategoryProductsDao(
      category,
      result.map((e) => e.toDao()).toList(),
    ));

    return result;
  }

  @override
  List<Product> getCachedProducts(String category) {
    final cached = localDataSource.getProducts(category);
    final result = cached.map((e) => Product.fromDao(e)).toList();
    return result;
  }
}
