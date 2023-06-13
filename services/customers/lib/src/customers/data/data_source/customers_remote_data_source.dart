import 'package:core_dependency/core_dependency.dart';
import 'package:customers_service/src/customers/data/dto/customers_dto.dart';
import 'package:flutter/foundation.dart';

part 'customers_remote_data_source.g.dart';

@lazySingleton
@RestApi(parser: Parser.FlutterCompute, baseUrl: 'https://dummyjson.com')
abstract class CustomerRemoteDataSource {
  @factoryMethod
  factory CustomerRemoteDataSource(Dio dio) = _CustomerRemoteDataSource;

  @GET("/users")
  Future<CustomersDto> getCustomers();
}
