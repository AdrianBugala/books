part of 'edit_cubit.dart';

class EditState {
  EditState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
