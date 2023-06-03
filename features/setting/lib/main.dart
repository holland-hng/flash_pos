import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:setting/core/router/setting_router.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await settingFeatureConfigureDependencies();
  runApp(const SettingApp());
}

class SettingApp extends StatefulWidget {
  const SettingApp({super.key});

  @override
  State<SettingApp> createState() => _SettingAppState();
}

class _SettingAppState extends State<SettingApp> {
  final appRouter = getIt<AppRouter>().router;
  @override
  Widget build(BuildContext context) {
    return ThemeInjector(
      themeService: ThemeService(
        brightness: Brightness.light,
        lightTheme: FlashLightTheme(),
        darkTheme: FlashDarkTheme(),
      ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Setting App',
        routerConfig: appRouter.config(
          deepLinkBuilder: (_) => DeepLink.single(
            const SettingRoute(),
          ),
        ),
      ),
    );
  }
}
