//@GeneratedMicroModule;TicketServicePackageModule;package:ticket_service/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/core_data.dart' as _i6;
import 'package:injectable/injectable.dart' as _i1;
import 'package:ticket_service/core/database.dart' as _i5;
import 'package:ticket_service/src/pick_product/pick_product_handler.dart'
    as _i3;
import 'package:ticket_service/src/presentation/ticket_handler.dart' as _i7;
import 'package:ticket_service/ticket_service.dart' as _i4;

class TicketServicePackageModule extends _i1.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factoryParam<_i3.PickProductHandler, _i4.TicketItem, dynamic>((
      ticketItem,
      _,
    ) =>
        _i3.PickProductHandler(ticketItem));
    gh.lazySingleton<_i5.TicketDatabaseFactory>(
        () => _i5.TicketDatabaseFactory(gh<_i6.AppDirectory>()));
    gh.factory<_i7.TicketHandler>(() => _i7.TicketHandler());
  }
}
