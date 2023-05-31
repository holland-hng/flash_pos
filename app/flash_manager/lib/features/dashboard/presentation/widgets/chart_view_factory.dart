import 'package:core_dependency/core_dependency.dart';

enum ChartMode {
  daily,
  monthly,
  yearly,
}

@injectable
class ChartViewFactory {
  void initData(
    ChartMode mode,
  ) {
    _generateBottomSide();
    _generateLeftSide();
  }

  void _generateBottomSide() {}
  void _generateLeftSide() {}
}
