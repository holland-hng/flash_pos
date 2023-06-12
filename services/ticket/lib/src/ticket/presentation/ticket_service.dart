import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:ticket_service/src/ticket/domain/ticket_mode.dart';
import 'package:ticket_service/src/ticket/domain/ticket_price.dart';
import '../domain/ticket.dart';
import '../domain/ticket_section.dart';

@injectable
class TicketService {
  final EventBus eventBus;
  final Rx<TicketMode> rxMode = Rx<TicketMode>(TicketMode.draft);
  final Rxn<Customer> rxCustomer = Rxn<Customer>();
  final RxList<TicketSection> rxSections = RxList<TicketSection>([
    TicketSection.empty(),
  ]);

  TicketService(this.eventBus);

  void initialize({
    required TicketMode mode,
    required List<TicketSection> sections,
  }) {
    rxMode.value = mode;
    rxSections.value = sections;
  }

  void setCustomer(Customer customer) {
    rxCustomer.value = customer;
  }

  void openPickCustomer() {
    eventBus.fire(PickCustomerEvent());
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

  void clearAllData() {
    rxCustomer.value = null;
    rxSections.first.tickets.clear();
  }
}
