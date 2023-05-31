import 'package:flutter/material.dart';
import 'cart_handler.dart';
import 'widgets/cart_app_bar.dart';
import 'widgets/cart_items_list_vew.dart';
import 'widgets/cart_value_view.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
    required this.cartHandler,
  });

  final CartHandler cartHandler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CartAppBar(
        cartHandler: cartHandler,
      ),
      backgroundColor: Colors.white,
      body: ClipRect(
        child: CartItemsListView(
          cartHandler: cartHandler,
        ),
      ),
      bottomNavigationBar: CartValueView(
        onSave: cartHandler.saveOrder,
        onPlaceOrder: cartHandler.placeOrder,
        rxCartSummary: cartHandler.rxCartSummary,
      ),
    );
  }
}
