// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_books/app/injection_container.dart' as _i15;
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart'
    as _i4;
import 'package:my_books/data/remote_data_sources/quote_data_source.dart'
    as _i12;
import 'package:my_books/domain/repositories/book_repository.dart' as _i5;
import 'package:my_books/domain/repositories/quote_repository.dart' as _i13;
import 'package:my_books/features/add/cubit/add_cubit.dart' as _i10;
import 'package:my_books/features/auth/cubit/auth_cubit.dart' as _i3;
import 'package:my_books/features/edit/cubit/edit_cubit.dart' as _i6;
import 'package:my_books/features/home/cubit/home_cubit.dart' as _i7;
import 'package:my_books/features/quote/cubit/quote_cubit.dart' as _i14;
import 'package:my_books/features/reading%20history/cubit/reading_history_cubit.dart'
    as _i8;
import 'package:my_books/features/remove/cubit/remove_cubit.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AuthCubit>(() => _i3.AuthCubit());
    gh.factory<_i4.BookRemoteDataSource>(() => _i4.BookRemoteDataSource());
    gh.factory<_i5.BookRepository>(
        () => _i5.BookRepository(gh<_i4.BookRemoteDataSource>()));
    gh.factory<_i6.EditCubit>(() => _i6.EditCubit(gh<_i5.BookRepository>()));
    gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit(gh<_i5.BookRepository>()));
    gh.factory<_i8.ReadingHistoryCubit>(
        () => _i8.ReadingHistoryCubit(gh<_i5.BookRepository>()));
    gh.factory<_i9.RemoveCubit>(
        () => _i9.RemoveCubit(gh<_i5.BookRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i10.AddCubit>(() => _i10.AddCubit(gh<_i5.BookRepository>()));
    gh.lazySingleton<_i11.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i12.QuoteRemoteRetrofitDataSource>(
        () => _i12.QuoteRemoteRetrofitDataSource(gh<_i11.Dio>()));
    gh.factory<_i13.QuoteRepository>(
        () => _i13.QuoteRepository(gh<_i12.QuoteRemoteRetrofitDataSource>()));
    gh.factory<_i14.QuoteCubit>(
        () => _i14.QuoteCubit(gh<_i13.QuoteRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
