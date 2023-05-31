import 'package:authentication/core/route/authentication_router.dart';
import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AuthenticationApp());
}

class AuthenticationApp extends StatefulWidget {
  const AuthenticationApp({super.key});

  @override
  State<AuthenticationApp> createState() => _AuthenticationAppState();
}

class _AuthenticationAppState extends State<AuthenticationApp> {
  final _appRouter = AuthenticationRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        deepLinkBuilder: (_) => const DeepLink([LoginRoute()]),
      ),
      title: 'Authentication App',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
