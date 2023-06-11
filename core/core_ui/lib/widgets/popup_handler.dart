import 'dart:ui';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

abstract class PopupHandler {
  Future<T?> showPopup<T>({
    required Widget Function(BuildContext popupContext) builder,
    required BuildContext context,
    bool canPop = true,
  });
  void hide();
  static PopupHandler get instance {
    return PopupHandlerImpl();
  }
}

class PopupHandlerImpl extends PopupHandler {
  late bool isShowing = false;
  late BuildContext? popupContext;

  @override
  Future<T?> showPopup<T>({
    required BuildContext context,
    required Widget Function(BuildContext popupContext) builder,
    bool useRootNavigator = true,
    bool canPop = true,
  }) async {
    if (isShowing == true) {
      debugPrint("PopupHandler isShowing: $isShowing");
      return null;
    }
    isShowing = true;

    final result = await showAnimatedDialog<T>(
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black12,
      builder: (popupContext) {
        this.popupContext = popupContext;
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: GestureDetector(
            onTap: () {
              if (canPop) {
                hide();
              }
            },
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Center(
                    child: builder(popupContext),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    isShowing = false;
    popupContext = null;
    return result;
  }

  @override
  void hide() {
    if (popupContext == null) {
      debugPrint("context: $popupContext");
      return;
    }
    if (isShowing == false) {
      debugPrint("isShowing $isShowing");
      return;
    }
    isShowing = false;
    Navigator.of(popupContext!).pop();
    popupContext = null;
  }
}

class ClosePopupButton extends StatelessWidget {
  const ClosePopupButton({super.key});

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
