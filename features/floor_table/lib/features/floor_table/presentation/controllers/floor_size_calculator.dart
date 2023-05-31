import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';

abstract class FloorSizeCalculator {
  double get ratioFloor;
  Offset calculateFloorGlobalPosition({required BuildContext context});
  double calculateRatioFloor({
    required BoxConstraints constrain,
    required double widthFloor,
  });
  Offset calculatePositionViaRatio(Offset offset);
}

@Injectable(as: FloorSizeCalculator)
class FloorSizeCalculatorImpl extends FloorSizeCalculator {
  @override
  late double ratioFloor; //distance for 1 percent

  @override
  Offset calculateFloorGlobalPosition({required BuildContext context}) {
    Offset result;
    try {
      final renderBox = context.findRenderObject() as RenderBox?;
      result = renderBox!.localToGlobal(Offset.zero);
    } catch (e, _) {
      result = Offset.zero;
    }
    return result;
  }

  @override
  double calculateRatioFloor({
    required BoxConstraints constrain,
    required double widthFloor,
  }) {
    final widthFloorView = constrain.maxWidth;
    ratioFloor = widthFloorView / widthFloor;

    return ratioFloor;
  }

  @override
  Offset calculatePositionViaRatio(Offset offset) {
    final dx = offset.dx / ratioFloor;
    final dy = offset.dy / ratioFloor;
    return Offset(dx, dy);
  }
}
