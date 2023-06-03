import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/cart/presentation/cart_handler.dart';
import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/menu/domain/menu_repository.dart';

@injectable
class MenuFlashController {
  final MenuRepository _repository;
  final CartHandler cartHandler;
  final RxList<Category> rxCategories = <Category>[].obs;
  final Rx<BaseState> rxState = BaseState.idle.obs;
  final RxList<CartItem> rxOrderItems = RxList();

  List<String> get categoryTitles {
    return rxCategories.map((category) => category.name).toList();
  }

  MenuFlashController(this._repository, this.cartHandler);

  Future<void> fetchData() async {
    rxState.value = BaseState.fetching;
    fetchFromLocal();
    try {
      final result = await _repository.getCategories();
      rxCategories.value = result;
      rxState.value = BaseState.fetchingSuccess;
    } catch (e) {
      debugPrint(e.toString());
      if (rxCategories.isEmpty) {
        rxState.value = BaseState.fetchingError;
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
      final result = _repository.getCachedCategories();
      if (result.isNotEmpty) {
        rxCategories.value = result;
        rxState.value = BaseState.fetchingSuccess;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
