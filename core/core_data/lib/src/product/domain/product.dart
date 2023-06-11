import 'package:core_dependency/core_dependency.dart';

import '../data/dao/product.dart';
import '../data/dao/product_option.dart';
import '../data/dto/product.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String thumb;
  final double price;
  final List<ProductOption> options;
  const Product(
    this.id,
    this.name,
    this.thumb, {
    this.price = 0,
    this.options = const [],
  });

  factory Product.fromDto(ProductDto dto) {
    final temp = int.parse(dto.id) % 3;
    List<ProductOption> options;
    switch (temp) {
      case 0:
        options = [];
        break;
      case 1:
        options = [fakeOptions.first];
        break;
      default:
        options = fakeOptions;
    }
    return Product(
      dto.id,
      dto.name,
      dto.thumb,
      price: double.parse(dto.id) % 100,
      options: options,
    );
  }

  factory Product.fromDao(ProductDao dao) {
    return Product(
      dao.id,
      dao.name,
      dao.thumb,
      price: dao.price,
      options:
          dao.options.map((option) => ProductOption.fromDao(option)).toList(),
    );
  }

  ProductDao toDao() {
    return ProductDao(
      id: id,
      name: name,
      thumb: thumb,
      price: price,
      options: options.map((e) => e.toDao()).toList(),
    );
  }

  @override
  List<Object?> get props => [id, name, thumb, price, options];
}

enum OptionMode {
  single,
  multi,
}

extension OptionModeExtension on OptionMode {
  String get title {
    switch (this) {
      case OptionMode.single:
        return "Single choice";
      case OptionMode.multi:
        return "Multiple choices";
      default:
        throw UnimplementedError();
    }
  }
}

extension OptionModeString on String {
  OptionMode get productOptionMode {
    switch (this) {
      case "Single choice":
        return OptionMode.single;
      case "Multiple choices":
        return OptionMode.multi;
      default:
        throw UnimplementedError();
    }
  }
}

class ProductOption extends Equatable {
  final String id;
  final String name;
  final OptionMode mode;
  final List<ProductOptionDetail> details;

  const ProductOption({
    required this.mode,
    required this.id,
    required this.name,
    required this.details,
  });

  ProductOption clone({List<ProductOptionDetail>? details}) {
    return ProductOption(
      mode: mode,
      id: id,
      name: name,
      details: details ?? this.details,
    );
  }

  @override
  List<Object?> get props => [mode, id, name, details];

  factory ProductOption.fromDao(ProductOptionDao dao) {
    return ProductOption(
      id: dao.id,
      name: dao.name,
      mode: dao.mode.productOptionMode,
      details:
          dao.details.map((dao) => ProductOptionDetail.fromDao(dao)).toList(),
    );
  }

  ProductOptionDao toDao() {
    return ProductOptionDao(
      details: details.map((detail) => detail.toDao()).toList(),
      id: id,
      mode: mode.title,
      name: name,
    );
  }
}

class ProductOptionDetail extends Equatable {
  final String id;
  final String name;
  final double price;

  const ProductOptionDetail(
      {required this.id, required this.name, required this.price});

  @override
  List<Object?> get props => [id, name, price];

  factory ProductOptionDetail.fromDao(ProductOptionDetailDao dao) {
    return ProductOptionDetail(
      id: dao.id,
      name: dao.name,
      price: dao.price,
    );
  }

  ProductOptionDetailDao toDao() {
    return ProductOptionDetailDao(
      id: id,
      name: name,
      price: price,
    );
  }
}

const fakeOptions = <ProductOption>[
  ProductOption(
    details: [
      ProductOptionDetail(id: '1', name: 'Rare', price: 0),
      ProductOptionDetail(id: '2', name: 'Medium Rare', price: 0),
      ProductOptionDetail(id: '3', name: 'Medium', price: 0),
      ProductOptionDetail(id: '4', name: 'Medium Well', price: 0),
      ProductOptionDetail(id: '5', name: 'Well', price: 0),
    ],
    id: '1',
    mode: OptionMode.single,
    name: 'Steak doneness',
  ),
  ProductOption(
    details: [
      ProductOptionDetail(id: '4', name: 'Cilantro Lime Butter', price: 2.3),
      ProductOptionDetail(
        id: '5',
        name: 'Caramelized Onion and Blue Cheese Steak Sauce',
        price: 4.45,
      ),
      ProductOptionDetail(
          id: '6',
          name: 'Red Wine Reduction with Roasted Shallots and Bacon',
          price: 12),
      ProductOptionDetail(id: '7', name: 'Garlic Butter Sauce', price: 5.65),
      ProductOptionDetail(id: '8', name: 'Easy Herbed butter', price: 123.45),
    ],
    id: '2',
    mode: OptionMode.multi,
    name: 'Steak toppings',
  ),
];
