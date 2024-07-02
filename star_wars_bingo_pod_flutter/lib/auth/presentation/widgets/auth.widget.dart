import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.loginAction,
    required this.createAccountAction,
  });

  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback loginAction;
  final VoidCallback createAccountAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: emailController,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: usernameController,
          decoration: const InputDecoration(hintText: 'Username'),
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: loginAction,
                child: const Text("Login"),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: createAccountAction,
                child: const Text("Create account"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
