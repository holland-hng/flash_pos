import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'customer_info_controller.dart';

class CustomerInfoPopup extends StatefulWidget {
  final Customer customer;
  final CustomerInfoState state;

  const CustomerInfoPopup({
    super.key,
    required this.customer,
    required this.state,
  });

  @override
  State<CustomerInfoPopup> createState() => _CustomerInfoPopupState();
}

class _CustomerInfoPopupState extends State<CustomerInfoPopup> {
  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final CustomerInfoController customerInfoController;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.customer.name);
    phoneController = TextEditingController(text: widget.customer.phoneNumber);
    customerInfoController = getIt<CustomerInfoController>(
      param1: widget.state,
      param2: widget.customer,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(18),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.state.title,
                          style: context.typo.subtitle2.bold,
                        ),
                        if (widget.state != CustomerInfoState.create)
                          Text(
                            "Loyalty point: ${widget.customer.loyaltyPoint}",
                            style: context.typo.body1.medium,
                          ),
                      ],
                    ),
                    14.0.vertical,
                    Form(
                      key: formKey,
                      child: Obx(() {
                        final state = customerInfoController.rxState.value;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Name",
                              style: context.typo.body1.medium,
                            ),
                            6.0.vertical,
                            FlashTextField(
                              enabled: state.enableTextfield,
                              autoFocus: state.autoFocusTextfield,
                              textInputAction: TextInputAction.next,
                              validator: customerInfoController.fieldValidator,
                              hintText: "Name",
                              textEditingController: nameController,
                            ),
                            14.0.vertical,
                            Text(
                              "Phone",
                              style: context.typo.body1.medium,
                            ),
                            6.0.vertical,
                            FlashTextField(
                              keyboardType: TextInputType.number,
                              enabled: state.enableTextfield,
                              validator: customerInfoController.fieldValidator,
                              textInputAction: TextInputAction.done,
                              hintText: "Phone",
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              textEditingController: phoneController,
                            ),
                          ],
                        );
                      }),
                    ),
                    24.0.vertical,
                    Obx(() {
                      switch (customerInfoController.rxState.value) {
                        case CustomerInfoState.create:
                          return Row(
                            children: [
                              PopupActionButton(
                                backgroundColor: Colors.red,
                                textColor: context.color.surface,
                                title: 'Discard',
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              18.0.horizontal,
                              PopupActionButton(
                                backgroundColor: context.color.primary,
                                textColor: context.color.surface,
                                isLoading:
                                    customerInfoController.rxIsLoading.value,
                                title: 'Create',
                                onTap: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    customerInfoController.createCustomer(
                                      Customer(
                                        name: nameController.text,
                                        phoneNumber: phoneController.text,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          );
                        case CustomerInfoState.view:
                          return Row(
                            children: [
                              PopupActionButton(
                                backgroundColor: Colors.red,
                                textColor: context.color.surface,
                                title: 'Remove from ticket',
                              ),
                              18.0.horizontal,
                              PopupActionButton(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: context.color.primary,
                                textColor: context.color.surface,
                                title: 'Close',
                              ),
                            ],
                          );
                        case CustomerInfoState.edit:
                          return Row(
                            children: [
                              PopupActionButton(
                                backgroundColor: Colors.red,
                                textColor: context.color.surface,
                                title: 'Discard',
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              18.0.horizontal,
                              PopupActionButton(
                                onTap: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    customerInfoController.updateUserInfo(
                                      widget.customer.copyWith(
                                        name: nameController.text,
                                        phoneNumber: phoneController.text,
                                      ),
                                    );
                                  }
                                },
                                backgroundColor: context.color.primary,
                                textColor: context.color.surface,
                                title: 'Save',
                                isLoading:
                                    customerInfoController.rxIsLoading.value,
                              ),
                            ],
                          );
                        default:
                          throw UnimplementedError();
                      }
                    })
                  ],
                ),
              ),
              const ClosePopupButton(),
            ],
          ),
        ),
        // Hacking code: disable user interaction when updating
        Obx(() {
          final isUpdating = customerInfoController.rxIsLoading.value;
          if (isUpdating) {
            return Container(
              color: Colors.transparent,
            );
          }
          return const SizedBox();
        }),
      ],
    );
  }
}

class PopupActionButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  const PopupActionButton({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Ink(
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      title,
                      style: context.typo.subtitle2.bold.mergeStyle(
                        color: textColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

enum CustomerInfoState {
  create,
  view,
  edit,
}

extension CustomerInfoTypeExtension on CustomerInfoState {
  String get title {
    switch (this) {
      case CustomerInfoState.create:
        return "New customer";
      case CustomerInfoState.view:
        return "Customer info";
      case CustomerInfoState.edit:
        return "Update user info";
      default:
        throw UnimplementedError();
    }
  }

  bool get enableTextfield {
    switch (this) {
      case CustomerInfoState.view:
        return false;
      case CustomerInfoState.create:
      case CustomerInfoState.edit:
        return true;
      default:
        throw UnimplementedError();
    }
  }

  bool get autoFocusTextfield {
    return enableTextfield;
  }
}
