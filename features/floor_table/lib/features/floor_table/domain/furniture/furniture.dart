import 'dart:math';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';

enum FurnitureShape {
  circle,
  square,
  rectangle,
}

extension FurnitureShapeExtension on FurnitureShape {
  BoxShape get boxShape {
    switch (this) {
      case FurnitureShape.circle:
        return BoxShape.circle;
      default:
        return BoxShape.rectangle;
    }
  }

  bool get isCircle {
    return this == FurnitureShape.circle;
  }
}

var rng = Random();

class Furniture extends Equatable {
  final String id;
  final String name;
  final double dx;
  final double dy;
  final double width;
  final double height;
  final FurnitureShape shape;
  final FurnitureState state;

  String get sizeString => "${width}x$height".replaceAll('.0', '');
  bool get isAvailable => state == FurnitureState.available;
  bool get isSelected => state == FurnitureState.selected;

  Furniture clone({
    String? id,
    double? dx,
    double? dy,
    String? name,
    double? width,
    double? height,
    FurnitureShape? shape,
    FurnitureState? state,
  }) {
    return Furniture(
      name: name ?? this.name,
      dx: dx ?? this.dx,
      dy: dy ?? this.dy,
      width: width ?? this.width,
      height: height ?? this.height,
      shape: shape ?? this.shape,
      state: state ?? this.state,
      id: id ?? this.id,
    );
  }

  Furniture toggleSelected() {
    FurnitureState newState;
    switch (state) {
      case FurnitureState.available:
        newState = FurnitureState.selected;
        break;
      case FurnitureState.selected:
        newState = FurnitureState.available;
        break;
      default:
        newState = state;
        break;
    }
    return clone(state: newState);
  }

  const Furniture({
    required this.id,
    required this.name,
    required this.dx,
    required this.dy,
    required this.width,
    required this.height,
    required this.shape,
    this.state = FurnitureState.available,
  });

  @override
  List<Object?> get props => [
        name,
        dx,
        dy,
        width,
        height,
        shape,
        state,
      ];
}

extension FurnitureExtension on Furniture {
  BorderRadius? get borderRadius {
    switch (shape) {
      case FurnitureShape.circle:
        return null;
      default:
        return BorderRadius.circular(4);
    }
  }

  BorderRadius? get clipRRectBorderRadius {
    switch (shape) {
      case FurnitureShape.circle:
        return BorderRadius.circular(width / 2);
      default:
        return BorderRadius.circular(4);
    }
  }

  //BorderRadius? get borderCircleRadius

  Furniture get miniPreview {
    double widthDisplay;
    double heightDisplay;
    widthDisplay = 30;
    heightDisplay = 30;
    if (shape == FurnitureShape.rectangle) {
      if (width < height) {
        widthDisplay = 26;
      } else if (width > height) {
        heightDisplay = 26;
      }
    }

    return Furniture(
      dx: 0,
      dy: 0,
      width: widthDisplay,
      height: heightDisplay,
      name: name,
      shape: shape,
      id: id,
    );
  }
}

enum FurnitureState {
  selected,
  available,
  purchased,
  waitingPurchase,
  booked,
}

extension FurnitureStateExtension on FurnitureState {
  LinearGradient get gradient {
    Color startColor;
    Color endColor;
    switch (this) {
      case FurnitureState.selected:
        startColor = const Color.fromARGB(255, 111, 190, 226);
        endColor = const Color.fromARGB(255, 94, 167, 211);
      case FurnitureState.available:
        startColor = const Color.fromARGB(255, 130, 130, 130);
        endColor = const Color.fromARGB(255, 90, 92, 98);
      case FurnitureState.purchased:
        startColor = const Color.fromARGB(255, 81, 166, 84);
        endColor = const Color.fromARGB(255, 65, 145, 78);
      case FurnitureState.waitingPurchase:
        startColor = const Color.fromARGB(255, 220, 96, 104);
        endColor = const Color.fromARGB(255, 202, 80, 87);
      case FurnitureState.booked:
        startColor = const Color.fromARGB(255, 244, 200, 92);
        endColor = const Color.fromARGB(255, 232, 173, 71);
      default:
        throw UnimplementedError();
    }
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        startColor,
        endColor,
      ],
      tileMode: TileMode.clamp,
    );
  }
}

class FurnitureDisplay extends Furniture {
  final LinearGradient draggingGradient;
  FurnitureDisplay({
    required Furniture furniture,
    required double ratioFloor,
    required this.draggingGradient,
  }) : super(
          id: furniture.id,
          name: furniture.name,
          dx: furniture.dx * ratioFloor,
          dy: furniture.dy * ratioFloor,
          width: furniture.width * ratioFloor,
          height: furniture.height * ratioFloor,
          shape: furniture.shape,
          state: furniture.state,
        );
}
