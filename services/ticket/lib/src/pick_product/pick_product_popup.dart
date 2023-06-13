import 'package:core_data/core_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:ticket_service/di/di.dart';
import 'package:ticket_service/src/pick_product/pick_product_handler.dart';
import 'package:ticket_service/ticket_service.dart';
import 'widgets/confirm_pick_product_button.dart';
import 'widgets/header_product_preview.dart';
import 'widgets/product_option_view.dart';

enum PickProductMode {
  add,
  edit,
}

extension PickProductModeExtension on PickProductMode {
  bool get isEdit {
    return this == PickProductMode.edit;
  }
}

class PickProductPopup extends StatefulWidget {
  final TicketItem ticketItem;
  final PickProductMode mode;

  const PickProductPopup({
    super.key,
    required this.ticketItem,
    required this.mode,
  });

  @override
  State<PickProductPopup> createState() => _PickProductPopupState();
}

class _PickProductPopupState extends State<PickProductPopup> {
  final notePopupHandler = PopupHandler.instance;
  late PickProductHandler pickProductHandler = getIt<PickProductHandler>(
    param1: widget.ticketItem,
    param2: widget.mode,
  );
  late Product product = widget.ticketItem.product;
  late double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 300),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(18),
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            width: 500,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderProductPreview(
                  product: product,
                  pickProductHandler: pickProductHandler,
                ),
                18.0.vertical,
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
                  addNote: () {
                    setState(() {
                      opacity = 0;
                    });
                    Future.delayed(const Duration(milliseconds: 100)).then(
                      (_) async {
                        final result = await notePopupHandler.showPopup<String>(
                          context: context,
                          builder: (popupContext) {
                            return NotePopup(
                              note: pickProductHandler.note,
                            );
                          },
                        );
                        if (result != null) {
                          pickProductHandler.note = result;
                        }

                        Future.delayed(const Duration(milliseconds: 100)).then(
                          (_) async {
                            setState(() {
                              opacity = 1;
                            });
                          },
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
          const ClosePopupButton()
        ],
      ),
    );
  }
}
