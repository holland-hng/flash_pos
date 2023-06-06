// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i4;
import 'package:core_dependency/core_dependency.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:subscription_service/database/database.dart' as _i3;
import 'package:subscription_service/di/module.dart' as _i11;
import 'package:subscription_service/src/data/repository_impl/subscription_local_data_source.dart'
    as _i5;
import 'package:subscription_service/src/data/repository_impl/subscription_remote_data_source.dart'
    as _i6;
import 'package:subscription_service/src/data/repository_impl/subscription_repository_impl.dart'
    as _i9;
import 'package:subscription_service/src/domain/subscription_service.dart'
    as _i8;
import 'package:subscription_service/subscription_service.dart' as _i10;

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
    final module = _$Module();
    gh.lazySingleton<_i3.SubscriptionDatabaseFactory>(
        () => _i3.SubscriptionDatabaseFactory(gh<_i4.AppDirectory>()));
    await gh.lazySingletonAsync<_i5.SubscriptionLocalDataSource>(
      () => _i5.SubscriptionLocalDataSource.getInstance(
          gh<_i3.SubscriptionDatabaseFactory>()),
      preResolve: true,
    );
    gh.lazySingleton<_i6.SubscriptionRemoteDataSource>(
        () => _i6.SubscriptionRemoteDataSource(gh<_i7.Dio>()));
    gh.lazySingleton<_i8.SubscriptionService>(
        () => _i9.SubscriptionRepositoryImpl(
              gh<_i5.SubscriptionLocalDataSource>(),
              gh<_i6.SubscriptionRemoteDataSource>(),
            ));
    await gh.singletonAsync<_i10.SubscriptionSnapshot>(
      () => module.subscriptionSnapshot(gh<_i10.SubscriptionService>()),
      preResolve: true,
    );
    return this;
  }
}

class _$Module extends _i11.Module {}
