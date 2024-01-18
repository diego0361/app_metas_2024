import 'package:flutter/material.dart';

class AppForm {
  final _formKey = GlobalKey<FormState>();

  bool get valido {
    return _formKey.currentState!.validate();
  }

  Widget build({required Widget child}) {
    return Form(key: _formKey, child: child);
  }
}
