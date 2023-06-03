import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';
import '/features/forgot_password/forgot_password.dart';
import '/features/login/login_screen.dart';
part 'authentication_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AuthenticationRouter extends _$AuthenticationRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/forgot-password', page: ForgotPasswordRoute.page),
      ];
}
