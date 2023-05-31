enum FloorType {
  square,
  rectangle,
}

class Floor {
  final String name;
  final double width;
  final double height;
  double get aspectRatio {
    return width / height;
  }

  Floor({
    required this.name,
    required this.width,
    required this.height,
  });
}

class FloorFactory {
  Floor createFloor({
    required String name,
    required FloorType type,
  }) {
    Floor result;
    switch (type) {
      case FloorType.square:
        result = Floor(
          name: name,
          width: 16,
          height: 16,
        );
      case FloorType.rectangle:
        result = Floor(
          name: name,
          width: 16,
          height: 9,
        );
      default:
        throw UnimplementedError();
    }
    return result;
  }
}
