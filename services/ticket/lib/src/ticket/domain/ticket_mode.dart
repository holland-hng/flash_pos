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
