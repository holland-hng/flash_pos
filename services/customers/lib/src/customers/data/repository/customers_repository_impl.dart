import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:customers_service/src/customers/data/data_source/customers_remote_data_source.dart';
import 'package:customers_service/src/customers/domain/customers_repository.dart';

@LazySingleton(as: CustomerRepository)
class CustomerRepositoryImpl extends CustomerRepository {
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Customer>> getCustomers() async {
    final respond = await remoteDataSource.getCustomers();
    return respond.data.map((dto) => Customer.fromDto(dto)).toList();
  }
}
