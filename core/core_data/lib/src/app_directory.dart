import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class AppDirectory {
  final String dir;

  AppDirectory._(this.dir);

  static Future<AppDirectory> getInstance() async {
    if (kIsWeb) {
      return AppDirectory._('.');
    }
    final dir = await getApplicationDocumentsDirectory();
    return AppDirectory._(dir.path);
  }

  String get menuFeature => _composePath(FeaturePath.menu);
  String get floorsFeature => _composePath(FeaturePath.floors);
  String get ordersFeature => _composePath(FeaturePath.orders);
  String get authenticationFeature => _composePath(FeaturePath.authentication);
  String get settingFeature => _composePath(FeaturePath.setting);
  String get deliveryFeature => _composePath(FeaturePath.delivery);
  String get mainApp => dir;

  String _composePath(FeaturePath feature) {
    return "$dir${feature.path}";
  }
}

enum FeaturePath {
  menu,
  floors,
  orders,
  authentication,
  setting,
  delivery,
}

extension FeaturePathExtension on FeaturePath {
  String get path {
    switch (this) {
      case FeaturePath.menu:
        return "/database/menu";
      case FeaturePath.floors:
        return "/database/floors";
      case FeaturePath.orders:
        return "/database/orders";
      case FeaturePath.authentication:
        return "/database/authentication";
      case FeaturePath.setting:
        return "/database/setting";
      case FeaturePath.delivery:
        return "/database/delivery";
      default:
        throw UnimplementedError();
    }
  }
}
