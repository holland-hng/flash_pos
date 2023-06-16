part of 'events.dart';

class PickCustomerEvent extends FlashEvent<Customer?> {
  @override
  final Customer? data;

  PickCustomerEvent({this.data});
}

class OpenCustomerPopupEvent extends FlashEvent<Customer> {
  @override
  final Customer data;

  OpenCustomerPopupEvent(this.data);
}
