import 'package:core_data/core_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:customers_service/src/customers/domain/customers_repository.dart';
import 'package:flutter/material.dart';

@injectable
class CustomersController {
  final Rx<BaseState> rxState = BaseState.idle.obs;
  final CustomerRepository repository;
  final RxList<Customer> rxCustomers = RxList();
  final List<Customer> storageCustomers = [];
  final Rxn<Customer> rxCustomerSelected = Rxn();
  Function? toggleCustomerInfoView;

  void delegateToggleCustomerInfoView(Function func) {
    toggleCustomerInfoView = func;
  }

  bool isSelected(Customer customer) {
    return customer == rxCustomerSelected.value;
  }

  CustomersController(this.repository);

  Future<void> fetchCustomers() async {
    rxState.value = BaseState.fetching;
    try {
      final result = await repository.getCustomers();
      storageCustomers.addAll(result);
      rxCustomers.addAll(result);
      rxState.value = BaseState.fetchSuccess;
    } catch (e) {
      debugPrint(e.toString());
      rxState.value = BaseState.fetchError;
    }
  }

  void expandCustomerView(Customer customer) {
    if (customer == rxCustomerSelected.value) {
      rxCustomerSelected.value = null;
      toggleCustomerInfoView?.call();
    } else {
      if (rxCustomerSelected.value == null) {
        toggleCustomerInfoView?.call();
      }
      rxCustomerSelected.value = customer;
    }
  }

  void search(String query) {
    //do something
  }
}

extension CustomerExtension on Customer {
  Color backgroundColor(BuildContext context, Customer? selected) {
    return this == selected ? context.color.tertiary : context.color.surface;
  }
}
