part 'ticket_service.dart';

abstract class FlashEvent<T> {
  T? get data;
}
