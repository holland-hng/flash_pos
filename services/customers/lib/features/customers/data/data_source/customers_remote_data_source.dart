import 'package:core_dependency/core_dependency.dart';
import 'package:customers_service/features/customers/data/dto/customers_dto.dart';
import 'package:flutter/foundation.dart';

part 'customers_remote_data_source.g.dart';

@lazySingleton
@RestApi(parser: Parser.FlutterCompute)
abstract class CustomerRemoteDataSource {
  @factoryMethod
  factory CustomerRemoteDataSource(Dio dio) = _CustomerRemoteDataSource;

  @GET("/filter.php")
  Future<CustomersDto> getCustomers(
    @Query("c") String query,
  );
}
