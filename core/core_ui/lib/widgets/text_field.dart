import 'package:core_ui/theme/app_typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

class FlashTextField extends StatefulWidget {
  final String? hintText;
  final int maxLines;
  final int? maxLength;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode autovalidateMode;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool? enabled;
  const FlashTextField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.autoFocus = false,
    required this.textEditingController,
    this.textInputAction,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled,
  });

  @override
  State<FlashTextField> createState() => _FlashTextFieldState();
}

class _FlashTextFieldState extends State<FlashTextField> {
  bool isTyping = false;
  late final textEditingController = widget.textEditingController;
  late final focusNode = widget.focusNode ?? FocusNode();
  late AutovalidateMode autovalidateMode = widget.autovalidateMode;
  final key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    focusNode.addListener(handleFocusState);
    super.initState();
  }

  void handleFocusState() {
    if (focusNode.hasFocus) {
      if (textEditingController.text.isNotEmpty) {
        setTypingState(true);
      }
    } else {
      setTypingState(false);
      final isValid = key.currentState?.validate() ?? false;
      setState(() {
        autovalidateMode = isValid
            ? AutovalidateMode.disabled
            : AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(handleFocusState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      key: key,
      autovalidateMode: autovalidateMode,
      inputFormatters: widget.inputFormatters,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: focusNode,
      autofocus: widget.autoFocus,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      controller: textEditingController,
      style: context.typo.body1,
      onFieldSubmitted: (text) {
        if (widget.textInputAction == TextInputAction.next) {
          context.nextEditableTextFocus();
        }
        widget.onFieldSubmitted?.call(text);
      },
      onChanged: (value) {
        if (isTyping == false && value.isNotEmpty) {
          setTypingState(true);
        } else if (isTyping == true && value.isEmpty) {
          setTypingState(false);
        }
      },
      onTapOutside: (_) {
        focusNode.unfocus();
      },
      cursorColor: context.color.primary,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: isTyping
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isTyping = false;
                    textEditingController.text = '';
                  });
                },
                icon: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.cancel,
                    size: 18,
                    color: context.color.subtext,
                  ),
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: context.typo.body1.mergeColor(context.color.hint),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(12),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0.2,
            color: Color.fromARGB(244, 210, 210, 210),
          ),
        ),
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
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
    );
  }

  void setTypingState(bool isTyping) {
    setState(() {
      this.isTyping = isTyping;
    });
  }
}

final enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    width: 0.2,
    color: Color.fromARGB(244, 210, 210, 210),
  ),
);
final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.blueAccent,
  ),
);

final errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.redAccent,
  ),
);

extension TextFieldUtility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild!.context == null);
  }
}
