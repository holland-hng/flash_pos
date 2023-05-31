import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_design_system/flutter_design_system.dart';

class FlashAppTypo extends AppTypo {
  FlashAppTypo({required super.typo, required super.fontColor});
}

extension TextStyleExtension on TextStyle {
  TextStyle get ultraBold {
    return merge(
      const TextStyle(fontWeight: FontWeight.w900),
    );
  }

  TextStyle get extraBold {
    return merge(
      const TextStyle(fontWeight: FontWeight.w800),
    );
  }

  TextStyle get bold {
    return merge(
      const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  TextStyle get semiBold {
    return merge(
      const TextStyle(fontWeight: FontWeight.w600),
    );
  }

  TextStyle get medium {
    return merge(
      const TextStyle(fontWeight: FontWeight.w500),
    );
  }

  TextStyle get regular {
    return merge(
      const TextStyle(fontWeight: FontWeight.w400),
    );
  }

  TextStyle get thin {
    return merge(
      const TextStyle(fontWeight: FontWeight.w300),
    );
  }

  TextStyle get extraThin {
    return merge(
      const TextStyle(fontWeight: FontWeight.w200),
    );
  }

  TextStyle get ultraThin {
    return merge(
      const TextStyle(fontWeight: FontWeight.w100),
    );
  }

  TextStyle mergeStyle({
    bool inherit = true,
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    TextLeadingDistribution? leadingDistribution,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
    List<FontFeature>? fontFeatures,
    List<FontVariation>? fontVariations,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    String? package,
    TextOverflow? overflow,
  }) {
    return merge(TextStyle(
      inherit: inherit,
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      leadingDistribution: leadingDistribution ?? this.leadingDistribution,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      fontVariations: fontVariations ?? this.fontVariations,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      debugLabel: debugLabel ?? this.debugLabel,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      package: package,
      overflow: overflow ?? this.overflow,
    ));
  }
}
