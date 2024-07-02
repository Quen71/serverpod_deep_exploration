/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class ForceUser
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ForceUser._({
    this.id,
    required this.type,
    required this.name,
    required this.laserSaber,
    this.master,
    required this.apprentices,
    required this.droids,
  });

  factory ForceUser({
    int? id,
    required _i2.ForceUserType type,
    required String name,
    required _i2.LaserSaber laserSaber,
    _i2.ForceUser? master,
    required List<_i2.ForceUser> apprentices,
    required List<_i2.Droid> droids,
  }) = _ForceUserImpl;

  factory ForceUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return ForceUser(
      id: jsonSerialization['id'] as int?,
      type: _i2.ForceUserType.fromJson((jsonSerialization['type'] as String)),
      name: jsonSerialization['name'] as String,
      laserSaber: _i2.LaserSaber.fromJson(
          (jsonSerialization['laserSaber'] as Map<String, dynamic>)),
      master: jsonSerialization['master'] == null
          ? null
          : _i2.ForceUser.fromJson(
              (jsonSerialization['master'] as Map<String, dynamic>)),
      apprentices: (jsonSerialization['apprentices'] as List)
          .map((e) => _i2.ForceUser.fromJson((e as Map<String, dynamic>)))
          .toList(),
      droids: (jsonSerialization['droids'] as List)
          .map((e) => _i2.Droid.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  int? id;

  _i2.ForceUserType type;

  String name;

  _i2.LaserSaber laserSaber;

  _i2.ForceUser? master;

  List<_i2.ForceUser> apprentices;

  List<_i2.Droid> droids;

  ForceUser copyWith({
    int? id,
    _i2.ForceUserType? type,
    String? name,
    _i2.LaserSaber? laserSaber,
    _i2.ForceUser? master,
    List<_i2.ForceUser>? apprentices,
    List<_i2.Droid>? droids,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'name': name,
      'laserSaber': laserSaber.toJson(),
      if (master != null) 'master': master?.toJson(),
      'apprentices': apprentices.toJson(valueToJson: (v) => v.toJson()),
      'droids': droids.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'name': name,
      'laserSaber': laserSaber.toJsonForProtocol(),
      if (master != null) 'master': master?.toJsonForProtocol(),
      'apprentices':
          apprentices.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'droids': droids.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ForceUserImpl extends ForceUser {
  _ForceUserImpl({
    int? id,
    required _i2.ForceUserType type,
    required String name,
    required _i2.LaserSaber laserSaber,
    _i2.ForceUser? master,
    required List<_i2.ForceUser> apprentices,
    required List<_i2.Droid> droids,
  }) : super._(
          id: id,
          type: type,
          name: name,
          laserSaber: laserSaber,
          master: master,
          apprentices: apprentices,
          droids: droids,
        );

  @override
  ForceUser copyWith({
    Object? id = _Undefined,
    _i2.ForceUserType? type,
    String? name,
    _i2.LaserSaber? laserSaber,
    Object? master = _Undefined,
    List<_i2.ForceUser>? apprentices,
    List<_i2.Droid>? droids,
  }) {
    return ForceUser(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      laserSaber: laserSaber ?? this.laserSaber.copyWith(),
      master: master is _i2.ForceUser? ? master : this.master?.copyWith(),
      apprentices: apprentices ?? this.apprentices.clone(),
      droids: droids ?? this.droids.clone(),
    );
  }
}
