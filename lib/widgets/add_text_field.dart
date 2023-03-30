import 'package:flutter/material.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({
    required this.onChanged,
    required this.text,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
    super.key,
  });
  final String text;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        onChanged: onChanged,
        autofocus: autofocus,
        textCapitalization: textCapitalization,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(text),
        ),
      ),
    );
  }
}
