import 'package:flutter/material.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

class ValidateAccountDialog extends StatefulWidget {
  const ValidateAccountDialog({
    required this.validationCodeController,
    required this.accountValidateAction,
    super.key,
  });

  final TextEditingController validationCodeController;
  final Future<UserInfo?> Function() accountValidateAction;

  @override
  State<ValidateAccountDialog> createState() => _ValidateAccountDialogState();
}

class _ValidateAccountDialogState extends State<ValidateAccountDialog> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: widget.validationCodeController,
              decoration: const InputDecoration(hintText: 'Validation code'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });

                final UserInfo? res = await widget.accountValidateAction();

                if (res != null) {
                  Navigator.pop(context);
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Wrong code'),
                  ),
                );
              },
              child: const Text('Validate account'),
            ),
            if (_isLoading) const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
