import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:orders/features/orders/domain/order_status.dart';

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
                FilterButton(
                  callBack: (option) {
                    debugPrint(option.toString());
                  },
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
