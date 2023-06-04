import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? label;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    this.hintText,
    this.label,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.errorText,
    this.validator,
    this.prefixIcon,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.suffixIcon,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final TextEditingController controller = TextEditingController();
  late bool obscureText = widget.obscureText;
  late bool showingSuffix = widget.suffixIcon != null;
  Widget? get suffixIcon {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    if (widget.obscureText == true) {
      return GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: Colors.black,
              )
            : const Icon(
                Icons.visibility,
                color: Colors.black,
              ),
      );
    }
    return null;
  }

  bool needShowSuffix = false;

  @override
  void initState() {
    if (widget.obscureText) {
      prepareForObscureText();
    }

    super.initState();
  }

  void prepareForObscureText() {
    showingSuffix = false;
    controller.addListener(handlerObscure);
  }

  void handlerObscure() {
    if (needShowSuffix == false && controller.text.isNotEmpty) {
      setState(() {
        needShowSuffix = true;
      });
    } else if (needShowSuffix == true && controller.text.isEmpty) {
      setState(() {
        needShowSuffix = false;
      });
    }
  }

  @override
  void dispose() {
    controller.removeListener(handlerObscure);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.label!,
              style: context.typo.subtitle1.medium,
            ),
          ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          maxLines: 1,
          obscureText: obscureText,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          onTapOutside: (_) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          validator: widget.validator,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: needShowSuffix ? suffixIcon : null,
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: context.typo.subtitle2.mergeStyle(
              color: Colors.grey.shade400,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
          ),
        ),
      ],
    );
  }
}
