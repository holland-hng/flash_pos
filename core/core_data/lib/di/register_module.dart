import 'package:core_data/src/app_directory.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:event_bus/event_bus.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<AppDirectory> get appDirectory => AppDirectory.getInstance();

  @lazySingleton
  EventBus get eventBus => EventBus();
}
