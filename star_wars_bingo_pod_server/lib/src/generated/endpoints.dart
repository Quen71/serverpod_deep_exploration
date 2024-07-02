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
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/force_user.endpoint.dart' as _i4;
import 'package:star_wars_bingo_pod_server/src/generated/force_user.dart'
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
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'forceUser': _i4.ForceUserEndpoint()
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
        'meRaw': _i1.MethodConnector(
          name: 'meRaw',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['bountyHunter'] as _i2.BountyHunterEndpoint)
                  .meRaw(session),
        ),
        'addForceUserToBingoBook': _i1.MethodConnector(
          name: 'addForceUserToBingoBook',
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
                  .addForceUserToBingoBook(
            session,
            params['forceUserId'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['forceUser'] = _i1.EndpointConnector(
      name: 'forceUser',
      endpoint: endpoints['forceUser']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'forceUser': _i1.ParameterDescription(
              name: 'forceUser',
              type: _i1.getType<_i5.ForceUser>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['forceUser'] as _i4.ForceUserEndpoint).create(
            session,
            params['forceUser'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
