import 'package:serverpod/serverpod.dart';

import 'package:star_wars_bingo_pod_server/src/web/routes/root.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  auth.AuthConfig.set(auth.AuthConfig(
    minPasswordLength: 12,
    sendValidationEmail: (session, email, validationCode) async {
      print(
        'Validation code (account creation): $validationCode',
      );

      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      print(
        'Validation code (change password): $validationCode',
      );
      return true;
    },
    onUserCreated: (session, userInfo) async {
      if (userInfo.id != null) {
        final BountyHunterRaw bountyHunterRaw = BountyHunterRaw(
          userInfoId: userInfo.id!,
          userInfo: userInfo,
          hunterHuntedList: <HunterHunted>[],
        );
        await BountyHunterRaw.db.insertRow(session, bountyHunterRaw);
      }
    },
    onUserUpdated: (session, userInfo) async {
      if (userInfo.id != null) {
        // TODO: update userInfo with BountyHunterRaw CRUD operations
      }
    },
  ));

  // Start the server.
  await pod.start();
}
