/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class HunterHunted implements _i1.SerializableModel {
  HunterHunted._({
    this.id,
    required this.bountyHunterId,
    this.bountyHunter,
    required this.forceUserId,
    this.forceUser,
  });

  factory HunterHunted({
    int? id,
    required int bountyHunterId,
    _i2.BountyHunterRaw? bountyHunter,
    required int forceUserId,
    _i2.ForceUserRaw? forceUser,
  }) = _HunterHuntedImpl;

  factory HunterHunted.fromJson(Map<String, dynamic> jsonSerialization) {
    return HunterHunted(
      id: jsonSerialization['id'] as int?,
      bountyHunterId: jsonSerialization['bountyHunterId'] as int,
      bountyHunter: jsonSerialization['bountyHunter'] == null
          ? null
          : _i2.BountyHunterRaw.fromJson(
              (jsonSerialization['bountyHunter'] as Map<String, dynamic>)),
      forceUserId: jsonSerialization['forceUserId'] as int,
      forceUser: jsonSerialization['forceUser'] == null
          ? null
          : _i2.ForceUserRaw.fromJson(
              (jsonSerialization['forceUser'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int bountyHunterId;

  _i2.BountyHunterRaw? bountyHunter;

  int forceUserId;

  _i2.ForceUserRaw? forceUser;

  HunterHunted copyWith({
    int? id,
    int? bountyHunterId,
    _i2.BountyHunterRaw? bountyHunter,
    int? forceUserId,
    _i2.ForceUserRaw? forceUser,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'bountyHunterId': bountyHunterId,
      if (bountyHunter != null) 'bountyHunter': bountyHunter?.toJson(),
      'forceUserId': forceUserId,
      if (forceUser != null) 'forceUser': forceUser?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HunterHuntedImpl extends HunterHunted {
  _HunterHuntedImpl({
    int? id,
    required int bountyHunterId,
    _i2.BountyHunterRaw? bountyHunter,
    required int forceUserId,
    _i2.ForceUserRaw? forceUser,
  }) : super._(
          id: id,
          bountyHunterId: bountyHunterId,
          bountyHunter: bountyHunter,
          forceUserId: forceUserId,
          forceUser: forceUser,
        );

  @override
  HunterHunted copyWith({
    Object? id = _Undefined,
    int? bountyHunterId,
    Object? bountyHunter = _Undefined,
    int? forceUserId,
    Object? forceUser = _Undefined,
  }) {
    return HunterHunted(
      id: id is int? ? id : this.id,
      bountyHunterId: bountyHunterId ?? this.bountyHunterId,
      bountyHunter: bountyHunter is _i2.BountyHunterRaw?
          ? bountyHunter
          : this.bountyHunter?.copyWith(),
      forceUserId: forceUserId ?? this.forceUserId,
      forceUser: forceUser is _i2.ForceUserRaw?
          ? forceUser
          : this.forceUser?.copyWith(),
    );
  }
}
