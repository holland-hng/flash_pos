import 'package:core_data/core_data.dart';

import 'main.dart' as runner;

Future<void> main() async {
  FlashEnvironment.instance.enableStaging();
  await runner.main();
}
