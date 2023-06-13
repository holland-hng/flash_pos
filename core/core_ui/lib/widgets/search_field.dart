import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'debounce_handler.dart';

/// [triggerInternalListener] we have case custom numeric keyboard
/// So it now work like a normal text field, we need add listener to handle logic.
/// Why don't apply for all case? -> we need save energy, if need not, should't create listener.

class SearchField extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final bool autofocus;
  final Duration debounceDuration;
  final Function(String text)? onChanged;
  final TextEditingController? textEditingController;
  final bool dismissOnTapOutside;
  final bool triggerInternalListener;
  const SearchField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.autofocus = false,
    this.debounceDuration = const Duration(milliseconds: 400),
    this.onChanged,
    this.textEditingController,
    this.dismissOnTapOutside = true,
    this.triggerInternalListener = false,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isSearching = false;
  late final textEditingController =
      widget.textEditingController ?? TextEditingController();
  late final debounceHandler = DebounceHandler(
    duration: widget.debounceDuration,
  );
  final focusNode = FocusNode();

  @override
  void initState() {
    if (widget.triggerInternalListener) {
      textEditingController.addListener(internalHandler);
    }

    super.initState();
  }

  void internalHandler({String? text}) {
    final value = text ?? textEditingController.text;
    if (isSearching == false && value.isNotEmpty) {
      setState(() {
        isSearching = true;
      });
    } else if (isSearching == true && value.isEmpty) {
      setState(() {
        isSearching = false;
      });
    }
    debounceHandler.run(() => widget.onChanged?.call(value));
  }

  @override
  void dispose() {
    debounceHandler.dispose();
    if (widget.triggerInternalListener) {
      textEditingController.removeListener(internalHandler);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      controller: textEditingController,
      style: context.typo.body1,
      onChanged: widget.triggerInternalListener
          ? null
          : (text) {
              internalHandler(text: text);
            },
      onTapOutside: (_) {
        if (focusNode.hasFocus) {
          if (widget.dismissOnTapOutside) {
            focusNode.unfocus();
          } else {
            //do nothing
          }
        }
      },
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: isSearching
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSearching = false;
                    textEditingController.text = '';
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
                icon: Icon(
                  Icons.cancel,
                  size: 18,
                  color: context.color.subtext,
                ),
              )
            : Icon(
                CupertinoIcons.search,
                size: 20,
                color: context.color.subtext,
              ),
        hintText: widget.hintText,
        hintStyle: context.typo.body1.mergeColor(context.color.hint),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.only(left: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.2,
            color: Color.fromARGB(244, 210, 210, 210),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0.2,
            color: context.color.primary,
          ),
        ),
      ),
    );
  }
}
