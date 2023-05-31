import 'dart:math';
import 'package:floor_table/features/floor_table/domain/floor.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:floor_table/features/floor_table/presentation/controllers/floor_size_calculator.dart';
import 'package:flutter/material.dart';
import '../../domain/furniture/template_furniture.dart';
import '/features/floor_table/domain/furniture/furniture.dart';
import 'furniture_creator.dart';
import 'furniture_editor.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

enum FloorMode {
  edit,
  multiSelect,
}

@injectable
class FloorController {
  final FloorSizeCalculator floorSizeCalculator;
  final FurnitureCreator furnitureCreator;
  final FurnitureEditor furnitureEditor;
  final Rx<FloorMode> mode = FloorMode.edit.obs;
  final RxMap<String, Furniture> rxFurnitureMap = <String, Furniture>{}.obs;
  final Floor floor = Floor(height: 500, width: 800, name: "Floor");

  FloorController(
    this.floorSizeCalculator,
    this.furnitureCreator,
    this.furnitureEditor,
  ) {
    furnitureEditor.delegateEditor(
      editFurniture: editFurniture,
      deleteFurniture: deleteFurniture,
      closeEditor: closeEditor,
    );
  }

  List<Furniture> get furnitureList {
    return rxFurnitureMap.entries.map<Furniture>((e) {
      return e.value;
    }).toList();
  }

  void closeEditor() {
    clearHightLight();
  }

  void moveFurniture({
    required BuildContext context,
    required Furniture furniture,
    required Offset targetLocalPosition,
  }) {
    final globalPosition = floorSizeCalculator.calculateFloorGlobalPosition(
      context: context,
    );

    final dxLocal = targetLocalPosition.dx - globalPosition.dx;
    final dyLocal = targetLocalPosition.dy - globalPosition.dy;

    final position = floorSizeCalculator.calculatePositionViaRatio(
      Offset(dxLocal, dyLocal),
    );

    final draggedFurniture = rxFurnitureMap[furniture.id]!.clone(
      dx: position.dx,
      dy: position.dy,
    );

    bool isOutFloorArea = position.dx < 0 ||
        position.dx > floor.width - draggedFurniture.width ||
        position.dy < 0 ||
        position.dy > floor.height - draggedFurniture.height;

    if (isOutFloorArea) {
      //do nothing
      return;
    } else {
      //make furniture has been dragged to above all the rest
      rxFurnitureMap.remove(furniture.id);
      rxFurnitureMap[furniture.id] = draggedFurniture;

      //update preview furniture in edit view
      if (draggedFurniture.isAvailable) {
        hightLightFurniture(draggedFurniture);
      }
      furnitureEditor.resetFurniture(draggedFurniture);
    }
  }

  void onScaleScreen(BoxConstraints constrain) {
    floorSizeCalculator.calculateRatioFloor(
      constrain: constrain,
      widthFloor: floor.width,
    );
  }

  void addFurniture({
    required Offset positionCenter,
  }) {
    final selectedTemplate = furnitureCreator.selectedTemplate.value;
    if (selectedTemplate.furniture == null ||
        selectedTemplate.mode == FurnitureCreateMode.none) {
      debugPrint("selectedTemplate == null");
      return;
    }
    NumberFormat formatter = NumberFormat("00");
    final name = formatter.format(rxFurnitureMap.length + 1).toString();

    final position =
        floorSizeCalculator.calculatePositionViaRatio(positionCenter);

    final template = selectedTemplate.furniture!;
    var rng = Random();
    final furniture = template.clone(
      id: rng.nextInt(1000000).toString(),
      dx: position.dx - template.width / 2,
      dy: position.dy - template.height / 2,
      width: template.width,
      height: template.height,
      name: name,
    );

    rxFurnitureMap[furniture.id] = furniture;

    if (selectedTemplate.mode.isSingleMode) {
      furnitureCreator.clearSelection();
    }
    furnitureEditor.resetFurniture(furniture);
    hightLightFurniture(furniture);
  }

  FurnitureDisplay produceFurnitureDisplay(Furniture furniture) {
    //TODO: HACKING CODE ---
    bool isEditing = furnitureEditor.isOpenEditor;
    FurnitureState stateDragging =
        isEditing ? FurnitureState.selected : FurnitureState.available;
    LinearGradient draggingGradient = stateDragging.gradient;
    //-----
    return FurnitureDisplay(
      furniture: furniture,
      ratioFloor: floorSizeCalculator.ratioFloor,
      draggingGradient: draggingGradient,
    );
  }

  void onTapFurniture(Furniture furnitureDisplay) {
    furnitureEditor.openEditor(rxFurnitureMap[furnitureDisplay.id]!);
    furnitureCreator.clearSelection();
    hightLightFurniture(furnitureDisplay);
  }

  void hightLightDraggingFurniture(
    Offset delta,
    Furniture furnitureDisplay,
  ) {
    final furniture = rxFurnitureMap[furnitureDisplay.id]!;
    if (furniture.isSelected) {
      //do nothing
    } else {
      hightLightFurniture(furnitureDisplay);
    }

    if (furnitureEditor.isOpenEditor) {
      final newDelta = floorSizeCalculator.calculatePositionViaRatio(delta);
      furnitureEditor.resetFurniture(
        furniture.clone(
          dx: furnitureEditor.dxFurniture + newDelta.dx,
          dy: furnitureEditor.dyFurniture + newDelta.dy,
        ),
      );
    }
  }

  void clearHightLight() {
    rxFurnitureMap.updateAll((key, furniture) {
      if (furniture.isAvailable) {
        return furniture;
      }
      return furniture.clone(state: FurnitureState.available);
    });
  }

  void hightLightFurniture(Furniture furnitureDisplay) {
    if (furnitureEditor.isCloseEditor) {
      //when editor close, highlight has no mean
      return;
    }
    final id = furnitureDisplay.id;

    switch (mode.value) {
      case FloorMode.edit:
        rxFurnitureMap.updateAll((key, furniture) {
          if (key == id) {
            return furniture.toggleSelected();
          }
          if (furniture.isAvailable) {
            return furniture;
          }
          return furniture.clone(state: FurnitureState.available);
        });
        break;
      case FloorMode.multiSelect:
        rxFurnitureMap.update(id, (value) => value.toggleSelected());
        break;
      default:
        throw UnimplementedError();
    }
  }

  void editFurniture(
    Furniture furniture,
  ) {
    final String id = furniture.id;
    rxFurnitureMap.update(id, (value) => furniture);
  }

  void deleteFurniture(Furniture furniture) {
    final String id = furniture.id;
    rxFurnitureMap.remove(id);
  }
}
