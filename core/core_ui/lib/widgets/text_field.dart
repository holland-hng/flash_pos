import 'package:core_ui/theme/app_typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

final enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Color.fromARGB(244, 210, 210, 210),
  ),
);
final focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.blueAccent,
  ),
);

final errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4),
  borderSide: const BorderSide(
    width: 0.2,
    color: Colors.redAccent,
  ),
);

class FlashTextField extends StatefulWidget {
  final String? hintText;
  final int maxLines;
  final int? maxLength;
  final bool autoFocus;
  final TextEditingController textEditingController;
  const FlashTextField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.maxLength,
    this.autoFocus = false,
    required this.textEditingController,
  });

  @override
  State<FlashTextField> createState() => _FlashTextFieldState();
}

class _FlashTextFieldState extends State<FlashTextField> {
  bool isTyping = false;
  late final textEditingController = widget.textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autoFocus,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      controller: textEditingController,
      style: context.typo.body1,
      onChanged: (value) {
        if (isTyping == false && value.isNotEmpty) {
          setState(() {
            isTyping = true;
          });
        } else if (isTyping == true && value.isEmpty) {
          setState(() {
            isTyping = false;
          });
        }
      },
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
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
