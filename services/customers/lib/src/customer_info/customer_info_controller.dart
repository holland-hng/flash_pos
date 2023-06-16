import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:customers_service/src/customer_info/customer_info_popup.dart';
import 'package:flutter/material.dart';

@injectable
class CustomerInfoController {
  final AppRouter appRouter;
  final Customer customer;
  @factoryMethod
  CustomerInfoController(
    @factoryParam CustomerInfoState state,
    @factoryParam this.customer,
    this.appRouter,
  ) {
    rxState = Rx<CustomerInfoState>(state);
  }
  late final Rx<CustomerInfoState> rxState;
  final RxBool rxIsUpdating = false.obs;

  String? fieldValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "This field is mandatory";
    }
    return null;
  }

  void changeState(CustomerInfoState state) {
    rxState.value = state;
  }

  Future<void> updateUserInfo(Customer customer) async {
    final context = appRouter.router.navigatorKey.currentContext;
    if (this.customer == customer) {
      Navigator.of(context!).pop<Customer>(customer);
    } else {
      rxIsUpdating.value = true;
      await Future.delayed(const Duration(seconds: 2));
      rxIsUpdating.value = false;
      // if success
      Navigator.of(context!).pop<Customer>(customer);
      // if fail
    }
  }
}
