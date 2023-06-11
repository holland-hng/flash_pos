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
    return Scaffold(
      backgroundColor: context.color.background,
      appBar: const FlashAppBar(title: 'Orders'),
      body: Row(
        children: [
          Expanded(
            flex: 11,
            child: Container(
              color: context.color.background,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: context.color.surface,
            ),
          )
        ],
      ),
    );
  }
}
