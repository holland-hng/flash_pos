// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ticket_service/core/database.dart' as _i6;
import 'package:ticket_service/src/pick_product/pick_product_handler.dart'
    as _i4;
import 'package:ticket_service/src/presentation/ticket_handler.dart' as _i7;
import 'package:ticket_service/ticket_service.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.CoreDataPackageModule().init(gh);
    gh.factoryParam<_i4.PickProductHandler, _i5.TicketItem, dynamic>((
      ticketItem,
      _,
    ) =>
        _i4.PickProductHandler(ticketItem));
    gh.lazySingleton<_i6.TicketDatabaseFactory>(
        () => _i6.TicketDatabaseFactory(gh<_i3.AppDirectory>()));
    gh.factory<_i7.TicketHandler>(() => _i7.TicketHandler());
    return this;
  }
}
