import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/menu/domain/menu_repository.dart';

import 'menu_local_data_source.dart';
import 'menu_remote_data_source.dart';

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource remoteDataSource;
  final MenuLocalDataSource localDataSource;

  MenuRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<Category>> getCategories() async {
    final response = await remoteDataSource.getCategories();
    final result = response.data.map((dto) => Category.fromDto(dto)).toList();
    localDataSource.cacheCategories(result);
    return result;
  }

  @override
  List<Category> getCachedCategories() {
    final result = localDataSource.getCategories();
    return result;
  }
}
