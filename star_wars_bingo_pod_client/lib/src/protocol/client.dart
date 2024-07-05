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
import 'package:star_wars_bingo_pod_client/src/protocol/bounty_hunter_raw.dart'
    as _i3;
import 'package:star_wars_bingo_pod_client/src/protocol/bounty_hunter.dart'
    as _i4;
import 'package:star_wars_bingo_pod_client/src/protocol/force_user.dart' as _i5;
import 'package:star_wars_bingo_pod_client/src/protocol/force_user_type.dart'
    as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'protocol.dart' as _i8;

/// {@category Endpoint}
class EndpointBountyHunter extends _i1.EndpointRef {
  EndpointBountyHunter(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bountyHunter';

  _i2.Future<_i3.BountyHunterRaw> meRaw() =>
      caller.callServerEndpoint<_i3.BountyHunterRaw>(
        'bountyHunter',
        'meRaw',
        {},
      );

  _i2.Future<_i4.BountyHunter> me() =>
      caller.callServerEndpoint<_i4.BountyHunter>(
        'bountyHunter',
        'me',
        {},
      );

  _i2.Future<_i4.BountyHunter> addForceUserToPreysList(int forceUserId) =>
      caller.callServerEndpoint<_i4.BountyHunter>(
        'bountyHunter',
        'addForceUserToPreysList',
        {'forceUserId': forceUserId},
      );

  _i2.Future<_i4.BountyHunter> withdrawForceUserFromPreysList(
          {required int forceUserId}) =>
      caller.callServerEndpoint<_i4.BountyHunter>(
        'bountyHunter',
        'withdrawForceUserFromPreysList',
        {'forceUserId': forceUserId},
      );
}

/// {@category Endpoint}
class EndpointForceUser extends _i1.EndpointRef {
  EndpointForceUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'forceUser';

  _i2.Future<_i5.ForceUser> get({required int id}) =>
      caller.callServerEndpoint<_i5.ForceUser>(
        'forceUser',
        'get',
        {'id': id},
      );

  _i2.Future<_i5.ForceUser> create(_i5.ForceUser forceUser) =>
      caller.callServerEndpoint<_i5.ForceUser>(
        'forceUser',
        'create',
        {'forceUser': forceUser},
      );

  _i2.Future<_i5.ForceUser> update({required _i5.ForceUser forceUser}) =>
      caller.callServerEndpoint<_i5.ForceUser>(
        'forceUser',
        'update',
        {'forceUser': forceUser},
      );

  _i2.Future<int> delete({required int forceUserId}) =>
      caller.callServerEndpoint<int>(
        'forceUser',
        'delete',
        {'forceUserId': forceUserId},
      );

  _i2.Future<List<_i5.ForceUser>> withoutMasterApprentices(
          {required _i6.ForceUserType forceType}) =>
      caller.callServerEndpoint<List<_i5.ForceUser>>(
        'forceUser',
        'withoutMasterApprentices',
        {'forceType': forceType},
      );

  _i2.Future<List<_i5.ForceUser>> masters(
          {required _i6.ForceUserType forceType}) =>
      caller.callServerEndpoint<List<_i5.ForceUser>>(
        'forceUser',
        'masters',
        {'forceType': forceType},
      );

  _i2.Future<_i5.ForceUser> addApprenticeToMaster({
    required int masterId,
    required int apprenticeId,
  }) =>
      caller.callServerEndpoint<_i5.ForceUser>(
        'forceUser',
        'addApprenticeToMaster',
        {
          'masterId': masterId,
          'apprenticeId': apprenticeId,
        },
      );

  _i2.Future<_i5.ForceUser> addMasterToApprentice({
    required int apprenticeId,
    required int masterId,
  }) =>
      caller.callServerEndpoint<_i5.ForceUser>(
        'forceUser',
        'addMasterToApprentice',
        {
          'apprenticeId': apprenticeId,
          'masterId': masterId,
        },
      );

  _i2.Future<List<_i5.ForceUser>> allNotHunted() =>
      caller.callServerEndpoint<List<_i5.ForceUser>>(
        'forceUser',
        'allNotHunted',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i7.Caller(client);
  }

  late final _i7.Caller auth;
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
          _i8.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    bountyHunter = EndpointBountyHunter(this);
    forceUser = EndpointForceUser(this);
    modules = _Modules(this);
  }

  late final EndpointBountyHunter bountyHunter;

  late final EndpointForceUser forceUser;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'bountyHunter': bountyHunter,
        'forceUser': forceUser,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
