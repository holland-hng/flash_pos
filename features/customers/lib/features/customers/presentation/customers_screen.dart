import 'package:core_router/core_router.dart';

import 'package:core_ui/core_ui.dart';
import 'package:customers/di/di.dart';
import 'package:customers/features/customers/presentation/widgets/customer_info_view.dart';
import 'package:customers/features/customers/presentation/widgets/customers_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

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
      backgroundColor: context.color.background,
      appBar: const FlashAppBar(title: 'Customers'),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showAnimatedDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Container(
                    width: 400,
                    height: 600,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
          animationType: DialogTransitionType.slideFromBottomFade,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 300),
        );
      }),
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
