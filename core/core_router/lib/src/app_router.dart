import 'package:auto_route/auto_route.dart';

class AppRouter {
  final RootStackRouter router;

  AppRouter(this.router);

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
}
