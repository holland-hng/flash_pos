import 'package:core_dependency/core_dependency.dart';
import 'package:floor_table/features/floor_table/domain/furniture/table.dart';
import '/features/floor_table/domain/furniture/template_furniture.dart';
import '/features/floor_table/domain/furniture/furniture.dart';

abstract class FurnitureCreator {
  Rx<TemplateFurniture> get selectedTemplate;
  RxList<Furniture> get templateList;
  void clearSelection();
  void selectFurniture(Furniture furniture);
  bool isSelected(Furniture furniture);
}

@Injectable(as: FurnitureCreator)
class FurnitureCreatorImpl extends FurnitureCreator {
  @override
  final Rx<TemplateFurniture> selectedTemplate = Rx<TemplateFurniture>(
    const TemplateFurniture(mode: FurnitureCreateMode.none),
  );
  @override
  final RxList<Furniture> templateList = [
    const CircleTable(),
    const SquareTable(),
    const RectangleTable(
      width: 60,
      height: 120,
    ),
    const RectangleTable(),
  ].obs;

  @override
  void clearSelection() {
    selectedTemplate.value = const TemplateFurniture(
      mode: FurnitureCreateMode.none,
    );
  }

  @override
  void selectFurniture(Furniture furniture) {
    if (furniture != selectedTemplate.value.furniture) {
      selectedTemplate.value = TemplateFurniture(
        furniture: furniture,
        mode: FurnitureCreateMode.single,
      );
    } else {
      selectedTemplate.value = selectedTemplate.value.copyWith(
        furniture,
        selectedTemplate.value.mode.next,
      );
    }
  }

  @override
  bool isSelected(Furniture furniture) {
    return furniture == selectedTemplate.value.furniture;
  }
}
