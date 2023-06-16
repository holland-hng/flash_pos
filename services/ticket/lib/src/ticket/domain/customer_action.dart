import 'package:flutter/material.dart';

enum CustomerAction {
  edit,
  replace,
  remove,
  close,
}

extension CustomerActionExtension on CustomerAction {
  String title(BuildContext context) {
    switch (this) {
      case CustomerAction.edit:
        return "Update customer info";
      case CustomerAction.replace:
        return "Replace customer";
      case CustomerAction.remove:
        return "Remove customer";
      case CustomerAction.close:
        return "Close";
      default:
        throw UnimplementedError();
    }
  }

  IconData get iconData {
    switch (this) {
      case CustomerAction.edit:
        return Icons.edit;
      case CustomerAction.replace:
        return Icons.manage_accounts;
      case CustomerAction.remove:
        return Icons.delete;
      case CustomerAction.close:
        return Icons.cancel;
      default:
        throw UnimplementedError();
    }
  }
}
