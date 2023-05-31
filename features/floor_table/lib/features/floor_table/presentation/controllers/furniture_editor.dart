import 'package:core_dependency/core_dependency.dart';
import 'package:floor_table/features/floor_table/domain/furniture/furniture.dart';
import 'package:flutter/material.dart';

@injectable
class FurnitureEditor {
  final Rxn<Furniture> rxFurniture = Rxn();

  bool _isOpenEditor = false;
  bool get isOpenEditor => _isOpenEditor;
  bool get isCloseEditor => !_isOpenEditor;
  double get dxFurniture => rxFurniture.value?.dx ?? 0;
  double get dyFurniture => rxFurniture.value?.dy ?? 0;

  Function(bool)? delegateExpandState;
  Function(Furniture furniture)? delegateEditFurniture;
  Function(Furniture)? delegateDeleteFurniture;
  Function()? delegateCloseEditor;

  void delegateControlExpandState(Function(bool) func) {
    delegateExpandState = func;
  }

  void delegateEditor({
    required Function(Furniture) editFurniture,
    required Function(Furniture) deleteFurniture,
    required Function() closeEditor,
  }) {
    delegateEditFurniture = editFurniture;
    delegateDeleteFurniture = deleteFurniture;
    delegateCloseEditor = closeEditor;
  }

  void openEditor(Furniture? source) {
    final furniture = source?.clone(state: FurnitureState.selected);
    if (_isOpenEditor) {
      if (rxFurniture.value?.id == furniture?.id && furniture != null) {
        rxFurniture.value = null;
      } else {
        rxFurniture.value = furniture;
      }
    } else {
      _isOpenEditor = true;
      delegateExpandState?.call(_isOpenEditor);
      rxFurniture.value = furniture;
    }
  }

  void resetFurniture(Furniture? furniture) {
    rxFurniture.value = furniture?.clone(state: FurnitureState.selected);
  }

  void closeEditor() {
    rxFurniture.value = null;
    _isOpenEditor = false;
    delegateCloseEditor?.call();
    delegateExpandState?.call(_isOpenEditor);
  }

  void deleteFurniture() {
    Furniture? furniture = rxFurniture.value?.clone();
    if (furniture == null) {
      debugPrint("editFurniture: furniture == null");
      return;
    }
    rxFurniture.value = null;
    delegateDeleteFurniture?.call(furniture);
  }

  void editFurniture(
    FurnitureProperty property,
    String data,
  ) {
    Furniture? furniture = rxFurniture.value;

    if (furniture == null) {
      debugPrint("editFurniture: furniture == null");
      return;
    }
    final dataDouble = double.tryParse(data);
    switch (property) {
      case FurnitureProperty.name:
        furniture = furniture.clone(name: data);
        break;
      case FurnitureProperty.dx:
        furniture = furniture.clone(dx: dataDouble);
        break;
      case FurnitureProperty.dy:
        furniture = furniture.clone(dy: dataDouble);
        break;
      case FurnitureProperty.width:
        if (furniture.shape.isCircle) {
          furniture = furniture.clone(width: dataDouble, height: dataDouble);
        } else {
          furniture = furniture.clone(width: dataDouble);
        }

        break;
      case FurnitureProperty.height:
        if (furniture.shape.isCircle) {
          furniture = furniture.clone(width: dataDouble, height: dataDouble);
        } else {
          furniture = furniture.clone(height: dataDouble);
        }
        break;
      default:
        throw UnimplementedError();
    }
    rxFurniture.value = furniture;
    delegateEditFurniture?.call(furniture);
  }
}

enum FurnitureProperty {
  name,
  dx,
  dy,
  width,
  height,
}

extension FurnitureSummaryExtension on FurnitureProperty {
  bool get isNumeric {
    return this != FurnitureProperty.name;
  }

  String get label {
    String result;
    switch (this) {
      case FurnitureProperty.name:
        result = 'Name';
      case FurnitureProperty.dx:
        result = 'dx';
      case FurnitureProperty.dy:
        result = 'dy';
      case FurnitureProperty.width:
        result = 'Width';
      case FurnitureProperty.height:
        result = 'Height';
      default:
        throw UnimplementedError();
    }
    return result;
  }

  String get hintText {
    String result;
    switch (this) {
      case FurnitureProperty.name:
        result = 'Enter furniture\'s name';
      case FurnitureProperty.dx:
        result = 'Enter dx';
      case FurnitureProperty.dy:
        result = 'Enter dy';
      case FurnitureProperty.width:
        result = 'Enter width';
      case FurnitureProperty.height:
        result = 'Enter height';
      default:
        throw UnimplementedError();
    }
    return result;
  }

  TextInputType get textInputType {
    TextInputType result;
    switch (this) {
      case FurnitureProperty.name:
        result = TextInputType.none;
      case FurnitureProperty.dx:
      case FurnitureProperty.dy:
      case FurnitureProperty.width:
      case FurnitureProperty.height:
        result = TextInputType.number;
      default:
        throw UnimplementedError();
    }
    return result;
  }
}
