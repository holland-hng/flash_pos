import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

enum OrderStatus {
  waitingPurchase,
  completed,
  cancel,
}

extension OrderStatusExtension on OrderStatus {
  String title(BuildContext context) {
    switch (this) {
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
      OrderLeftPanelAction.fromState(
        state: OrderStatus.cancel,
        context: context,
      ),
    ];
  }
}
