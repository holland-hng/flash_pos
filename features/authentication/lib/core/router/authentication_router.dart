import 'package:authentication/features/login/presentation/login_screen.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';
import '/features/forgot_password/forgot_password.dart';

part 'authentication_router.gr.dart';

@singleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AuthenticationRouter extends _$AuthenticationRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/login', page: LoginRoute.page),
        AutoRoute(path: '/forgot-password', page: ForgotPasswordRoute.page),
      ];
}
