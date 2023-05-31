import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

abstract class UIBehavior {
  void changeLocale(LocaleType localeType);
  void toggleTheme();
}

class UIManager extends StatefulWidget {
  final UIConfiguration configuration;
  final Widget Function(Locale) builder;
  const UIManager({
    super.key,
    required this.builder,
    this.configuration = const UIConfiguration(
      localeType: LocaleType.english,
    ),
  });

  @override
  State<UIManager> createState() => _UIManagerState();

  static UIBehavior of(BuildContext context) {
    final state = context.findAncestorStateOfType<State<UIManager>>();
    final behavior = state as UIBehavior;
    return behavior;
  }
}

class _UIManagerState extends State<UIManager> implements UIBehavior {
  late Locale currentLocale;
  late Widget Function(ThemeData, ThemeData) adaptiveBuilder;

  @override
  void initState() {
    currentLocale = widget.configuration.localeType.locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInjector(
      themeService: ThemeService(
        brightness: Brightness.light,
        lightTheme: FlashLightTheme(),
        darkTheme: FlashDarkTheme(),
      ),
      child: widget.builder(currentLocale),
    );
  }

  @override
  void changeLocale(LocaleType localeType) {
    setState(() {
      currentLocale = localeType.locale;
    });
  }

  @override
  void toggleTheme() {
    context.readThemeService.toggleTheme();
  }
}

extension AppThemeContext on BuildContext {
  UIBehavior get uiBehavior {
    return UIManager.of(this);
  }
}
