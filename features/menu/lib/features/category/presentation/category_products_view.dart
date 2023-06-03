import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:menu/features/category/domain/category.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/category/presentation/category_controller.dart';
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_popup.dart';
import 'package:menu/features/menu/presentation/widgets/main_menu_view/popup_handler.dart';
import 'widgets/product_card.dart';

class CategoryProductsView extends StatefulWidget {
  final Category category;
  final Function(CartItem) pickProduct;
  const CategoryProductsView({
    super.key,
    required this.category,
    required this.pickProduct,
  });

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView>
    with AutomaticKeepAliveClientMixin<CategoryProductsView> {
  late Category category = widget.category;
  late CategoryController controller =
      getIt<CategoryController>(param1: category);

  final popupHandler = getIt<PopupHandler>();
  @override
  void initState() {
    controller.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      switch (controller.rxState.value) {
        case BaseState.idle:
        case BaseState.fetching:
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        case BaseState.fetchingSuccess:
          final products = controller.rxProducts;
          return GridView.builder(
            key: PageStorageKey(category.id),
            padding: const EdgeInsets.fromLTRB(18, 12, 18, 100),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3 / 4.2,
              crossAxisCount: 4,
            ),
            itemBuilder: (context, index) {
              final product = products[index];

              return ProductCard(
                product: product,
                onTap: () async {
                  final result = await popupHandler.showPopup<CartItem>(
                    canPop: false,
                    context: context,
                    builder: (popupContext) {
                      return PickProductPopup(
                        cartItem: CartItem.fromProduct(product),
                      );
                    },
                  );
                  if (result != null) {
                    widget.pickProduct.call(result);
                  }
                  debugPrint("product tap: ${product.name}");
                },
              );
            },
          );

        default:
          return const Center(
            child: Text("Error"),
          );
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
