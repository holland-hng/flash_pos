import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/src/customer_info/customer_info_popup.dart';
import 'package:customers_service/src/pick_customer/pick_customer_popup.dart';

@injectable
class CustomerService {
  final AppRouter appRouter;
  final PopupHandler popupHandler = PopupHandler.instance;

  CustomerService(this.appRouter);
  Future<Customer?> openCustomersList() async {
    final context = appRouter.router.navigatorKey.currentContext;
    if (context == null) {
      return null;
    }
    return await popupHandler.showPopup<Customer>(
      context: context,
      builder: (popupContext) {
        return const PickCustomerPopup();
      },
    );
  }

  Future<Customer?> openCustomerInfo(
    Customer customer, {
    CustomerInfoState state = CustomerInfoState.edit,
  }) async {
    final context = appRouter.router.navigatorKey.currentContext;
    if (context == null) {
      return null;
    }
    return await popupHandler.showPopup<Customer>(
      context: context,
      builder: (popupContext) {
        return CustomerInfoPopup(
          customer: customer,
          state: state,
        );
      },
    );
  }
}
