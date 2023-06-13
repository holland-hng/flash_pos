import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/di/di.dart';
import 'package:customers_service/src/customers/presentation/customers_controller.dart';
import 'package:flutter/material.dart';
import 'customer_summary_view.dart';

class CustomersView extends StatefulWidget {
  final CustomersController? controller;
  const CustomersView({
    super.key,
    required this.controller,
  });

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  late CustomersController controller;
  @override
  void initState() {
    controller = widget.controller ?? getIt<CustomersController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        18.0.vertical,
        SizedBox(
          height: 36,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: const SearchField(
                    hintText: 'Phone number...',
                  ),
                ),
              ),
              12.0.horizontal,
              InkWell(
                onTap: () {},
                child: Ink(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: context.color.primary,
                  ),
                  child: Center(
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: context.color.surface,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        18.0.vertical,
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 0.5),
            decoration: BoxDecoration(
              color: context.color.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: const CustomerSummaryView(),
          ),
        ),
        Flexible(
          child: Obx(() {
            if (controller.rxState.value.isFetching) {
              return Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: context.color.primary,
                ),
              );
            }
            if (controller.rxState.value.isError) {
              return const Center(
                child: Text("Error"),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.only(bottom: 36),
              shrinkWrap: true,
              itemCount: controller.rxCustomers.length,
              itemBuilder: (context, index) {
                final customer = controller.rxCustomers[index];
                return Obx(() {
                  return Material(
                    color: customer.backgroundColor(
                        context, controller.rxCustomerSelected.value),
                    child: InkWell(
                      onTap: () {
                        controller.expandCustomerView(customer);
                      },
                      child: SizedBox(
                        height: 60,
                        child: CustomerSummaryView(
                          name: customer.name,
                          phone: customer.phoneNumber,
                          email: customer.email,
                          address: customer.address,
                          loyaltyPoint: customer.loyaltyPoint.toString(),
                        ),
                      ),
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) {
                return const HorDivider();
              },
            );
          }),
        ),
      ],
    );
  }
}
