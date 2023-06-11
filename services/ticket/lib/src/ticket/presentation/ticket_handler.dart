import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import '../domain/ticket.dart';
import '../domain/ticket_section.dart';

enum TicketMode {
  draft,
  view,
  completed,
}

extension TicketModeExtension on TicketMode {
  bool get isCompleted {
    return this == TicketMode.completed;
  }
}

class TicketPrice {
  final double subTotal;
  final double tax;
  final int amount;
  final double total;

  TicketPrice(this.subTotal, this.tax, this.amount, this.total);
}

@injectable
class TicketHandler {
  final Rx<TicketMode> rxMode = Rx<TicketMode>(TicketMode.draft);
  final RxList<TicketSection> rxSections = RxList<TicketSection>([
    TicketSection.empty(),
  ]);

  TicketPrice get ticketPrice {
    int amount = 0;
    double subTotal = 0;
    final sections = rxSections;
    for (var section in sections) {
      for (var ticketItem in section.tickets) {
        amount += ticketItem.quantity;
        subTotal += ticketItem.price;
      }
    }
    return TicketPrice(
      subTotal,
      subTotal * 0.1,
      amount,
      subTotal * 1.1,
    );
  }

  void initialize({
    required TicketMode mode,
    required List<TicketSection> sections,
  }) {
    rxMode.value = mode;
    rxSections.value = sections;
  }

  void addTicketItem(TicketItem item) {
    try {
      final index = rxSections.first.tickets.indexOf(item);
      final oldItem = rxSections.first.tickets[index];
      rxSections.first.tickets[index] = oldItem.clone(
        quantity: oldItem.quantity + item.quantity,
      );
    } catch (e) {
      rxSections.first.tickets.value = [item] + rxSections.first.tickets;
    }
  }

  void removeItem(TicketItem item) {
    try {
      rxSections.first.tickets.remove(item);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateItem(TicketItem item) {
    try {
      final itemIndex = rxSections.first.tickets.indexWhere(
        (ticketItem) => ticketItem.id == item.id,
      );
      rxSections.first.tickets[itemIndex] = item;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
