import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:delivery/features/delivery/domain/delivery_status.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: LeftPanelView<DeliveryLeftPanelAction>(
            title: "Delivery",
            onTap: (index, item) {},
            items: DeliveryLeftPanelAction.genActionPanelList(context),
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
              hint: 'Delivery\'s id...',
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
