// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'floor_table_router.dart';

abstract class _$FloorTableRouter extends RootStackRouter {
  // ignore: unused_element
  _$FloorTableRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PlaceOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PlaceOrderScreen(),
      );
    },
    FloorTableRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FloorTableScreen(),
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
/// [FloorTableScreen]
class FloorTableRoute extends PageRouteInfo<void> {
  const FloorTableRoute({List<PageRouteInfo>? children})
      : super(
          FloorTableRoute.name,
          initialChildren: children,
        );

  static const String name = 'FloorTableRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
