import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controllers/furniture_editor.dart';

class FurnitureInfoTextfield extends StatefulWidget {
  final String initValue;
  final FurnitureProperty property;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;

  const FurnitureInfoTextfield({
    super.key,
    required this.initValue,
    this.onSubmitted,
    this.controller,
    required this.property,
  });

  @override
  State<FurnitureInfoTextfield> createState() => _FurnitureInfoTextfieldState();
}

class _FurnitureInfoTextfieldState extends State<FurnitureInfoTextfield> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = widget.controller ??
        TextEditingController(
          text: widget.initValue,
        );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FurnitureInfoTextfield oldWidget) {
    if (widget.initValue != oldWidget.initValue) {
      controller.text = widget.initValue;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
    }
    super.didUpdateWidget(oldWidget);
  }

  final enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      width: 0.5,
      color: Colors.grey,
    ),
  );
  final focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: const BorderSide(
      width: 0.5,
      color: Colors.blueAccent,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.property.textInputType,
      controller: controller,
      onSubmitted: (value) {
        if (widget.property.isNumeric) {
          try {
            double number = double.parse(value);
            if (number < 30) {
              number = 30;
            }
            controller.text = number.toStringAsFixed(2).replaceAll(".00", "");
          } catch (e) {
            debugPrint(e.toString());
          }
        }
        widget.onSubmitted?.call(controller.text);
      },
      maxLines: 1,
      inputFormatters: [
        if (widget.property.isNumeric)
          FilteringTextInputFormatter.allow(
            RegExp(r'^\d*\.?\d{0,2}'),
          ),
        LengthLimitingTextInputFormatter(10),
      ],
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.property.hintText,
        label: Text(
          widget.property.label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
      ),
    );
  }
}
