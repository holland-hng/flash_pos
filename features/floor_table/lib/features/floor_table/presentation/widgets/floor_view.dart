import 'package:core_dependency/core_dependency.dart';
import '/features/floor_table/domain/furniture/furniture.dart';
import '/features/floor_table/presentation/controllers/floor_controller.dart';
import 'package:flutter/material.dart';
import 'furniture_view.dart';

class FloorView extends StatefulWidget {
  final FloorController floorController;
  const FloorView({super.key, required this.floorController});

  @override
  State<FloorView> createState() => _FloorViewState();
}

class _FloorViewState extends State<FloorView> {
  late FloorController floorController = widget.floorController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context).style;
    return Align(
      alignment: Alignment.topCenter,
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: LayoutBuilder(
          builder: (context, constrain) {
            floorController.onScaleScreen(constrain);
            return RepaintBoundary(
              child: Obx(
                () {
                  final furnitureList = floorController.furnitureList;
                  return Stack(
                    children: [
                      DragTarget<Furniture>(
                        onWillAccept: (_) => true,
                        onAcceptWithDetails: (details) {
                          floorController.moveFurniture(
                            context: context,
                            targetLocalPosition: details.offset,
                            furniture: details.data,
                          );
                        },
                        builder: (context, _, __) {
                          return GestureDetector(
                            onTapDown: (detail) {
                              floorController.addFurniture(
                                positionCenter: detail.localPosition,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          );
                        },
                      ),
                      ...furnitureList.map<Positioned>(
                        (furniture) {
                          return FurnitureCard(
                            key: ValueKey(furniture.id),
                            defaultTextStyle: defaultTextStyle,
                            furniture: floorController.produceFurnitureDisplay(
                              furniture,
                            ),
                            onTapFurniture: floorController.onTapFurniture,
                            onAcceptWithDetails: (details) {
                              floorController.moveFurniture(
                                context: context,
                                targetLocalPosition: details.offset,
                                furniture: details.data,
                              );
                            },
                            onDragUpdate: (details) {
                              floorController.hightLightDraggingFurniture(
                                details.delta,
                                furniture,
                              );
                            },
                          );
                        },
                      ).toList(),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
