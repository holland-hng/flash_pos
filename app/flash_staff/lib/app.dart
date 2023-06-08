import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'di/di.dart';

class StaffApp extends StatefulWidget {
  const StaffApp({super.key});

  @override
  State<StaffApp> createState() => _StaffAppState();
}

class _StaffAppState extends State<StaffApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppManager(
      delegateReset: resetDependencies,
      builder: (locale) {
        return MaterialApp.router(
          locale: locale,
          debugShowCheckedModeBanner: false,
          routerConfig: getIt<AppRouter>().router.config(),
          title: 'Flash Staff App',
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
