// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'customers_router.dart';

abstract class _$CustomersRouter extends RootStackRouter {
  // ignore: unused_element
  _$CustomersRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CustomersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomersScreen(),
      );
    }
  };
}

/// generated route for
/// [CustomersScreen]
class CustomersRoute extends PageRouteInfo<void> {
  const CustomersRoute({List<PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
