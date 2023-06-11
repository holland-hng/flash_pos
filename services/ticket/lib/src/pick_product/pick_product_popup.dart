import 'package:core_data/core_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:ticket_service/di/di.dart';
import 'package:ticket_service/src/pick_product/pick_product_handler.dart';
import 'package:ticket_service/ticket_service.dart';

import 'widgets/confirm_pick_product_button.dart';
import 'widgets/header_product_preview.dart';
import 'widgets/product_option_view.dart';

class PickProductPopup extends StatefulWidget {
  final TicketItem ticketItem;

  const PickProductPopup({
    super.key,
    required this.ticketItem,
  });

  @override
  State<PickProductPopup> createState() => _PickProductPopupState();
}

class _PickProductPopupState extends State<PickProductPopup> {
  late PickProductHandler pickProductHandler = getIt<PickProductHandler>(
    param1: widget.ticketItem,
  );
  late Product product = widget.ticketItem.product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(18),
              width: 500,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeaderProductPreview(
                    product: product,
                    pickProductHandler: pickProductHandler,
                  ),
                  const SizedBox(height: 20),
                  const HorDivider(),
                  if (product.options.isNotEmpty)
                    Flexible(
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
                    pickProductHandler: pickProductHandler,
                  )
                ],
              ),
            ),
          ),
          const _CloseButton(),
        ],
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
                color: context.color.secondary,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 0.5, color: Colors.white)),
            child: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
