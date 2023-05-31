import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'typo.dart';

class FlashLightTheme extends AppTheme {
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
        primary: const Color(0xffF5996D),
        secondary: const Color(0xff852E4B),
        subtext: Colors.grey,
        surface: Colors.white,
        tertiary: Colors.white,
        text: Colors.black,
        toastContainer: Colors.white,
      );
  @override
  AppTypo get typo => AppTypo(
        fontColor: Colors.black,
        typo: FlashTypo(),
      );
}
