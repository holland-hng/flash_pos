import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/di/di.dart';
import 'package:customers_service/src/customers/presentation/widgets/customer_info_view.dart';
import 'package:customers_service/src/customers/presentation/widgets/customers_view.dart';
import 'package:flutter/material.dart';
import 'customers_controller.dart';

@RoutePage()
class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  final customersController = getIt<CustomersController>();
  final expandableController = ExpandableController();
  final spaceController = ExpandableController(initialExpanded: true);

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    customersController.delegateToggleCustomerInfoView(toggleCustomerInfoView);
    Future.delayed(const Duration(seconds: 1)).then((value) {
      customersController.fetchCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.color.background,
      appBar: const FlashAppBar(title: 'Customers'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Row(
          children: [
            _SpacerView(spaceController),
            Expanded(
              flex: 2,
              child: CustomersView(
                controller: customersController,
              ),
            ),
            _SpacerView(spaceController),
            ExpandableNotifier(
              controller: expandableController,
              child: Expandable(
                collapsed: const Material(
                  color: Colors.transparent,
                  child: SizedBox(),
                ),
                expanded: Container(
                  margin: const EdgeInsets.only(left: 18),
                  child: const CustomerInfoView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleCustomerInfoView() {
    spaceController.toggle();
    expandableController.toggle();
  }
}

class _SpacerView extends StatelessWidget {
  const _SpacerView(
    this.controller,
  );

  final ExpandableController controller;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 18 * 3) * 1 / 6;
    return ExpandableNotifier(
      controller: controller,
      child: Expandable(
          collapsed: const SizedBox(),
          expanded: SizedBox(
            width: width,
          )),
    );
  }
}
