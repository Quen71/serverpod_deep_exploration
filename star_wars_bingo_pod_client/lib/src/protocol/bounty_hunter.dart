/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'protocol.dart' as _i3;

abstract class BountyHunter implements _i1.SerializableModel {
  BountyHunter._({
    this.id,
    required this.userInfo,
    required this.forceUsers,
  });

  factory BountyHunter({
    int? id,
    required _i2.UserInfo userInfo,
    required List<_i3.ForceUser> forceUsers,
  }) = _BountyHunterImpl;

  factory BountyHunter.fromJson(Map<String, dynamic> jsonSerialization) {
    return BountyHunter(
      id: jsonSerialization['id'] as int?,
      userInfo: _i2.UserInfo.fromJson(
          (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      forceUsers: (jsonSerialization['forceUsers'] as List)
          .map((e) => _i3.ForceUser.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  int? id;

  _i2.UserInfo userInfo;

  List<_i3.ForceUser> forceUsers;

  BountyHunter copyWith({
    int? id,
    _i2.UserInfo? userInfo,
    List<_i3.ForceUser>? forceUsers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfo': userInfo.toJson(),
      'forceUsers': forceUsers.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BountyHunterImpl extends BountyHunter {
  _BountyHunterImpl({
    int? id,
    required _i2.UserInfo userInfo,
    required List<_i3.ForceUser> forceUsers,
  }) : super._(
          id: id,
          userInfo: userInfo,
          forceUsers: forceUsers,
        );

  @override
  BountyHunter copyWith({
    Object? id = _Undefined,
    _i2.UserInfo? userInfo,
    List<_i3.ForceUser>? forceUsers,
  }) {
    return BountyHunter(
      id: id is int? ? id : this.id,
      userInfo: userInfo ?? this.userInfo.copyWith(),
      forceUsers: forceUsers ?? this.forceUsers.clone(),
    );
  }
}
