import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

import 'typo.dart';

class FlashLightTheme extends AppTheme {
  @override
  AppColor get color => AppColor(
        hint: const Color(0xffB2B2B2),
        background: const Color(0xffF5F6FA),
        hintContainer: Colors.white,
        inactive: const Color(0xff909090),
        inactiveContainer: Colors.grey.shade400,
        onHintContainer: Colors.white,
        onInactiveContainer: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.white,
        onToastContainer: Colors.white,
        primary: const Color(0xff4F52FF),
        secondary: const Color(0xff96ADFF),
        subtext: Colors.grey,
        surface: Colors.white,
        tertiary: const Color(0xffC7D3FF),
        text: const Color(0xff333333),
        toastContainer: Colors.white,
      );

  @override
  AppTypo get typo => AppTypo(
        fontColor: color.text,
        typo: FlashTypo(),
      );
}
