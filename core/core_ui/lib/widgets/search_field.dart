import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String? hintText;
  const SearchField({
    super.key,
    this.hintText,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool isSearching = false;
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: context.typo.body1,
      onChanged: (value) {
        if (isSearching == false && value.isNotEmpty) {
          setState(() {
            isSearching = true;
          });
        } else if (isSearching == true && value.isEmpty) {
          setState(() {
            isSearching = false;
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
        enabledBorder: enabledBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 0.2,
            color: context.color.primary,
          ),
        ),
      ),
    );
  }
}
