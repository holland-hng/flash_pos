import 'dart:async';

import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/di/di.dart';
import 'package:customers_service/src/customers/presentation/customers_controller.dart';
import 'package:flutter/material.dart';

import 'customer_summary_view.dart';

class PickCustomerPopup extends StatefulWidget {
  const PickCustomerPopup({
    super.key,
  });

  @override
  State<PickCustomerPopup> createState() => _PickCustomerPopupState();
}

class _PickCustomerPopupState extends State<PickCustomerPopup> {
  final customersController = getIt<CustomersController>();
  final textEditingController = TextEditingController();
  @override
  void initState() {
    customersController.fetchCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(child: SizedBox()),
        Stack(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "Search customer",
                      style: context.typo.subtitle2.bold,
                    ),
                  ),
                  18.0.vertical,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: SearchField(
                      triggerInternalListener: true,
                      autofocus: true,
                      dismissOnTapOutside: false,
                      textEditingController: textEditingController,
                      keyboardType: TextInputType.none,
                      hintText: 'Phone number...',
                      onChanged: (text) {
                        print(text);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: CustomerSummaryView(),
                  ),
                  const HorDivider(),
                  Flexible(
                    child: Obx(() {
                      switch (customersController.rxState.value) {
                        case BaseState.idle:
                        case BaseState.fetching:
                          return const Center(
                              child: CircularProgressIndicator.adaptive());

                        case BaseState.fetchSuccess:
                          return ListView.separated(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, bottom: 36),
                            itemBuilder: (context, index) {
                              final customer =
                                  customersController.rxCustomers[index];
                              return CustomerSummaryView(
                                name: customer.name,
                                phone: customer.phoneNumber,
                                loyaltyPoint: customer.loyaltyPoint.toString(),
                              );
                            },
                            separatorBuilder: (_, __) => const HorDivider(),
                            itemCount: customersController.rxCustomers.length,
                          );
                        default:
                          return const Center(child: Text("Error"));
                      }
                    }),
                  ),
                  const HorDivider(),
                  18.0.vertical,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Expanded(
                          child: Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8),
                              onTap: () {},
                              child: Ink(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: context.color.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Add to ticket",
                                      style: context.typo.subtitle2.bold
                                          .mergeStyle(
                                        color: context.color.surface,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const ClosePopupButton(),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 18, top: 74),
            child: NumericKeyboard(
              controller: textEditingController,
            ),
          ),
        )
      ],
    );
  }
}

enum NumericKeyboardType {
  phone,
  money,
}

class NumericKeyboard extends StatefulWidget {
  final TextEditingController controller;
  final NumericKeyboardType type;
  const NumericKeyboard({
    super.key,
    required this.controller,
    this.type = NumericKeyboardType.phone,
  });

  @override
  State<NumericKeyboard> createState() => _NumericKeyboardState();
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  final list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0", "del"];
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        itemCount: list.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          String char = list[index];
          bool needBackground = true;
          if (char == 'del') {
            needBackground = false;
          }
          if (char == '.') {
            if (widget.type == NumericKeyboardType.phone) {
              char = '';
              needBackground = false;
            }
          }

          return Material(
            color: Colors.transparent,
            child: GestureDetector(
              onLongPressStart: (details) {
                timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
                  onTap(char);
                });
              },
              onLongPressEnd: (_) {
                timer?.cancel();
                timer = null;
              },
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  onTap(char);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: needBackground
                        ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.grey.shade200,
                              Colors.grey.shade300,
                            ],
                          )
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      char.toUpperCase(),
                      style: context.typo.body1.semiBold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onTap(String char) {
    int cursorIndex = widget.controller.selection.base.offset;
    cursorIndex = cursorIndex < 0 ? 0 : cursorIndex;
    final text = widget.controller.text;
    if (char == 'del') {
      widget.controller.text = text.removeAt(cursorIndex);
      if (cursorIndex > 0) {
        widget.controller.selection = TextSelection.fromPosition(
          TextPosition(
            offset: cursorIndex - 1,
          ),
        );
      }
    } else {
      widget.controller.text = text.addAt(cursorIndex, char);
      widget.controller.selection = TextSelection.fromPosition(TextPosition(
        offset: cursorIndex + 1,
      ));
    }
  }
}

extension StringNumericField on String {
  String removeAt(int index) {
    try {
      return replaceRange(index - 1, index, '');
    } catch (e) {
      return this;
    }
  }

  String addAt(int index, String char) {
    return substring(0, index) + char + substring(index);
  }
}
