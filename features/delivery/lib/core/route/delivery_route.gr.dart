// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'delivery_route.dart';

abstract class _$DeliveryRouter extends RootStackRouter {
  // ignore: unused_element
  _$DeliveryRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DeliveryProgressRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryProgressScreen(),
      );
    },
    DeliveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryScreen(),
      );
    },
    DeliveryMethodRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeliveryMethodScreen(),
      );
    },
  };
}

/// generated route for
/// [DeliveryProgressScreen]
class DeliveryProgressRoute extends PageRouteInfo<void> {
  const DeliveryProgressRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryProgressRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryProgressRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryScreen]
class DeliveryRoute extends PageRouteInfo<void> {
  const DeliveryRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DeliveryMethodScreen]
class DeliveryMethodRoute extends PageRouteInfo<void> {
  const DeliveryMethodRoute({List<PageRouteInfo>? children})
      : super(
          DeliveryMethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryMethodRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
