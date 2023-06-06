import 'package:core_router/core_router.dart';
import 'package:core_ui/core_ui.dart';
import 'package:customers_service/core/router/customers_router.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const CustomersApp());
}

class CustomersApp extends StatefulWidget {
  const CustomersApp({super.key});

  @override
  State<CustomersApp> createState() => _CustomersAppState();
}

class _CustomersAppState extends State<CustomersApp> {
  final appRouter = getIt<AppRouter>();
  final customerRouter = getIt<CustomersRouter>();
  @override
  void initState() {
    appRouter.delegateStackRouter(customerRouter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppManager(builder: (context) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Customers App',
        routerConfig: customerRouter.config(
          deepLinkBuilder: (_) => DeepLink.single(
            const CustomersRoute(),
          ),
        ),
      );
    });
  }
}
