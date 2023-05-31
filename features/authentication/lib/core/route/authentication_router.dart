import 'package:core_router/core_router.dart';
import '/features/forgot_password/forgot_password.dart';
import '/features/login/login_screen.dart';
part 'authentication_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AuthenticationRouter extends _$AuthenticationRouter
    with AuthenticationRouterMixin {
  @override
  List<AutoRoute> get routes => [
        loginRoute,
        forgotRoute,
      ];
}

mixin AuthenticationRouterMixin {
  final loginRoute = AutoRoute(page: LoginRoute.page);
  final forgotRoute = AutoRoute(page: ForgotPasswordRoute.page);
}
