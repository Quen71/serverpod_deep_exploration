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

abstract class ForceUserRaw implements _i1.SerializableModel {
  ForceUserRaw._({
    this.id,
    required this.type,
    required this.name,
    this.laserSaberId,
    this.laserSaber,
    this.masterId,
    this.master,
    this.apprentices,
    this.droids,
    this.hunterHuntedList,
  });

  factory ForceUserRaw({
    int? id,
    required _i2.ForceUserType type,
    required String name,
    int? laserSaberId,
    _i2.LaserSaber? laserSaber,
    int? masterId,
    _i2.ForceUserRaw? master,
    List<_i2.ForceUserRaw>? apprentices,
    List<_i2.Droid>? droids,
    List<_i2.HunterHunted>? hunterHuntedList,
  }) = _ForceUserRawImpl;

  factory ForceUserRaw.fromJson(Map<String, dynamic> jsonSerialization) {
    return ForceUserRaw(
      id: jsonSerialization['id'] as int?,
      type: _i2.ForceUserType.fromJson((jsonSerialization['type'] as String)),
      name: jsonSerialization['name'] as String,
      laserSaberId: jsonSerialization['laserSaberId'] as int?,
      laserSaber: jsonSerialization['laserSaber'] == null
          ? null
          : _i2.LaserSaber.fromJson(
              (jsonSerialization['laserSaber'] as Map<String, dynamic>)),
      masterId: jsonSerialization['masterId'] as int?,
      master: jsonSerialization['master'] == null
          ? null
          : _i2.ForceUserRaw.fromJson(
              (jsonSerialization['master'] as Map<String, dynamic>)),
      apprentices: (jsonSerialization['apprentices'] as List?)
          ?.map((e) => _i2.ForceUserRaw.fromJson((e as Map<String, dynamic>)))
          .toList(),
      droids: (jsonSerialization['droids'] as List?)
          ?.map((e) => _i2.Droid.fromJson((e as Map<String, dynamic>)))
          .toList(),
      hunterHuntedList: (jsonSerialization['hunterHuntedList'] as List?)
          ?.map((e) => _i2.HunterHunted.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.ForceUserType type;

  String name;

  int? laserSaberId;

  _i2.LaserSaber? laserSaber;

  int? masterId;

  _i2.ForceUserRaw? master;

  List<_i2.ForceUserRaw>? apprentices;

  List<_i2.Droid>? droids;

  List<_i2.HunterHunted>? hunterHuntedList;

  ForceUserRaw copyWith({
    int? id,
    _i2.ForceUserType? type,
    String? name,
    int? laserSaberId,
    _i2.LaserSaber? laserSaber,
    int? masterId,
    _i2.ForceUserRaw? master,
    List<_i2.ForceUserRaw>? apprentices,
    List<_i2.Droid>? droids,
    List<_i2.HunterHunted>? hunterHuntedList,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'name': name,
      if (laserSaberId != null) 'laserSaberId': laserSaberId,
      if (laserSaber != null) 'laserSaber': laserSaber?.toJson(),
      if (masterId != null) 'masterId': masterId,
      if (master != null) 'master': master?.toJson(),
      if (apprentices != null)
        'apprentices': apprentices?.toJson(valueToJson: (v) => v.toJson()),
      if (droids != null)
        'droids': droids?.toJson(valueToJson: (v) => v.toJson()),
      if (hunterHuntedList != null)
        'hunterHuntedList':
            hunterHuntedList?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ForceUserRawImpl extends ForceUserRaw {
  _ForceUserRawImpl({
    int? id,
    required _i2.ForceUserType type,
    required String name,
    int? laserSaberId,
    _i2.LaserSaber? laserSaber,
    int? masterId,
    _i2.ForceUserRaw? master,
    List<_i2.ForceUserRaw>? apprentices,
    List<_i2.Droid>? droids,
    List<_i2.HunterHunted>? hunterHuntedList,
  }) : super._(
          id: id,
          type: type,
          name: name,
          laserSaberId: laserSaberId,
          laserSaber: laserSaber,
          masterId: masterId,
          master: master,
          apprentices: apprentices,
          droids: droids,
          hunterHuntedList: hunterHuntedList,
        );

  @override
  ForceUserRaw copyWith({
    Object? id = _Undefined,
    _i2.ForceUserType? type,
    String? name,
    Object? laserSaberId = _Undefined,
    Object? laserSaber = _Undefined,
    Object? masterId = _Undefined,
    Object? master = _Undefined,
    Object? apprentices = _Undefined,
    Object? droids = _Undefined,
    Object? hunterHuntedList = _Undefined,
  }) {
    return ForceUserRaw(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      laserSaberId: laserSaberId is int? ? laserSaberId : this.laserSaberId,
      laserSaber: laserSaber is _i2.LaserSaber?
          ? laserSaber
          : this.laserSaber?.copyWith(),
      masterId: masterId is int? ? masterId : this.masterId,
      master: master is _i2.ForceUserRaw? ? master : this.master?.copyWith(),
      apprentices: apprentices is List<_i2.ForceUserRaw>?
          ? apprentices
          : this.apprentices?.clone(),
      droids: droids is List<_i2.Droid>? ? droids : this.droids?.clone(),
      hunterHuntedList: hunterHuntedList is List<_i2.HunterHunted>?
          ? hunterHuntedList
          : this.hunterHuntedList?.clone(),
    );
  }
}
