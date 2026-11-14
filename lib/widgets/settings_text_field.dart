// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// A text field of the Settings form. It shows the error of [validator] only
/// after the person has left the field, and keeps it up to date from then on.
class SettingsTextField extends StatefulWidget {
  const SettingsTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    required this.onChanged,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.autofillHints,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final VoidCallback onChanged;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;

  @override
  State<SettingsTextField> createState() => _SettingsTextFieldState();
}

class _SettingsTextFieldState extends State<SettingsTextField> {
  final FocusNode _focus = FocusNode();
  bool _left = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChanged);
    _focus.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!_focus.hasFocus && !_left) setState(() => _left = true);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focus,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      onChanged: (_) {
        setState(() {});
        widget.onChanged();
      },
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        errorText: _left ? widget.validator(widget.controller.text) : null,
        errorMaxLines: 2,
      ),
    );
  }
}
