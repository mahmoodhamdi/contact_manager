// widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final int? maxLines, maxLength;
  final void Function(String?)? onSaved, onChanged;

  const CustomTextField({
    super.key,
    required this.maxLines,
    this.onSaved,
    this.onChanged,
    this.maxLength,
    required this.labelText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }
        if (labelText == 'Phone') {
          final phoneRegex = RegExp(r'^(011|012|010|015)\d{8}$');
          if (!phoneRegex.hasMatch(value!)) {
            return 'Starting with 010, 011, 012, or 015\nEnter a valid 11-digit';
          }
        }

        return null;
      },
      onSaved: onSaved,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
