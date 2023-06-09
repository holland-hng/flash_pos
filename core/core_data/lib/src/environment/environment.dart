enum Flavor {
  production,
  staging,
}

class FlashEnvironment {
  static FlashEnvironment instance = FlashEnvironment._();

  FlashEnvironment._();
  Flavor _flavor = Flavor.staging;
  Flavor get flavor => _flavor;

  void enableProduction() {
    _flavor = Flavor.production;
  }

  void enableStaging() {
    _flavor = Flavor.staging;
  }
}
