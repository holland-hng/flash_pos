import 'package:flutter/material.dart';
import 'package:menu/di/di.dart';
import 'package:menu/features/cart/domain/cart_item.dart';
import 'package:menu/features/category/domain/product.dart';
import 'package:menu/features/category/presentation/widgets/pick_product/pick_product_handler.dart';
import 'confirm_pick_product_button.dart';
import 'header_product_preview.dart';
import 'product_option_view.dart';

class PickProductPopup extends StatefulWidget {
  final CartItem cartItem;

  const PickProductPopup({
    super.key,
    required this.cartItem,
  });

  @override
  State<PickProductPopup> createState() => _PickProductPopupState();
}

class _PickProductPopupState extends State<PickProductPopup> {
  late PickProductHandler pickProductHandler = getIt<PickProductHandler>(
    param1: widget.cartItem,
  );
  late Product product = widget.cartItem.product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint("hacking code: ignore pointer from root");
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: const EdgeInsets.all(18),
                width: 500,
                child: Column(
                  children: [
                    HeaderProductPreview(
                      product: product,
                      pickProductHandler: pickProductHandler,
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(bottom: 40),
                        itemCount: product.options.length,
                        itemBuilder: ((context, index) {
                          final option = product.options[index];

                          return ProductOptionView(
                            pickProductOptionDetailsHandler: pickProductHandler
                                .pickOptionDetailsHandlerMap[option.id]!,
                            productOption: option,
                          );
                        }),
                      ),
                    ),
                    ConfirmPickProductButton(
                      onTap: () {
                        Navigator.of(context).pop(pickProductHandler.result);
                      },
                    )
                  ],
                ),
              ),
            ),
            const _CloseButton(),
          ],
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Ink(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 0.5, color: Colors.white)),
            child: const Icon(
              Icons.close,
            ),
          ),
        ),
      ),
    );
  }
}
