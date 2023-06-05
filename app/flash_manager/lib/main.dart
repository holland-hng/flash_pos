import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/router/manager_router.dart';
import 'di/di.dart';

Future<void> main() async {
  setPathUrlStrategy();
  await configureDependencies();
  runApp(const FlashManagerApp());
}

class FlashManagerApp extends StatefulWidget {
  const FlashManagerApp({super.key});

  @override
  State<FlashManagerApp> createState() => _FlashManagerAppState();
}

class _FlashManagerAppState extends State<FlashManagerApp> {
  final appRouter = getIt<AppRouter>().router;

  @override
  Widget build(BuildContext context) {
    return AppManager(
      builder: (locale) {
        return MaterialApp.router(
          locale: locale,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(
            deepLinkBuilder: (_) => DeepLink.single(const RootRoute()),
          ),
          title: 'Flash Manager App',
          theme: ThemeData(
            useMaterial3: false,
          ),
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalWidgetsLocalizations.delegate,
            ...GlobalMaterialLocalizations.delegates,
          ],
          supportedLocales: localizedLabels.keys.toList(),
        );
      },
    );
  }
}
