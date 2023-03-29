// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_books/app/injection_container.dart' as _i14;
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart'
    as _i3;
import 'package:my_books/data/remote_data_sources/quote_data_source.dart'
    as _i11;
import 'package:my_books/domain/repositories/book_repository.dart' as _i4;
import 'package:my_books/domain/repositories/quote_repository.dart' as _i12;
import 'package:my_books/features/add/cubit/add_cubit.dart' as _i9;
import 'package:my_books/features/edit/cubit/edit_cubit.dart' as _i5;
import 'package:my_books/features/home/cubit/home_cubit.dart' as _i6;
import 'package:my_books/features/quote/cubit/quote_cubit.dart' as _i13;
import 'package:my_books/features/reading%20history/cubit/reading_history_cubit.dart'
    as _i7;
import 'package:my_books/features/remove/cubit/remove_cubit.dart' as _i8;

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
    gh.factory<_i3.BookRemoteDataSource>(() => _i3.BookRemoteDataSource());
    gh.factory<_i4.BookRepository>(
        () => _i4.BookRepository(gh<_i3.BookRemoteDataSource>()));
    gh.factory<_i5.EditCubit>(() => _i5.EditCubit(gh<_i4.BookRepository>()));
    gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit(gh<_i4.BookRepository>()));
    gh.factory<_i7.ReadingHistoryCubit>(
        () => _i7.ReadingHistoryCubit(gh<_i4.BookRepository>()));
    gh.factory<_i8.RemoveCubit>(
        () => _i8.RemoveCubit(gh<_i4.BookRepository>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i9.AddCubit>(() => _i9.AddCubit(gh<_i4.BookRepository>()));
    gh.lazySingleton<_i10.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i11.QuoteRemoteRetrofitDataSource>(
        () => _i11.QuoteRemoteRetrofitDataSource(gh<_i10.Dio>()));
    gh.factory<_i12.QuoteRepository>(
        () => _i12.QuoteRepository(gh<_i11.QuoteRemoteRetrofitDataSource>()));
    gh.factory<_i13.QuoteCubit>(
        () => _i13.QuoteCubit(gh<_i12.QuoteRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
