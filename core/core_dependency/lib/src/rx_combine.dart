import 'package:get/get.dart';

class RxCombine<T> extends Rxn<T> {
  final List<RxInterface> rxs;

  final T Function(List<RxInterface> rxs) combiner;

  RxCombine({required this.rxs, required this.combiner}) {
    _initialize();
    value = combiner(rxs);
  }

  void _initialize() {
    everAll(rxs, (__) {
      value = combiner(rxs);
    });
  }
}
