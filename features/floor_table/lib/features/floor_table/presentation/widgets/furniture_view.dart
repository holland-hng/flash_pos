import 'package:floor_table/features/floor_table/domain/furniture/furniture.dart';
import 'package:flutter/material.dart';

class FurnitureCard extends Positioned {
  final FurnitureDisplay furniture;
  final TextStyle defaultTextStyle;
  final Function(DragTargetDetails<Furniture>) onAcceptWithDetails;
  final Function(Furniture) onTapFurniture;
  final Function(DragUpdateDetails) onDragUpdate;

  FurnitureCard({
    super.key,
    required this.furniture,
    required this.defaultTextStyle,
    required this.onTapFurniture,
    required this.onAcceptWithDetails,
    required this.onDragUpdate,
  }) : super(
          left: furniture.dx,
          top: furniture.dy,
          child: DragTarget<Furniture>(
            onWillAccept: (_) => true,
            onAcceptWithDetails: onAcceptWithDetails,
            builder: (context, _, __) {
              return Draggable<Furniture>(
                onDragUpdate: onDragUpdate,
                data: furniture,
                feedback: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: furniture.borderRadius,
                    gradient: furniture.draggingGradient,
                    border: Border.all(
                      width: 0.5,
                      color: Colors.grey.shade300,
                    ),
                    shape: furniture.shape.boxShape,
                  ),
                  width: furniture.width,
                  height: furniture.height,
                  child: Center(
                    child: Text(
                      furniture.name,
                      style: defaultTextStyle.merge(
                        const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                childWhenDragging: const SizedBox(),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    radius: 20,
                    borderRadius: furniture.clipRRectBorderRadius,
                    onTap: () {
                      onTapFurniture(furniture);
                    },
                    child: Ink(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: furniture.borderRadius,
                        gradient: furniture.state.gradient,
                        border: Border.all(
                          width: 0.5,
                          color: Colors.grey.shade300,
                        ),
                        shape: furniture.shape.boxShape,
                      ),
                      width: furniture.width,
                      height: furniture.height,
                      child: Center(
                        child: Text(
                          furniture.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
}
