import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:orders/core/router/orders_router.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ordersFeatureConfigureDependencies();
  runApp(const OrdersApp());
}

class OrdersApp extends StatefulWidget {
  const OrdersApp({super.key});

  @override
  State<OrdersApp> createState() => _OrdersAppState();
}

class _OrdersAppState extends State<OrdersApp> {
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
        title: 'Orders App',
        routerConfig: appRouter.config(
          deepLinkBuilder: (_) => DeepLink.single(
            const OrdersRoute(),
          ),
        ),
      ),
    );
  }
}
