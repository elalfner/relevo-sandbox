// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../models/settings_validation.dart';
import '../state/settings_controller.dart';
import '../widgets/discard_changes_dialog.dart';
import '../widgets/settings_text_field.dart';
import '../widgets/theme_mode_chooser.dart';
import 'settings_strings.dart';

/// The Settings form: name, email, age, notifications and the theme.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.controller});

  final SettingsController controller;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _age = TextEditingController();
  bool _notifications = true;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _age.dispose();
    super.dispose();
  }

  bool get _isValid =>
      validateName(_name.text) == null &&
      validateEmail(_email.text) == null &&
      validateAge(_age.text) == null;

  bool get _hasUnsavedChanges => widget.controller.hasUnsavedChanges(
    name: _name.text,
    email: _email.text,
    age: _age.text,
    notifications: _notifications,
  );

  void _refresh() => setState(() {});

  void _save() {
    widget.controller.save(
      name: _name.text,
      email: _email.text,
      age: _age.text,
      notifications: _notifications,
    );
    setState(() {});
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text(SettingsStrings.saved)));
  }

  Future<void> _onPopInvoked(bool didPop, Object? result) async {
    if (didPop) return;
    final discard = await showDiscardChangesDialog(context);
    if (discard && mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final canSave = _isValid && _hasUnsavedChanges;
    return PopScope(
      canPop: !_hasUnsavedChanges,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        appBar: AppBar(title: const Text(SettingsStrings.title)),
        body: ListenableBuilder(
          listenable: widget.controller,
          builder: (context, _) => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              SettingsTextField(
                label: SettingsStrings.nameLabel,
                controller: _name,
                validator: validateName,
                onChanged: _refresh,
                autofillHints: const [AutofillHints.name],
              ),
              const SizedBox(height: 16),
              SettingsTextField(
                label: SettingsStrings.emailLabel,
                controller: _email,
                validator: validateEmail,
                onChanged: _refresh,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
              ),
              const SizedBox(height: 16),
              SettingsTextField(
                label: SettingsStrings.ageLabel,
                controller: _age,
                validator: validateAge,
                onChanged: _refresh,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 8),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text(SettingsStrings.notificationsLabel),
                value: _notifications,
                onChanged: (value) => setState(() => _notifications = value),
              ),
              const SizedBox(height: 8),
              ThemeModeChooser(
                mode: widget.controller.themeMode,
                onChanged: widget.controller.setThemeMode,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: canSave ? _save : null,
                child: const Text(SettingsStrings.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
