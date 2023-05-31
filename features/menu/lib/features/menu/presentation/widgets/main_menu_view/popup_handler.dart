import 'dart:ui';
import 'package:core_dependency/core_dependency.dart';
import 'package:flutter/material.dart';

abstract class PopupHandler {
  Future<T?> showPopup<T>({
    required Widget Function(BuildContext popupContext) builder,
    required BuildContext context,
    bool useRootNavigator = true,
    bool canPop = true,
  });
  void hide();
}

@LazySingleton(as: PopupHandler)
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
      debugPrint("isShowing $isShowing");
      return null;
    }
    isShowing = true;
    final result = await showDialog<T>(
      useRootNavigator: useRootNavigator,
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
                body: Center(
                  child: builder(popupContext),
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
