import 'package:auto_route/auto_route.dart';
import 'package:core_dependency/core_dependency.dart';

@singleton
class AppRouter {
  late final RootStackRouter router;

  AppRouter();

  void delegateStackRouter(RootStackRouter delegateRouter) {
    router = delegateRouter;
  }

  Future<T?> push<T extends Object?>(PageRouteInfo route,
      {OnNavigationFailure? onFailure}) async {
    return router.push<T>(route, onFailure: onFailure);
  }

  bool canPop({
    bool ignoreChildRoutes = false,
    bool ignoreParentRoutes = false,
    bool ignorePagelessRoutes = false,
  }) {
    return router.canPop(
      ignoreChildRoutes: ignoreChildRoutes,
      ignoreParentRoutes: ignoreParentRoutes,
      ignorePagelessRoutes: ignorePagelessRoutes,
    );
  }

  Future<bool> pop<T extends Object?>([T? result]) async {
    return router.pop<T>(result);
  }

  Future<T?> replace<T extends Object?>(PageRouteInfo<dynamic> route,
      {void Function(NavigationFailure)? onFailure}) {
    return router.replace<T>(route, onFailure: onFailure);
  }

  Future<T?> replaceNamed<T extends Object?>(
    String path, {
    bool includePrefixMatches = false,
    void Function(NavigationFailure)? onFailure,
  }) {
    return router.replaceNamed(
      path,
      includePrefixMatches: includePrefixMatches,
      onFailure: onFailure,
    );
  }
}
