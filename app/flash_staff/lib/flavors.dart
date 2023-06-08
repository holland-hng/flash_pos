enum Flavor {
  production,
  staging,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.production:
        return 'Flash POS';
      case Flavor.staging:
        return 'Flash POS Staging';
      default:
        return 'title';
    }
  }

}
