import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:menu/core/router/menu_router.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MenuApp());
}

class MenuApp extends StatefulWidget {
  const MenuApp({super.key});

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
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
        title: 'Menu App',
        routerConfig: appRouter.config(
          deepLinkBuilder: (_) => DeepLink.single(const MenuRoute()),
        ),
      ),
    );
  }
}
