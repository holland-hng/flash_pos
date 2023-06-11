import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/category/domain/category_repository.dart';

@injectable
class CategoryController {
  final Category category;
  final CategoryRepository repository;
  final Rx<BaseState> rxState = BaseState.idle.obs;
  final RxList<Product> rxProducts = <Product>[].obs;

  CategoryController(@factoryParam this.category, this.repository);

  Future<void> fetchData() async {
    rxState.value = BaseState.fetching;
    getFromLocal();
    try {
      final result = await repository.getProducts(category.name);
      rxProducts.value = result;
      rxState.value = BaseState.fetchSuccess;
    } catch (e) {
      debugPrint(e.toString());
      if (rxProducts.isEmpty) {
        rxState.value = BaseState.fetchError;
      } else {
        //fetch local success -> popup show network error
      }
    }
  }

  void getFromLocal() {
    try {
      if (rxProducts.isNotEmpty) {
        return;
      }
      final result = repository.getCachedProducts(category.name);
      if (result.isNotEmpty) {
        rxProducts.value = result;
        rxState.value = BaseState.fetchSuccess;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
