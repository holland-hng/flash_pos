// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'orders_router.dart';

abstract class _$OrdersRouter extends RootStackRouter {
  // ignore: unused_element
  _$OrdersRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PlaceOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceOrderScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersScreen(),
      );
    },
  };
}

/// generated route for
/// [PlaceOrderScreen]
class PlaceOrderRoute extends PageRouteInfo<void> {
  const PlaceOrderRoute({List<PageRouteInfo>? children})
      : super(
          PlaceOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
