import 'package:flutter/material.dart';

class MyCheckboxWidget extends StatelessWidget {
  final Function(bool?) onChanged;
  final bool _isChecked = false;

  const MyCheckboxWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: _isChecked, onChanged: onChanged);
  }
}
