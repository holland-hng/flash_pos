import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'cart_handler.dart';
import 'widgets/cart_header_view.dart';
import 'widgets/cart_items_list_vew.dart';
import 'widgets/cart_value_view.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
    required this.cartHandler,
  });

  final CartHandler cartHandler;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late BuildContext tabContext;
  @override
  void initState() {
    widget.cartHandler.getCurrentTabIndex = getCurrentTabIndex;
    super.initState();
  }

  int getCurrentTabIndex() {
    return DefaultTabController.of(tabContext).index;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
        length: widget.cartHandler.rxCartTabs.length,
        child: Scaffold(
          appBar: CartHeaderView(
            titleTabs: widget.cartHandler.titleTabs,
            selectNumberPeople: widget.cartHandler.selectNumberPeople,
          ),
          backgroundColor: Colors.white,
          body: Builder(builder: (tabContext) {
            this.tabContext = tabContext;
            return ClipRect(
              child: TabBarView(
                children: [
                  for (int i = 0; i < widget.cartHandler.rxCartTabs.length; i++)
                    CartTabView(
                      cartHandler: widget.cartHandler,
                    )
                ],
              ),
            );
          }),
          bottomNavigationBar: CartValueView(
            onSave: widget.cartHandler.saveOrder,
            onPlaceOrder: widget.cartHandler.placeOrder,
            rxOrderSummary: widget.cartHandler.rxOrderSummary,
          ),
        ),
      );
    });
  }
}

class CartTabView extends StatefulWidget {
  const CartTabView({
    super.key,
    required this.cartHandler,
  });

  final CartHandler cartHandler;

  @override
  State<CartTabView> createState() => _CartTabViewState();
}

class _CartTabViewState extends State<CartTabView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.0.vertical,
          Text(
            "Floor 1 - Table A002",
            style: context.typo.headline6.bold,
          ),
          2.0.vertical,
          Expanded(
            child: CartItemsListView(
              cartHandler: widget.cartHandler,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
