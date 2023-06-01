import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:menu/features/cart/domain/seat_order.dart';
import 'package:menu/features/cart/presentation/cart_handler.dart';
import 'cart_item_view.dart';

class CartItemsListView extends StatefulWidget {
  const CartItemsListView({
    super.key,
    required this.cartHandler,
  });

  final CartHandler cartHandler;

  @override
  State<CartItemsListView> createState() => _CartItemsListViewState();
}

class _CartItemsListViewState extends State<CartItemsListView> {
  late CartHandler cartHandler = widget.cartHandler;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartHandler.isEmpty) {
        return Center(
          key: UniqueKey(),
          child: Assets.gifs.gifEmptyCart.image(),
        );
      }
      final List<SeatOrder> seatsOrder = cartHandler.rxSeatsOrder;
      return DragAndDropLists(
        lastItemTargetHeight: 30,
        contentsWhenEmpty: Center(
          key: UniqueKey(),
          child: Assets.gifs.gifEmptyCart.image(),
        ),
        listPadding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        children: seatsOrder.map((seatOrder) {
          final isSelected = cartHandler.isSeatSelected(seatOrder);
          return DragAndDropList(
            header: cartHandler.isSingleSeat
                ? null
                : Material(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: cartHandler.isFirst(seatOrder) ? 12 : 0,
                          bottom: 6),
                      child: InkWell(
                        onTap: () {
                          cartHandler.setSeatTarget(seatOrder);
                        },
                        child: Ink(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          color: isSelected
                              ? Colors.blueAccent
                              : Colors.grey.shade200,
                          child: Text(
                            seatOrder.seatName,
                            style: isSelected
                                ? context.typo.subtitle1.bold
                                    .mergeStyle(color: Colors.white)
                                : context.typo.subtitle1.semiBold,
                          ),
                        ),
                      ),
                    ),
                  ),
            canDrag: false,
            contentsWhenEmpty: SizedBox(
              height: 30,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Empty list',
                  style: context.typo.subtitle2
                      .mergeStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            children: seatOrder.cartItems.map((item) {
              return DragAndDropItem(
                child: ProductPreviewView(
                  key: ObjectKey(item),
                  item: item,
                  onRemove: () {},
                  onUpdate: (item) {},
                ),
              );
            }).toList(),
          );
        }).toList(),
        onItemReorder: cartHandler.onItemReorder,
        onListReorder: cartHandler.onListReorder,
      );
    });
  }
}
