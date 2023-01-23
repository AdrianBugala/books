import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_books/features/home/cubit/home_cubit.dart';

// TODO Fix an issue with 'Cannot emit new states after calling close' when sign out
class SortingPopupMenuButton extends StatelessWidget {
  const SortingPopupMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.sort),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            'Title',
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Author'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Date Added'),
        ),
      ],
      onSelected: (value) {
        if (value == 1) {
          context.read<HomeCubit>().start(sorting: 'title');
        }
        if (value == 2) {
          context.read<HomeCubit>().start(sorting: 'author');
        }
        if (value == 3) {
          context.read<HomeCubit>().start(sorting: 'date_added');
        }
      },
    );
  }
}
