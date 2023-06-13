import 'package:core_data/core_data.dart';

abstract class CustomerRepository {
  Future<List<Customer>> getCustomers();
}
