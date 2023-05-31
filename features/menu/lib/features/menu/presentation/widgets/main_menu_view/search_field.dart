import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
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
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.search,
        ),
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
                icon: const Icon(
                  Icons.cancel,
                  size: 18,
                ),
              )
            : null,
        hintText: 'Food\'s name...',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
      ),
    );
  }
}
