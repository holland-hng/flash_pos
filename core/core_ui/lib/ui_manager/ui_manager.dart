import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

abstract class UIBehavior {
  void changeLocale(LocaleType localeType);
  void toggleTheme();

  static UIBehavior of(BuildContext context) {
    final state = context.findAncestorStateOfType<State<AppManager>>();
    final behavior = state as UIBehavior;
    return behavior;
  }
}

abstract class AppBehavior {
  Future<void> logout();

  static AppBehavior of(BuildContext context) {
    final state = context.findAncestorStateOfType<State<AppManager>>();
    final behavior = state as AppBehavior;
    return behavior;
  }
}

class AppManager extends StatefulWidget {
  final UIConfiguration configuration;
  final Widget Function(Locale) builder;
  final Future<void> Function()? delegateReset;
  const AppManager({
    super.key,
    required this.builder,
    this.configuration = const UIConfiguration(
      localeType: LocaleType.english,
    ),
    this.delegateReset,
  });

  @override
  State<AppManager> createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager>
    implements UIBehavior, AppBehavior {
  late Locale currentLocale;
  late Widget Function(ThemeData, ThemeData) adaptiveBuilder;
  late Key key = UniqueKey();
  @override
  void initState() {
    currentLocale = widget.configuration.localeType.locale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeInjector(
      key: key,
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

  @override
  Future<void> logout() async {
    await widget.delegateReset?.call();
    setState(() {
      key = UniqueKey();
    });
  }
}

extension AppManagerContext on BuildContext {
  UIBehavior get uiBehavior {
    return UIBehavior.of(this);
  }

  AppBehavior get appBehavior {
    return AppBehavior.of(this);
  }
}
