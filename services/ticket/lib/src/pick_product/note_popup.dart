import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class NotePopup extends StatefulWidget {
  final String note;

  const NotePopup({
    super.key,
    required this.note,
  });

  @override
  State<NotePopup> createState() => _NotePopupState();
}

class _NotePopupState extends State<NotePopup> {
  late final textEditingController = TextEditingController(text: widget.note);
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Text(
                "Customer's note",
                style: context.typo.subtitle2.bold,
              ),
              18.0.vertical,
              FlashTextField(
                autoFocus: true,
                hintText: 'Note something...',
                maxLength: 100,
                maxLines: 5,
                textEditingController: textEditingController,
              ),
              12.0.vertical,
              Material(
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.of(context).pop(textEditingController.text);
                  },
                  child: Ink(
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.color.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Add note",
                        style: context.typo.subtitle2.bold.mergeStyle(
                          color: context.color.surface,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const ClosePopupButton(),
      ],
    );
  }
}
