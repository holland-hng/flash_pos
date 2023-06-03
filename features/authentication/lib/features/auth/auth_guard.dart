import 'package:authentication/core/router/authentication_router.dart';
import 'package:authentication/features/auth/auth_service.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';

@singleton
class AuthGuard extends AutoRouteGuard {
  final AuthService authService;

  AuthGuard(this.authService);
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.authenticated || resolver.route.name == LoginRoute.name) {
      resolver.next(true);
    } else {
      router.replace(LoginRoute(onResult: (success) {
        resolver.next(success);
      }));
    }
  }
}
