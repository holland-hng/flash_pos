import 'package:core_data/core_data.dart';

part 'ticket_service.dart';

abstract class FlashEvent<T> {
  T? get data;
}
