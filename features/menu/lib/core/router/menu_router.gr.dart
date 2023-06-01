// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'menu_router.dart';

abstract class _$MenuRouter extends RootStackRouter {
  // ignore: unused_element
  _$MenuRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PlaceOrderRoute.name: (routeData) {
      final args = routeData.argsAs<PlaceOrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PlaceOrderScreen(
          key: args.key,
          orderItems: args.orderItems,
        ),
      );
    },
    MenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MenuScreen(),
      );
    },
  };
}

/// generated route for
/// [PlaceOrderScreen]
class PlaceOrderRoute extends PageRouteInfo<PlaceOrderRouteArgs> {
  PlaceOrderRoute({
    Key? key,
    required List<OrderItem> orderItems,
    List<PageRouteInfo>? children,
  }) : super(
          PlaceOrderRoute.name,
          args: PlaceOrderRouteArgs(
            key: key,
            orderItems: orderItems,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaceOrderRoute';

  static const PageInfo<PlaceOrderRouteArgs> page =
      PageInfo<PlaceOrderRouteArgs>(name);
}

class PlaceOrderRouteArgs {
  const PlaceOrderRouteArgs({
    this.key,
    required this.orderItems,
  });

  final Key? key;

  final List<OrderItem> orderItems;

  @override
  String toString() {
    return 'PlaceOrderRouteArgs{key: $key, orderItems: $orderItems}';
  }
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
      : super(
          MenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
