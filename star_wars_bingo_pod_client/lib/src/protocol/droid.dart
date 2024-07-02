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

abstract class Droid implements _i1.SerializableModel {
  Droid._({
    this.id,
    required this.name,
    required this.forceUserMasterId,
    this.forceUserMaster,
  });

  factory Droid({
    int? id,
    required String name,
    required int forceUserMasterId,
    _i2.ForceUserRaw? forceUserMaster,
  }) = _DroidImpl;

  factory Droid.fromJson(Map<String, dynamic> jsonSerialization) {
    return Droid(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      forceUserMasterId: jsonSerialization['forceUserMasterId'] as int,
      forceUserMaster: jsonSerialization['forceUserMaster'] == null
          ? null
          : _i2.ForceUserRaw.fromJson(
              (jsonSerialization['forceUserMaster'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int forceUserMasterId;

  _i2.ForceUserRaw? forceUserMaster;

  Droid copyWith({
    int? id,
    String? name,
    int? forceUserMasterId,
    _i2.ForceUserRaw? forceUserMaster,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'forceUserMasterId': forceUserMasterId,
      if (forceUserMaster != null) 'forceUserMaster': forceUserMaster?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DroidImpl extends Droid {
  _DroidImpl({
    int? id,
    required String name,
    required int forceUserMasterId,
    _i2.ForceUserRaw? forceUserMaster,
  }) : super._(
          id: id,
          name: name,
          forceUserMasterId: forceUserMasterId,
          forceUserMaster: forceUserMaster,
        );

  @override
  Droid copyWith({
    Object? id = _Undefined,
    String? name,
    int? forceUserMasterId,
    Object? forceUserMaster = _Undefined,
  }) {
    return Droid(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      forceUserMasterId: forceUserMasterId ?? this.forceUserMasterId,
      forceUserMaster: forceUserMaster is _i2.ForceUserRaw?
          ? forceUserMaster
          : this.forceUserMaster?.copyWith(),
    );
  }
}
