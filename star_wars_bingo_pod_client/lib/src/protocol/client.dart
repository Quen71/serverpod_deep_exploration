/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:star_wars_bingo_pod_client/src/protocol/bounty_hunter.dart'
    as _i3;
import 'package:star_wars_bingo_pod_client/src/protocol/bounty_hunter_raw.dart'
    as _i4;
import 'package:star_wars_bingo_pod_client/src/protocol/force_user.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointBountyHunter extends _i1.EndpointRef {
  EndpointBountyHunter(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bountyHunter';

  _i2.Future<_i3.BountyHunter> me() =>
      caller.callServerEndpoint<_i3.BountyHunter>(
        'bountyHunter',
        'me',
        {},
      );

  _i2.Future<_i4.BountyHunterRaw> meRaw() =>
      caller.callServerEndpoint<_i4.BountyHunterRaw>(
        'bountyHunter',
        'meRaw',
        {},
      );

  _i2.Future<_i3.BountyHunter> addForceUserToBingoBook(int forceUserId) =>
      caller.callServerEndpoint<_i3.BountyHunter>(
        'bountyHunter',
        'addForceUserToBingoBook',
        {'forceUserId': forceUserId},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointForceUser extends _i1.EndpointRef {
  EndpointForceUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'forceUser';

  _i2.Future<_i5.ForceUser> create(_i5.ForceUser forceUser) =>
      caller.callServerEndpoint<_i5.ForceUser>(
        'forceUser',
        'create',
        {'forceUser': forceUser},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    bountyHunter = EndpointBountyHunter(this);
    example = EndpointExample(this);
    forceUser = EndpointForceUser(this);
    modules = _Modules(this);
  }

  late final EndpointBountyHunter bountyHunter;

  late final EndpointExample example;

  late final EndpointForceUser forceUser;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'bountyHunter': bountyHunter,
        'example': example,
        'forceUser': forceUser,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
