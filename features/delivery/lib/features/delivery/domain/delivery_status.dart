import 'package:core_data/core_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

enum DeliveryStatus implements IEnum {
  waitingConfirm,
  confirmed,
  completed,
  cancel;

  @override
  String title(BuildContext context) {
    switch (this) {
      case DeliveryStatus.waitingConfirm:
        return "Waiting confirm";
      case DeliveryStatus.confirmed:
        return "Confirmed";
      case DeliveryStatus.completed:
        return "Completed";
      case DeliveryStatus.cancel:
        return "Cancel";

      default:
        throw UnimplementedError();
    }
  }
}

class DeliveryLeftPanelAction extends LeftPanelAction {
  final DeliveryStatus state;

  DeliveryLeftPanelAction(super.title, this.state);

  factory DeliveryLeftPanelAction.fromState(
      {required DeliveryStatus state, required BuildContext context}) {
    return DeliveryLeftPanelAction(
      state.title(context),
      state,
    );
  }

  static List<DeliveryLeftPanelAction> genActionPanelList(
      BuildContext context) {
    return [
      DeliveryLeftPanelAction.fromState(
        state: DeliveryStatus.waitingConfirm,
        context: context,
      ),
      DeliveryLeftPanelAction.fromState(
        state: DeliveryStatus.confirmed,
        context: context,
      ),
      DeliveryLeftPanelAction.fromState(
        state: DeliveryStatus.completed,
        context: context,
      ),
      DeliveryLeftPanelAction.fromState(
        state: DeliveryStatus.cancel,
        context: context,
      ),
    ];
  }
}
