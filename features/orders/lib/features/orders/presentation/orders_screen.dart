import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: LeftPanelView<OrderLeftPanelAction>(
            title: "Orders",
            onTap: (index, item) {},
            items: OrderLeftPanelAction.genActionPanelList(context),
          ),
        ),
        Expanded(
          flex: 8,
          child: Scaffold(
            backgroundColor: context.color.background,
            appBar: FlashSearchBar(
              onChanged: (value) {
                debugPrint("Menu search: $value");
              },
              actions: [
                Material(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {},
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.color.primary,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.tune,
                              color: context.color.surface,
                              size: 20,
                            ),
                            4.0.horizontal,
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                "Filter : Today",
                                style: context.typo.body1.semiBold.mergeColor(
                                  context.color.surface,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
              hint: 'Order\'s id...',
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: context.color.surface,
          ),
        )
      ],
    );
  }
}

enum OrderStatus {
  draft,
  waitingPurchase,
  completed,
  cancel,
}

extension OrderStatusExtension on OrderStatus {
  String title(BuildContext context) {
    switch (this) {
      case OrderStatus.draft:
        return "Draft";
      case OrderStatus.waitingPurchase:
        return "Waiting purchase";
      case OrderStatus.completed:
        return "Completed";
      case OrderStatus.cancel:
        return "Cancel";
      default:
        throw UnimplementedError();
    }
  }
}

class OrderLeftPanelAction extends LeftPanelAction {
  final OrderStatus state;

  OrderLeftPanelAction(super.title, this.state);

  factory OrderLeftPanelAction.fromState(
      {required OrderStatus state, required BuildContext context}) {
    return OrderLeftPanelAction(
      state.title(context),
      state,
    );
  }

  static List<OrderLeftPanelAction> genActionPanelList(BuildContext context) {
    return [
      OrderLeftPanelAction.fromState(
        state: OrderStatus.waitingPurchase,
        context: context,
      ),
      OrderLeftPanelAction.fromState(
        state: OrderStatus.completed,
        context: context,
      ),
    ];
  }
}
