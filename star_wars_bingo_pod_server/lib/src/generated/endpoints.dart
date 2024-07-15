/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/bounty_hunter.endpoint.dart' as _i2;
import '../endpoints/force_user.endpoint.dart' as _i3;
import 'package:star_wars_bingo_pod_server/src/generated/force_user.dart'
    as _i4;
import 'package:star_wars_bingo_pod_server/src/generated/force_user_type.dart'
    as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'bountyHunter': _i2.BountyHunterEndpoint()
        ..initialize(
          server,
          'bountyHunter',
          null,
        ),
      'forceUser': _i3.ForceUserEndpoint()
        ..initialize(
          server,
          'forceUser',
          null,
        ),
    };
    connectors['bountyHunter'] = _i1.EndpointConnector(
      name: 'bountyHunter',
      endpoint: endpoints['bountyHunter']!,
      methodConnectors: {
        'me': _i1.MethodConnector(
          name: 'me',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bountyHunter'] as _i2.BountyHunterEndpoint)
                  .me(session),
        ),
        'addForceUserToPreysList': _i1.MethodConnector(
          name: 'addForceUserToPreysList',
          params: {
            'forceUserId': _i1.ParameterDescription(
              name: 'forceUserId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bountyHunter'] as _i2.BountyHunterEndpoint)
                  .addForceUserToPreysList(
            session,
            params['forceUserId'],
          ),
        ),
        'withdrawForceUserFromPreysList': _i1.MethodConnector(
          name: 'withdrawForceUserFromPreysList',
          params: {
            'forceUserId': _i1.ParameterDescription(
              name: 'forceUserId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bountyHunter'] as _i2.BountyHunterEndpoint)
                  .withdrawForceUserFromPreysList(
            session,
            forceUserId: params['forceUserId'],
          ),
        ),
      },
    );
    connectors['forceUser'] = _i1.EndpointConnector(
      name: 'forceUser',
      endpoint: endpoints['forceUser']!,
      methodConnectors: {
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint).get(
            session,
            id: params['id'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'forceUser': _i1.ParameterDescription(
              name: 'forceUser',
              type: _i1.getType<_i4.ForceUser>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint).create(
            session,
            params['forceUser'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'forceUser': _i1.ParameterDescription(
              name: 'forceUser',
              type: _i1.getType<_i4.ForceUser>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint).update(
            session,
            forceUser: params['forceUser'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'forceUserId': _i1.ParameterDescription(
              name: 'forceUserId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint).delete(
            session,
            forceUserId: params['forceUserId'],
          ),
        ),
        'withoutMasterApprentices': _i1.MethodConnector(
          name: 'withoutMasterApprentices',
          params: {
            'forceType': _i1.ParameterDescription(
              name: 'forceType',
              type: _i1.getType<_i5.ForceUserType>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint)
                  .withoutMasterApprentices(
            session,
            forceType: params['forceType'],
          ),
        ),
        'masters': _i1.MethodConnector(
          name: 'masters',
          params: {
            'forceType': _i1.ParameterDescription(
              name: 'forceType',
              type: _i1.getType<_i5.ForceUserType>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint).masters(
            session,
            forceType: params['forceType'],
          ),
        ),
        'addApprenticeToMaster': _i1.MethodConnector(
          name: 'addApprenticeToMaster',
          params: {
            'masterId': _i1.ParameterDescription(
              name: 'masterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'apprenticeId': _i1.ParameterDescription(
              name: 'apprenticeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint)
                  .addApprenticeToMaster(
            session,
            masterId: params['masterId'],
            apprenticeId: params['apprenticeId'],
          ),
        ),
        'addMasterToApprentice': _i1.MethodConnector(
          name: 'addMasterToApprentice',
          params: {
            'apprenticeId': _i1.ParameterDescription(
              name: 'apprenticeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'masterId': _i1.ParameterDescription(
              name: 'masterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint)
                  .addMasterToApprentice(
            session,
            apprenticeId: params['apprenticeId'],
            masterId: params['masterId'],
          ),
        ),
        'allNotHunted': _i1.MethodConnector(
          name: 'allNotHunted',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i3.ForceUserEndpoint)
                  .allNotHunted(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
