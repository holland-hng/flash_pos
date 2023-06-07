import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/cart/presentation/cart_handler.dart';
import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/menu/domain/menu_repository.dart';

@injectable
class MenuFlashController {
  final MenuRepository menuRepository;
  final CartHandler cartHandler;
  final RxList<Category> rxCategories = <Category>[].obs;
  final Rx<BaseState> rxState = BaseState.idle.obs;

  List<String> get categoryTitles {
    return rxCategories.map((category) => category.name).toList();
  }

  MenuFlashController(this.menuRepository, this.cartHandler);

  Future<void> fetchData() async {
    rxState.value = BaseState.fetching;
    fetchFromLocal();
    try {
      final result = await menuRepository.getCategories();
      rxCategories.value = result;
      rxState.value = BaseState.fetchSuccess;
    } catch (e) {
      debugPrint(e.toString());
      if (rxCategories.isEmpty) {
        rxState.value = BaseState.fetchError;
      } else {
        //fetch local success -> popup show network error
      }
    }
  }

  void fetchFromLocal() {
    try {
      if (rxCategories.isNotEmpty) {
        return;
      }
      final result = menuRepository.getCachedCategories();
      if (result.isNotEmpty) {
        rxCategories.value = result;
        rxState.value = BaseState.fetchSuccess;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
