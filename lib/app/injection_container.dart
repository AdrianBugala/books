import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/data/remote_data_sources/quote_data_source.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/domain/repositories/quote_repository.dart';
import 'package:my_books/features/add/cubit/add_cubit.dart';
import 'package:my_books/features/edit/cubit/edit_cubit.dart';
import 'package:my_books/features/home/cubit/home_cubit.dart';
import 'package:my_books/features/quote/cubit/quote_cubit.dart';
import 'package:my_books/features/reading%20history/cubit/reading_history_cubit.dart';
import 'package:my_books/features/remove/cubit/remove_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // Bloc
  getIt.registerFactory(() => AddCubit(getIt()));
  getIt.registerFactory(() => EditCubit(getIt()));
  getIt.registerFactory(() => HomeCubit(getIt()));
  getIt.registerFactory(() => QuoteCubit(getIt()));
  getIt.registerFactory(() => ReadingHistoryCubit(getIt()));
  getIt.registerFactory(() => RemoveCubit(getIt()));

  // Repositories
  getIt.registerFactory(() => BookRepository(getIt()));
  getIt.registerFactory(() => QuoteRepository(getIt()));

  // Data Sources
  getIt.registerFactory(() => BookRemoteDataSource());
  getIt.registerFactory(() => QuoteRemoteRetrofitDataSource(Dio()));
}
