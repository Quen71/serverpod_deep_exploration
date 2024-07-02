/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'bounty_hunter.dart' as _i4;
import 'bounty_hunter_raw.dart' as _i5;
import 'droid.dart' as _i6;
import 'example.dart' as _i7;
import 'force_user.dart' as _i8;
import 'force_user_raw.dart' as _i9;
import 'force_user_type.dart' as _i10;
import 'hunter_hunted.dart' as _i11;
import 'laser_saber.dart' as _i12;
import 'protocol.dart' as _i13;
export 'bounty_hunter.dart';
export 'bounty_hunter_raw.dart';
export 'droid.dart';
export 'example.dart';
export 'force_user.dart';
export 'force_user_raw.dart';
export 'force_user_type.dart';
export 'hunter_hunted.dart';
export 'laser_saber.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'bounty_hunter_raw',
      dartName: 'BountyHunterRaw',
      schema: 'public',
      module: 'star_wars_bingo_pod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'bounty_hunter_raw_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'bounty_hunter_raw_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'bounty_hunter_raw_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'droid',
      dartName: 'Droid',
      schema: 'public',
      module: 'star_wars_bingo_pod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'droid_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'forceUserMasterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'droid_fk_0',
          columns: ['forceUserMasterId'],
          referenceTable: 'force_user_raw',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'droid_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'force_user_raw',
      dartName: 'ForceUserRaw',
      schema: 'public',
      module: 'star_wars_bingo_pod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'force_user_raw_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ForceUserType',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'laserSaberId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'masterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'force_user_raw_fk_0',
          columns: ['laserSaberId'],
          referenceTable: 'laser_saber',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'force_user_raw_fk_1',
          columns: ['masterId'],
          referenceTable: 'force_user_raw',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'force_user_raw_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'hunter_hunted',
      dartName: 'HunterHunted',
      schema: 'public',
      module: 'star_wars_bingo_pod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'hunter_hunted_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'bountyHunterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'forceUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'hunter_hunted_fk_0',
          columns: ['bountyHunterId'],
          referenceTable: 'bounty_hunter_raw',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'hunter_hunted_fk_1',
          columns: ['forceUserId'],
          referenceTable: 'force_user_raw',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'hunter_hunted_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'hunter_hunted_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bountyHunterId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'forceUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'laser_saber',
      dartName: 'LaserSaber',
      schema: 'public',
      module: 'star_wars_bingo_pod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'laser_saber_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'color',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'laser_saber_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.BountyHunter) {
      return _i4.BountyHunter.fromJson(data) as T;
    }
    if (t == _i5.BountyHunterRaw) {
      return _i5.BountyHunterRaw.fromJson(data) as T;
    }
    if (t == _i6.Droid) {
      return _i6.Droid.fromJson(data) as T;
    }
    if (t == _i7.Example) {
      return _i7.Example.fromJson(data) as T;
    }
    if (t == _i8.ForceUser) {
      return _i8.ForceUser.fromJson(data) as T;
    }
    if (t == _i9.ForceUserRaw) {
      return _i9.ForceUserRaw.fromJson(data) as T;
    }
    if (t == _i10.ForceUserType) {
      return _i10.ForceUserType.fromJson(data) as T;
    }
    if (t == _i11.HunterHunted) {
      return _i11.HunterHunted.fromJson(data) as T;
    }
    if (t == _i12.LaserSaber) {
      return _i12.LaserSaber.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.BountyHunter?>()) {
      return (data != null ? _i4.BountyHunter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.BountyHunterRaw?>()) {
      return (data != null ? _i5.BountyHunterRaw.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Droid?>()) {
      return (data != null ? _i6.Droid.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Example?>()) {
      return (data != null ? _i7.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ForceUser?>()) {
      return (data != null ? _i8.ForceUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ForceUserRaw?>()) {
      return (data != null ? _i9.ForceUserRaw.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ForceUserType?>()) {
      return (data != null ? _i10.ForceUserType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.HunterHunted?>()) {
      return (data != null ? _i11.HunterHunted.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.LaserSaber?>()) {
      return (data != null ? _i12.LaserSaber.fromJson(data) : null) as T;
    }
    if (t == List<_i13.ForceUser>) {
      return (data as List).map((e) => deserialize<_i13.ForceUser>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i13.HunterHunted>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.HunterHunted>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i13.Droid>) {
      return (data as List).map((e) => deserialize<_i13.Droid>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i13.ForceUserRaw>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.ForceUserRaw>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Droid>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Droid>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.HunterHunted>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.HunterHunted>(e))
              .toList()
          : null) as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.BountyHunter) {
      return 'BountyHunter';
    }
    if (data is _i5.BountyHunterRaw) {
      return 'BountyHunterRaw';
    }
    if (data is _i6.Droid) {
      return 'Droid';
    }
    if (data is _i7.Example) {
      return 'Example';
    }
    if (data is _i8.ForceUser) {
      return 'ForceUser';
    }
    if (data is _i9.ForceUserRaw) {
      return 'ForceUserRaw';
    }
    if (data is _i10.ForceUserType) {
      return 'ForceUserType';
    }
    if (data is _i11.HunterHunted) {
      return 'HunterHunted';
    }
    if (data is _i12.LaserSaber) {
      return 'LaserSaber';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'BountyHunter') {
      return deserialize<_i4.BountyHunter>(data['data']);
    }
    if (data['className'] == 'BountyHunterRaw') {
      return deserialize<_i5.BountyHunterRaw>(data['data']);
    }
    if (data['className'] == 'Droid') {
      return deserialize<_i6.Droid>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i7.Example>(data['data']);
    }
    if (data['className'] == 'ForceUser') {
      return deserialize<_i8.ForceUser>(data['data']);
    }
    if (data['className'] == 'ForceUserRaw') {
      return deserialize<_i9.ForceUserRaw>(data['data']);
    }
    if (data['className'] == 'ForceUserType') {
      return deserialize<_i10.ForceUserType>(data['data']);
    }
    if (data['className'] == 'HunterHunted') {
      return deserialize<_i11.HunterHunted>(data['data']);
    }
    if (data['className'] == 'LaserSaber') {
      return deserialize<_i12.LaserSaber>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.BountyHunterRaw:
        return _i5.BountyHunterRaw.t;
      case _i6.Droid:
        return _i6.Droid.t;
      case _i9.ForceUserRaw:
        return _i9.ForceUserRaw.t;
      case _i11.HunterHunted:
        return _i11.HunterHunted.t;
      case _i12.LaserSaber:
        return _i12.LaserSaber.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'star_wars_bingo_pod';
}
