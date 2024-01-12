// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:primeiro_2024/app/core/themes/app_colors.dart';

class CustomFormFieldDate extends StatelessWidget {
  final String? title;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? initialValue;
  final String? labelText;

  const CustomFormFieldDate({
    Key? key,
    this.title,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.focusNode,
    this.inputFormatters,
    this.readOnly = false,
    this.initialValue,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textInputAction: textInputAction,
      validator: ((value) {
        if (value!.isEmpty) {
          return 'Campo não pode ser vazio';
        } else {
          return null;
        }
      }),
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
