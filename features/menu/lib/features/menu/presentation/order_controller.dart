import 'package:core_dependency/core_dependency.dart';
import 'package:menu/features/category/domain/product.dart';

@injectable
class OrderController {
  RxList<Product> rxProducts = <Product>[].obs;
}
