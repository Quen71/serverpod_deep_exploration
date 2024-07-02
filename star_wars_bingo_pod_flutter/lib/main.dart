import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/auth/presentation/widgets/auth.widget.dart';
import 'package:star_wars_bingo_pod_flutter/auth/presentation/widgets/validate_account.dialog.dart';

late Client client;
late SessionManager sessionManager;

void main() async {
  client = Client(
    'http://$localhost:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );

  await sessionManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final EmailAuthController _authController =
      EmailAuthController(client.modules.auth);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _validationCodeController =
      TextEditingController();

  bool _isLoading = false;
  UserInfo? _authenticatedUser;

  @override
  void initState() {
    super.initState();
    setState(() {
      _authenticatedUser = getLastSession();
    });

    sessionManager.addListener(() {
      setState(() {
        _authenticatedUser = getLastSession();
      });
    });
  }

  UserInfo? getLastSession() => sessionManager.signedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Star Wars Pod"),
        actions: [
          IconButton(
            onPressed: () {
              sessionManager.signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (_authenticatedUser == null)
                AuthWidget(
                  emailController: _emailController,
                  usernameController: _usernameController,
                  passwordController: _passwordController,
                  loginAction: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final UserInfo? res = await _authController.signIn(
                      _emailController.text,
                      _passwordController.text,
                    );

                    setState(() {
                      _isLoading = false;
                    });

                    if (res == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login failed, retry'),
                        ),
                      );
                      return;
                    }
                  },
                  createAccountAction: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final bool res = await _authController.createAccountRequest(
                      _usernameController.text,
                      _emailController.text,
                      _passwordController.text,
                    );

                    setState(() {
                      _isLoading = false;
                    });

                    if (res) {
                      showDialog(
                        context: context,
                        builder: (_) => ValidateAccountDialog(
                          validationCodeController: _validationCodeController,
                          accountValidateAction: () async =>
                              await _authController.validateAccount(
                            _emailController.text,
                            _validationCodeController.text,
                          ),
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Error while creating account'),
                      ),
                    );
                  },
                ),
              if (_isLoading) const CircularProgressIndicator(),
              if (_authenticatedUser != null)
                Text(
                  'Hi ${_authenticatedUser?.userName}!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
