import '/features/floor_table/domain/furniture/furniture.dart';

class Table extends Furniture {
  const Table({
    required super.name,
    super.dx = 0,
    super.dy = 0,
    required super.width,
    required super.height,
    super.shape = FurnitureShape.rectangle,
    super.id = "Table",
  });
}

class CircleTable extends Table {
  const CircleTable({
    super.name = "Circle",
    super.width = 60,
    super.height = 60,
    super.shape = FurnitureShape.circle,
  });
}

class SquareTable extends Table {
  const SquareTable({
    super.name = "Square",
    super.width = 60,
    super.height = 60,
    super.shape = FurnitureShape.square,
  });
}

class RectangleTable extends Table {
  const RectangleTable({
    super.name = "Rect",
    super.width = 120,
    super.height = 60,
  });
}
