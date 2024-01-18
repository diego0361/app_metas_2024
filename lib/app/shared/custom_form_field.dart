// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:primeiro_2024/app/core/themes/app_colors.dart';
import 'package:primeiro_2024/app/infra/models/defaults/app_string.dart';

import 'app_date_picker.dart';
import 'app_time_picker.dart';

class AppTextFormField extends StatefulWidget {
  final String? initialValue;
  final String? titleLabel;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final int? minLines;

  final Function(String value)? onChanged;
  final Function()? onTap;
  final bool password;
  final bool readOnly;
  final bool dateTimePicker;
  final dynamic controller;
  final String? Function(String? value)? validator;
  final Function(DateTime? dateTime)? changeFieldInController;

  const AppTextFormField({
    Key? key,
    this.initialValue,
    this.titleLabel,
    this.inputFormatters,
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChanged,
    this.onTap,
    this.password = false,
    this.readOnly = false,
    this.dateTimePicker = false,
    this.controller,
    this.validator,
    this.changeFieldInController,
  }) : super(key: key);

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool obscureText;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    obscureText = widget.password;

    if (widget.dateTimePicker && widget.initialValue != null) {
      _textEditingController.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${widget.titleLabel} ${widget.validator == null ? '' : '*'}',
          style: TextStyle(color: Colors.grey.shade800),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.dateTimePicker ? _textEditingController : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: border(),
            errorBorder: border(Colors.red),
            focusedBorder: border(AppColors.primaryColor),
            enabledBorder: border(),
            disabledBorder: border(),
            focusedErrorBorder: border(),
            filled: true,
            isDense: true,
            suffixIcon: widget.password
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  )
                : null,
          ),
          initialValue: widget.dateTimePicker && widget.initialValue != null
              ? null
              : widget.initialValue,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          obscureText: obscureText,
          onChanged: widget.onChanged,
          onTap: () {
            if (widget.dateTimePicker) {
              dateTimePicker(
                changeFieldInController: widget.changeFieldInController,
              );
            } else if (widget.onTap != null) {
              widget.onTap!();
            } else {
              return;
            }
          },
          readOnly: widget.readOnly,
          validator: widget.validator,
        ),
      ],
    );
  }

  InputBorder border([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: color == null
          ? BorderSide(color: Colors.grey.shade300)
          : BorderSide(color: color),
    );
  }

  dateTimePicker(
      {Function(DateTime? dateTime)? changeFieldInController}) async {
    DateTime? dateTime = await appDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );

    if (dateTime != null) {
      // ignore: use_build_context_synchronously
      TimeOfDay? timeOfDay = await appTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (timeOfDay != null) {
        dateTime = dateTime.add(Duration.zero);

        setState(() {
          _textEditingController.text = dateTimeToString(dateTime)!;
          if (changeFieldInController != null) {
            changeFieldInController(dateTime);
          } else {
            widget.controller.value.data = dateTime;
          }
        });
      }
    }
  }
}
