import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:menu/features/place_order/domain/order_item.dart';
import 'package:menu/features/place_order/presentation/place_order_controller.dart';
import 'package:menu/features/place_order/presentation/widgets/receipt_view.dart';

import 'widgets/confirm_order_view.dart';

@RoutePage()
class PlaceOrderScreen extends StatefulWidget {
  final List<OrderItem> orderItems;
  const PlaceOrderScreen({super.key, required this.orderItems});

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final placeOrderController = getIt<PlaceOrderController>();
  @override
  void initState() {
    placeOrderController.initialize(widget.orderItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Place order",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(child: ConfirmOrderView()),
          Expanded(child: ReceiptView()),
        ],
      ),
    );
  }
}
