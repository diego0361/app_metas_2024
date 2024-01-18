import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/themes/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String? title;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? initialValue;
  final String? labelText;
  final int? maxLines;
  final int? minLines;

  const CustomFormField({
    Key? key,
    this.title,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.readOnly = false,
    this.initialValue,
    this.labelText,
    this.maxLines,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      initialValue: initialValue,
      textInputAction: textInputAction,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Campo não pode ser vazio';
        } else {
          return null;
        }
      }),
      maxLines: maxLines,
      minLines: minLines,
      focusNode: focusNode,
      controller: controller,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 16,
        ),
        labelText: labelText,
        hintText: title,
        hintStyle: const TextStyle(
          fontSize: 17,
          color: AppColors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 0.6,
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.primaryColor.withOpacity(0.4),
          ),
        ),
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.1),
      ),
    );
  }
}
