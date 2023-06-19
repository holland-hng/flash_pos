import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/customers_service.dart';
import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/category/presentation/category_controller.dart';
import 'package:menu/features/menu/domain/menu_repository.dart';
import 'package:ticket_service/ticket_service.dart';

@injectable
class MenuFlashController {
  final MenuRepository menuRepository;
  final TicketService ticketService;
  final CustomerService customerService;

  final EventBus eventBus;
  final RxList<Category> rxCategories = <Category>[].obs;
  final Rx<BaseState> rxState = BaseState.idle.obs;

  MenuFlashController(
    this.menuRepository,
    this.ticketService,
    this.eventBus,
    this.customerService,
  );

  @postConstruct
  void initialize() {
    eventBus.on<PickCustomerEvent>().listen((event) async {
      final result = await customerService.openCustomersList();
      if (result == null) {
        //do nothing
      } else {
        ticketService.setCustomer(result);
      }
    });
    eventBus.on<OpenCustomerPopupEvent>().listen((event) async {
      final result = await customerService.openCustomerInfo(event.data);
      if (result == null) {
        //do nothing
      } else {
        ticketService.setCustomer(result);
      }
    });
  }

  Future<void> fetchData() async {
    rxState.value = BaseState.fetching;
    //fetchFromLocal();
    try {
      final result = await menuRepository.getCategories();
      var futures = <Future>[];
      for (var category in result) {
        futures.add(getProducts(category));
      }
      await Future.wait(futures);
      rxCategories.clear();
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

  Future<Category> getProducts(Category category) async {
    final categoryController = getIt<CategoryController>(param1: category);
    await categoryController.fetchData();
    final count = categoryController.rxProducts.length > 12
        ? 12
        : categoryController.rxProducts.length;
    category.products =
        categoryController.rxProducts.getRange(0, count).toList();
    return category;
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
