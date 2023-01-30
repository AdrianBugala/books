import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/app/core/enums.dart';
import 'package:my_books/data/remote_data_sources/book_remote_data_source.dart';
import 'package:my_books/data/remote_data_sources/quote_data_source.dart';
import 'package:my_books/domain/repositories/quote_repository.dart';
import 'package:my_books/features/add/pages/add_page.dart';
import 'package:my_books/features/auth/pages/user_profile.dart';
import 'package:my_books/features/home/cubit/home_cubit.dart';
import 'package:my_books/domain/repositories/book_repository.dart';
import 'package:my_books/features/home/pages/book_thumbnail.dart';
import 'package:my_books/features/home/pages/sorting_popup_menu_button.dart';
import 'package:my_books/features/quote/cubit/quote_cubit.dart';
import 'package:my_books/features/quote/pages/quote_page.dart';
import 'package:my_books/widgets/number_of_book.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(BookRepository(BookRemoteDataSource()))
        ..start(sorting: 'title'),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unknown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final bookListLength = state.bookModel.length;
          final bookModels = state.bookModel;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Books'),
              actions: [
                const SortingPopupMenuButton(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const UserProfile()));
                    },
                    icon: const Icon(Icons.person))
              ],
            ),
            body: BlocProvider(
              create: (context) =>
                  QuoteCubit(QuoteRepository(QuoteDataSource()))..getQuote(),
              child: BlocBuilder<QuoteCubit, QuoteState>(
                builder: (context, state) {
                  return Builder(builder: (context) {
                    if (currentIndex == 0) {
                      return ListView(
                        children: [
                          NumberOfBook(numberOfBook: bookListLength),
                          for (final bookModel in bookModels)
                            BookThumbnail(
                              bookModel: bookModel,
                            ),
                        ],
                      );
                    } else {
                      if (state.quoteModel != null) {
                        return QuotePage(quoteModel: state.quoteModel!);
                      }
                      return const Center(child: Text('No quotes'));
                    }
                  });
                },
              ),
            ),
            floatingActionButton: currentIndex == 0
                ? FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AddPage(),
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  )
                : null,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              backgroundColor: Colors.blue,
              fixedColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_rounded), label: 'Books'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.format_quote_rounded), label: 'Quote'),
              ],
            ),
          );
        },
      ),
    );
  }
}
