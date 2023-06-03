import 'package:core_router/core_router.dart';
import 'package:delivery/core/route/delivery_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DeliveryApp());
}

class DeliveryApp extends StatefulWidget {
  const DeliveryApp({super.key});

  @override
  State<DeliveryApp> createState() => _DeliveryAppState();
}

class _DeliveryAppState extends State<DeliveryApp> {
  final _appRouter = DeliveryRouter();

  @override
  Widget build(BuildContext context) {
    _appRouter.navigatorKey.currentState;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        deepLinkBuilder: (_) => DeepLink.single(
          const DeliveryRoute(),
        ),
      ),
      title: 'Delivery App',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
