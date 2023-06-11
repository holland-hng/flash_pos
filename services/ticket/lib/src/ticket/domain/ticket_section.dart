import 'dart:math';

import 'package:core_dependency/core_dependency.dart';
import 'ticket.dart';

class TicketSection {
  final String id;
  final String name;
  final RxList<TicketItem> tickets;

  TicketSection(this.id, this.name, this.tickets);

  factory TicketSection.empty() {
    final rng = Random();
    final id = rng.nextInt(1000000000);
    return TicketSection(
      id.toString(),
      '',
      RxList<TicketItem>(),
    );
  }
}
