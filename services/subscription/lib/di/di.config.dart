// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_dependency/core_dependency.dart' as _i8;
import 'package:core_router/core_router.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:subscription_service/database/database.dart' as _i5;
import 'package:subscription_service/di/module.dart' as _i12;
import 'package:subscription_service/src/data/repository_impl/subscription_local_data_source.dart'
    as _i6;
import 'package:subscription_service/src/data/repository_impl/subscription_remote_data_source.dart'
    as _i7;
import 'package:subscription_service/src/data/repository_impl/subscription_repository_impl.dart'
    as _i10;
import 'package:subscription_service/src/domain/subscription_service.dart'
    as _i9;
import 'package:subscription_service/subscription_service.dart' as _i11;

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
    await _i4.CoreRouterPackageModule().init(gh);
    final module = _$Module();
    gh.lazySingleton<_i5.SubscriptionDatabaseFactory>(
        () => _i5.SubscriptionDatabaseFactory(gh<_i3.AppDirectory>()));
    await gh.lazySingletonAsync<_i6.SubscriptionLocalDataSource>(
      () => _i6.SubscriptionLocalDataSource.getInstance(
          gh<_i5.SubscriptionDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i7.SubscriptionRemoteDataSource>(
        () => _i7.SubscriptionRemoteDataSource(gh<_i8.Dio>()));
    gh.lazySingleton<_i9.SubscriptionService>(
        () => _i10.SubscriptionRepositoryImpl(
              gh<_i6.SubscriptionLocalDataSource>(),
              gh<_i7.SubscriptionRemoteDataSource>(),
            ));
    await gh.singletonAsync<_i11.SubscriptionSnapshot>(
      () => module.subscriptionSnapshot(gh<_i11.SubscriptionService>()),
      preResolve: true,
    );
    return this;
  }
}

class _$Module extends _i12.Module {}
