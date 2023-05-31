import 'package:core_dependency/core_dependency.dart';

import 'furniture.dart';

enum FurnitureCreateMode {
  none,
  single,
  multiple,
}

extension FurnitureCreationModeExtension on FurnitureCreateMode {
  bool get isSingleMode {
    return this == FurnitureCreateMode.single;
  }

  FurnitureCreateMode get next {
    FurnitureCreateMode result;
    switch (this) {
      case FurnitureCreateMode.none:
        result = FurnitureCreateMode.single;
      case FurnitureCreateMode.single:
        result = FurnitureCreateMode.multiple;
      case FurnitureCreateMode.multiple:
        result = FurnitureCreateMode.none;
      default:
        throw UnimplementedError();
    }
    return result;
  }

  String get title {
    String result = '';
    switch (this) {
      case FurnitureCreateMode.none:
        result = "None";
      case FurnitureCreateMode.single:
        result = "Single";
      case FurnitureCreateMode.multiple:
        result = "Multi";
      default:
        throw UnimplementedError();
    }
    return result;
  }
}

class TemplateFurniture extends Equatable {
  final Furniture? furniture;
  final FurnitureCreateMode mode;

  const TemplateFurniture({
    this.furniture,
    required this.mode,
  });

  @override
  List<Object?> get props => [furniture, mode];

  TemplateFurniture copyWith(
    Furniture furniture,
    FurnitureCreateMode mode,
  ) {
    return TemplateFurniture(
      furniture: mode == FurnitureCreateMode.none ? null : furniture,
      mode: mode,
    );
  }
}
