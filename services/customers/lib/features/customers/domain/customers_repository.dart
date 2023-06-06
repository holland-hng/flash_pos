import 'customer.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getCustomers(String query);
}
