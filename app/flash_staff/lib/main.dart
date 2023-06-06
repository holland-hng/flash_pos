import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flash_staff/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies();
  Future.delayed(const Duration(seconds: 3)).then((_) {
    FlutterNativeSplash.remove();
  });
  runApp(const StaffApp());
}

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
