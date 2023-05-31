import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'furniture_dimensions_view.dart';
import 'furniture_info_textfield.dart';
import 'package:core_dependency/core_dependency.dart';
import '/features/floor_table/presentation/controllers/furniture_editor.dart';

class FurnitureEditView extends StatefulWidget {
  const FurnitureEditView({
    super.key,
    this.width = 300,
    required this.expandableController,
    required this.furnitureEditor,
    this.closeEditor,
  });
  final double width;
  final FurnitureEditor furnitureEditor;
  final ExpandableController expandableController;
  final Function()? closeEditor;

  @override
  State<FurnitureEditView> createState() => _FurnitureEditViewState();
}

class _FurnitureEditViewState extends State<FurnitureEditView> {
  late FurnitureEditor furnitureEditor = widget.furnitureEditor;
  late ExpandableController expandableController = widget.expandableController;
  @override
  void initState() {
    super.initState();
    calculateHeight();
    furnitureEditor.delegateControlExpandState(controlExpandState);
  }

  late double height;
  late double paddingTop;

  void controlExpandState(bool needExpand) {
    setState(() {
      expandableController.value = needExpand;
    });
  }

  void calculateHeight() {
    height = (Get.width - widget.width - 48 - 240) * 10 / 16;
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: widget.expandableController,
      child: Expandable(
        collapsed: Container(
          color: Colors.white,
        ),
        expanded: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 18, 12, 12),
            margin: const EdgeInsets.only(left: 12, right: 18, bottom: 18),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            height: height,
            width: widget.width,
            child: widget.expandableController.value == false
                ? null
                : Obx(() {
                    final furniture = furnitureEditor.rxFurniture.value;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(bottom: 12),
                            itemCount: 5,
                            shrinkWrap: false,
                            itemBuilder: (BuildContext context, int index) {
                              switch (index) {
                                case (0):
                                  return FurnitureInfoTextfield(
                                    initValue: furniture?.name ?? "",
                                    property: FurnitureProperty.name,
                                    onSubmitted: (data) =>
                                        furnitureEditor.editFurniture(
                                            FurnitureProperty.name, data),
                                  );
                                case (1):
                                  return FurnitureDimensionsView(
                                    initValue:
                                        furniture?.dx.toStringAsFixed(2) ?? "",
                                    property: FurnitureProperty.dx,
                                    onSubmitted: (data) =>
                                        furnitureEditor.editFurniture(
                                            FurnitureProperty.dx, data),
                                  );
                                case (2):
                                  return FurnitureDimensionsView(
                                    initValue:
                                        furniture?.dy.toStringAsFixed(2) ?? "",
                                    property: FurnitureProperty.dy,
                                    onSubmitted: (data) =>
                                        furnitureEditor.editFurniture(
                                            FurnitureProperty.dy, data),
                                  );
                                case (3):
                                  return FurnitureDimensionsView(
                                    initValue:
                                        furniture?.width.toStringAsFixed(0) ??
                                            "",
                                    property: FurnitureProperty.width,
                                    onSubmitted: (data) =>
                                        furnitureEditor.editFurniture(
                                            FurnitureProperty.width, data),
                                  );
                                case (4):
                                  return FurnitureDimensionsView(
                                    initValue:
                                        furniture?.height.toStringAsFixed(0) ??
                                            "",
                                    property: FurnitureProperty.height,
                                    onSubmitted: (data) =>
                                        furnitureEditor.editFurniture(
                                            FurnitureProperty.height, data),
                                  );

                                default:
                                  return Text(index.toString());
                              }
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _ActionButton(
                                editAction: EditAction.delete,
                                onTap: furnitureEditor.deleteFurniture,
                              ),
                              const SizedBox(width: 12),
                              _ActionButton(
                                editAction: EditAction.minimize,
                                onTap: furnitureEditor.closeEditor,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

enum EditAction {
  minimize,
  delete,
}

extension EditActionExtension on EditAction {
  Color get color {
    switch (this) {
      case EditAction.minimize:
        return Colors.blueGrey;
      case EditAction.delete:
        return Colors.red;
      default:
        throw UnimplementedError();
    }
  }

  IconData get iconData {
    switch (this) {
      case EditAction.minimize:
        return Icons.keyboard_double_arrow_right_outlined;
      case EditAction.delete:
        return Icons.delete_outline_sharp;
      default:
        throw UnimplementedError();
    }
  }
}

class _ActionButton extends StatelessWidget {
  final Function()? onTap;
  final EditAction editAction;

  const _ActionButton({this.onTap, required this.editAction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Ink(
            height: 44,
            decoration: BoxDecoration(
              color: editAction.color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Icon(
                editAction.iconData,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
