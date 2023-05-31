import 'package:core_ui/theme/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

class FlashDarkTheme extends AppTheme {
  @override
  AppColor get color => AppColor(
        hint: Colors.grey.shade400,
        background: Colors.white,
        hintContainer: Colors.white,
        inactive: Colors.grey.shade300,
        inactiveContainer: Colors.grey.shade400,
        onHintContainer: Colors.white,
        onInactiveContainer: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onToastContainer: Colors.white,
        primary: const Color(0xffF2AC65),
        secondary: const Color(0xffFADC62),
        subtext: Colors.grey,
        surface: Colors.white,
        tertiary: Colors.white,
        text: Colors.black,
        toastContainer: Colors.white,
      );
  @override
  AppTypo get typo => AppTypo(
        fontColor: Colors.white,
        typo: FlashTypo(),
      );
}
