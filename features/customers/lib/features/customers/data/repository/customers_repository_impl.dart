import 'package:core_dependency/core_dependency.dart';
import 'package:customers/features/customers/data/data_source/customers_remote_data_source.dart';
import 'package:customers/features/customers/domain/customer.dart';
import 'package:customers/features/customers/domain/customers_repository.dart';

@LazySingleton(as: CustomerRepository)
class CustomerRepositoryImpl extends CustomerRepository {
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Customer>> getCustomers(String query) async {
    final respond = await remoteDataSource.getCustomers(query);
    return respond.data.map((dto) => Customer.fromDto(dto)).toList();
  }
}
