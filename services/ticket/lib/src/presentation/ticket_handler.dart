import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:ticket_service/src/domain/ticket.dart';
import 'package:ticket_service/src/domain/ticket_section.dart';

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

@injectable
class TicketHandler {
  final Rx<TicketMode> rxMode = Rx<TicketMode>(TicketMode.draft);
  final RxList<TicketSection> rxSections = RxList<TicketSection>([
    TicketSection.empty(),
  ]);

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
      debugPrint(e.toString());
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
