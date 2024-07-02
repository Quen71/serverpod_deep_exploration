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

abstract class ForceUserRaw extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  ForceUserRaw._({
    int? id,
    required this.type,
    required this.name,
    this.laserSaberId,
    this.laserSaber,
    this.masterId,
    this.master,
    this.apprentices,
    this.droids,
    this.hunterHuntedList,
  }) : super(id);

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

  static final t = ForceUserRawTable();

  static const db = ForceUserRawRepository._();

  _i2.ForceUserType type;

  String name;

  int? laserSaberId;

  _i2.LaserSaber? laserSaber;

  int? masterId;

  _i2.ForceUserRaw? master;

  List<_i2.ForceUserRaw>? apprentices;

  List<_i2.Droid>? droids;

  List<_i2.HunterHunted>? hunterHuntedList;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'name': name,
      if (laserSaberId != null) 'laserSaberId': laserSaberId,
      if (laserSaber != null) 'laserSaber': laserSaber?.toJsonForProtocol(),
      if (masterId != null) 'masterId': masterId,
      if (master != null) 'master': master?.toJsonForProtocol(),
      if (apprentices != null)
        'apprentices':
            apprentices?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (droids != null)
        'droids': droids?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (hunterHuntedList != null)
        'hunterHuntedList':
            hunterHuntedList?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static ForceUserRawInclude include({
    _i2.LaserSaberInclude? laserSaber,
    _i2.ForceUserRawInclude? master,
    _i2.ForceUserRawIncludeList? apprentices,
    _i2.DroidIncludeList? droids,
    _i2.HunterHuntedIncludeList? hunterHuntedList,
  }) {
    return ForceUserRawInclude._(
      laserSaber: laserSaber,
      master: master,
      apprentices: apprentices,
      droids: droids,
      hunterHuntedList: hunterHuntedList,
    );
  }

  static ForceUserRawIncludeList includeList({
    _i1.WhereExpressionBuilder<ForceUserRawTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ForceUserRawTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ForceUserRawTable>? orderByList,
    ForceUserRawInclude? include,
  }) {
    return ForceUserRawIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ForceUserRaw.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ForceUserRaw.t),
      include: include,
    );
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

class ForceUserRawTable extends _i1.Table {
  ForceUserRawTable({super.tableRelation})
      : super(tableName: 'force_user_raw') {
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    laserSaberId = _i1.ColumnInt(
      'laserSaberId',
      this,
    );
    masterId = _i1.ColumnInt(
      'masterId',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.ForceUserType> type;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt laserSaberId;

  _i2.LaserSaberTable? _laserSaber;

  late final _i1.ColumnInt masterId;

  _i2.ForceUserRawTable? _master;

  _i2.ForceUserRawTable? ___apprentices;

  _i1.ManyRelation<_i2.ForceUserRawTable>? _apprentices;

  _i2.DroidTable? ___droids;

  _i1.ManyRelation<_i2.DroidTable>? _droids;

  _i2.HunterHuntedTable? ___hunterHuntedList;

  _i1.ManyRelation<_i2.HunterHuntedTable>? _hunterHuntedList;

  _i2.LaserSaberTable get laserSaber {
    if (_laserSaber != null) return _laserSaber!;
    _laserSaber = _i1.createRelationTable(
      relationFieldName: 'laserSaber',
      field: ForceUserRaw.t.laserSaberId,
      foreignField: _i2.LaserSaber.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LaserSaberTable(tableRelation: foreignTableRelation),
    );
    return _laserSaber!;
  }

  _i2.ForceUserRawTable get master {
    if (_master != null) return _master!;
    _master = _i1.createRelationTable(
      relationFieldName: 'master',
      field: ForceUserRaw.t.masterId,
      foreignField: _i2.ForceUserRaw.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ForceUserRawTable(tableRelation: foreignTableRelation),
    );
    return _master!;
  }

  _i2.ForceUserRawTable get __apprentices {
    if (___apprentices != null) return ___apprentices!;
    ___apprentices = _i1.createRelationTable(
      relationFieldName: '__apprentices',
      field: ForceUserRaw.t.id,
      foreignField: _i2.ForceUserRaw.t.masterId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ForceUserRawTable(tableRelation: foreignTableRelation),
    );
    return ___apprentices!;
  }

  _i2.DroidTable get __droids {
    if (___droids != null) return ___droids!;
    ___droids = _i1.createRelationTable(
      relationFieldName: '__droids',
      field: ForceUserRaw.t.id,
      foreignField: _i2.Droid.t.forceUserMasterId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DroidTable(tableRelation: foreignTableRelation),
    );
    return ___droids!;
  }

  _i2.HunterHuntedTable get __hunterHuntedList {
    if (___hunterHuntedList != null) return ___hunterHuntedList!;
    ___hunterHuntedList = _i1.createRelationTable(
      relationFieldName: '__hunterHuntedList',
      field: ForceUserRaw.t.id,
      foreignField: _i2.HunterHunted.t.forceUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.HunterHuntedTable(tableRelation: foreignTableRelation),
    );
    return ___hunterHuntedList!;
  }

  _i1.ManyRelation<_i2.ForceUserRawTable> get apprentices {
    if (_apprentices != null) return _apprentices!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'apprentices',
      field: ForceUserRaw.t.id,
      foreignField: _i2.ForceUserRaw.t.masterId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ForceUserRawTable(tableRelation: foreignTableRelation),
    );
    _apprentices = _i1.ManyRelation<_i2.ForceUserRawTable>(
      tableWithRelations: relationTable,
      table: _i2.ForceUserRawTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _apprentices!;
  }

  _i1.ManyRelation<_i2.DroidTable> get droids {
    if (_droids != null) return _droids!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'droids',
      field: ForceUserRaw.t.id,
      foreignField: _i2.Droid.t.forceUserMasterId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DroidTable(tableRelation: foreignTableRelation),
    );
    _droids = _i1.ManyRelation<_i2.DroidTable>(
      tableWithRelations: relationTable,
      table: _i2.DroidTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _droids!;
  }

  _i1.ManyRelation<_i2.HunterHuntedTable> get hunterHuntedList {
    if (_hunterHuntedList != null) return _hunterHuntedList!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hunterHuntedList',
      field: ForceUserRaw.t.id,
      foreignField: _i2.HunterHunted.t.forceUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.HunterHuntedTable(tableRelation: foreignTableRelation),
    );
    _hunterHuntedList = _i1.ManyRelation<_i2.HunterHuntedTable>(
      tableWithRelations: relationTable,
      table: _i2.HunterHuntedTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _hunterHuntedList!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        name,
        laserSaberId,
        masterId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'laserSaber') {
      return laserSaber;
    }
    if (relationField == 'master') {
      return master;
    }
    if (relationField == 'apprentices') {
      return __apprentices;
    }
    if (relationField == 'droids') {
      return __droids;
    }
    if (relationField == 'hunterHuntedList') {
      return __hunterHuntedList;
    }
    return null;
  }
}

class ForceUserRawInclude extends _i1.IncludeObject {
  ForceUserRawInclude._({
    _i2.LaserSaberInclude? laserSaber,
    _i2.ForceUserRawInclude? master,
    _i2.ForceUserRawIncludeList? apprentices,
    _i2.DroidIncludeList? droids,
    _i2.HunterHuntedIncludeList? hunterHuntedList,
  }) {
    _laserSaber = laserSaber;
    _master = master;
    _apprentices = apprentices;
    _droids = droids;
    _hunterHuntedList = hunterHuntedList;
  }

  _i2.LaserSaberInclude? _laserSaber;

  _i2.ForceUserRawInclude? _master;

  _i2.ForceUserRawIncludeList? _apprentices;

  _i2.DroidIncludeList? _droids;

  _i2.HunterHuntedIncludeList? _hunterHuntedList;

  @override
  Map<String, _i1.Include?> get includes => {
        'laserSaber': _laserSaber,
        'master': _master,
        'apprentices': _apprentices,
        'droids': _droids,
        'hunterHuntedList': _hunterHuntedList,
      };

  @override
  _i1.Table get table => ForceUserRaw.t;
}

class ForceUserRawIncludeList extends _i1.IncludeList {
  ForceUserRawIncludeList._({
    _i1.WhereExpressionBuilder<ForceUserRawTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ForceUserRaw.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => ForceUserRaw.t;
}

class ForceUserRawRepository {
  const ForceUserRawRepository._();

  final attach = const ForceUserRawAttachRepository._();

  final attachRow = const ForceUserRawAttachRowRepository._();

  final detach = const ForceUserRawDetachRepository._();

  final detachRow = const ForceUserRawDetachRowRepository._();

  Future<List<ForceUserRaw>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ForceUserRawTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ForceUserRawTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ForceUserRawTable>? orderByList,
    _i1.Transaction? transaction,
    ForceUserRawInclude? include,
  }) async {
    return session.db.find<ForceUserRaw>(
      where: where?.call(ForceUserRaw.t),
      orderBy: orderBy?.call(ForceUserRaw.t),
      orderByList: orderByList?.call(ForceUserRaw.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<ForceUserRaw?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ForceUserRawTable>? where,
    int? offset,
    _i1.OrderByBuilder<ForceUserRawTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ForceUserRawTable>? orderByList,
    _i1.Transaction? transaction,
    ForceUserRawInclude? include,
  }) async {
    return session.db.findFirstRow<ForceUserRaw>(
      where: where?.call(ForceUserRaw.t),
      orderBy: orderBy?.call(ForceUserRaw.t),
      orderByList: orderByList?.call(ForceUserRaw.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<ForceUserRaw?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ForceUserRawInclude? include,
  }) async {
    return session.db.findById<ForceUserRaw>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<ForceUserRaw>> insert(
    _i1.Session session,
    List<ForceUserRaw> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ForceUserRaw>(
      rows,
      transaction: transaction,
    );
  }

  Future<ForceUserRaw> insertRow(
    _i1.Session session,
    ForceUserRaw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ForceUserRaw>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ForceUserRaw>> update(
    _i1.Session session,
    List<ForceUserRaw> rows, {
    _i1.ColumnSelections<ForceUserRawTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ForceUserRaw>(
      rows,
      columns: columns?.call(ForceUserRaw.t),
      transaction: transaction,
    );
  }

  Future<ForceUserRaw> updateRow(
    _i1.Session session,
    ForceUserRaw row, {
    _i1.ColumnSelections<ForceUserRawTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ForceUserRaw>(
      row,
      columns: columns?.call(ForceUserRaw.t),
      transaction: transaction,
    );
  }

  Future<List<ForceUserRaw>> delete(
    _i1.Session session,
    List<ForceUserRaw> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ForceUserRaw>(
      rows,
      transaction: transaction,
    );
  }

  Future<ForceUserRaw> deleteRow(
    _i1.Session session,
    ForceUserRaw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ForceUserRaw>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ForceUserRaw>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ForceUserRawTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ForceUserRaw>(
      where: where(ForceUserRaw.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ForceUserRawTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ForceUserRaw>(
      where: where?.call(ForceUserRaw.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ForceUserRawAttachRepository {
  const ForceUserRawAttachRepository._();

  Future<void> apprentices(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    List<_i2.ForceUserRaw> nestedForceUserRaw,
  ) async {
    if (nestedForceUserRaw.any((e) => e.id == null)) {
      throw ArgumentError.notNull('nestedForceUserRaw.id');
    }
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $nestedForceUserRaw = nestedForceUserRaw
        .map((e) => e.copyWith(masterId: forceUserRaw.id))
        .toList();
    await session.db.update<_i2.ForceUserRaw>(
      $nestedForceUserRaw,
      columns: [_i2.ForceUserRaw.t.masterId],
    );
  }

  Future<void> droids(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    List<_i2.Droid> droid,
  ) async {
    if (droid.any((e) => e.id == null)) {
      throw ArgumentError.notNull('droid.id');
    }
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $droid = droid
        .map((e) => e.copyWith(forceUserMasterId: forceUserRaw.id))
        .toList();
    await session.db.update<_i2.Droid>(
      $droid,
      columns: [_i2.Droid.t.forceUserMasterId],
    );
  }

  Future<void> hunterHuntedList(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    List<_i2.HunterHunted> hunterHunted,
  ) async {
    if (hunterHunted.any((e) => e.id == null)) {
      throw ArgumentError.notNull('hunterHunted.id');
    }
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $hunterHunted = hunterHunted
        .map((e) => e.copyWith(forceUserId: forceUserRaw.id))
        .toList();
    await session.db.update<_i2.HunterHunted>(
      $hunterHunted,
      columns: [_i2.HunterHunted.t.forceUserId],
    );
  }
}

class ForceUserRawAttachRowRepository {
  const ForceUserRawAttachRowRepository._();

  Future<void> laserSaber(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    _i2.LaserSaber laserSaber,
  ) async {
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }
    if (laserSaber.id == null) {
      throw ArgumentError.notNull('laserSaber.id');
    }

    var $forceUserRaw = forceUserRaw.copyWith(laserSaberId: laserSaber.id);
    await session.db.updateRow<ForceUserRaw>(
      $forceUserRaw,
      columns: [ForceUserRaw.t.laserSaberId],
    );
  }

  Future<void> master(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    _i2.ForceUserRaw master,
  ) async {
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }
    if (master.id == null) {
      throw ArgumentError.notNull('master.id');
    }

    var $forceUserRaw = forceUserRaw.copyWith(masterId: master.id);
    await session.db.updateRow<ForceUserRaw>(
      $forceUserRaw,
      columns: [ForceUserRaw.t.masterId],
    );
  }

  Future<void> apprentices(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    _i2.ForceUserRaw nestedForceUserRaw,
  ) async {
    if (nestedForceUserRaw.id == null) {
      throw ArgumentError.notNull('nestedForceUserRaw.id');
    }
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $nestedForceUserRaw =
        nestedForceUserRaw.copyWith(masterId: forceUserRaw.id);
    await session.db.updateRow<_i2.ForceUserRaw>(
      $nestedForceUserRaw,
      columns: [_i2.ForceUserRaw.t.masterId],
    );
  }

  Future<void> droids(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    _i2.Droid droid,
  ) async {
    if (droid.id == null) {
      throw ArgumentError.notNull('droid.id');
    }
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $droid = droid.copyWith(forceUserMasterId: forceUserRaw.id);
    await session.db.updateRow<_i2.Droid>(
      $droid,
      columns: [_i2.Droid.t.forceUserMasterId],
    );
  }

  Future<void> hunterHuntedList(
    _i1.Session session,
    ForceUserRaw forceUserRaw,
    _i2.HunterHunted hunterHunted,
  ) async {
    if (hunterHunted.id == null) {
      throw ArgumentError.notNull('hunterHunted.id');
    }
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $hunterHunted = hunterHunted.copyWith(forceUserId: forceUserRaw.id);
    await session.db.updateRow<_i2.HunterHunted>(
      $hunterHunted,
      columns: [_i2.HunterHunted.t.forceUserId],
    );
  }
}

class ForceUserRawDetachRepository {
  const ForceUserRawDetachRepository._();

  Future<void> apprentices(
    _i1.Session session,
    List<_i2.ForceUserRaw> forceUserRaw,
  ) async {
    if (forceUserRaw.any((e) => e.id == null)) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $forceUserRaw =
        forceUserRaw.map((e) => e.copyWith(masterId: null)).toList();
    await session.db.update<_i2.ForceUserRaw>(
      $forceUserRaw,
      columns: [_i2.ForceUserRaw.t.masterId],
    );
  }

  Future<void> hunterHuntedList(
    _i1.Session session,
    List<_i2.HunterHunted> hunterHunted,
  ) async {
    if (hunterHunted.any((e) => e.id == null)) {
      throw ArgumentError.notNull('hunterHunted.id');
    }

    var $hunterHunted =
        hunterHunted.map((e) => e.copyWith(forceUserId: null)).toList();
    await session.db.update<_i2.HunterHunted>(
      $hunterHunted,
      columns: [_i2.HunterHunted.t.forceUserId],
    );
  }
}

class ForceUserRawDetachRowRepository {
  const ForceUserRawDetachRowRepository._();

  Future<void> laserSaber(
    _i1.Session session,
    ForceUserRaw forceuserraw,
  ) async {
    if (forceuserraw.id == null) {
      throw ArgumentError.notNull('forceuserraw.id');
    }

    var $forceuserraw = forceuserraw.copyWith(laserSaberId: null);
    await session.db.updateRow<ForceUserRaw>(
      $forceuserraw,
      columns: [ForceUserRaw.t.laserSaberId],
    );
  }

  Future<void> master(
    _i1.Session session,
    ForceUserRaw forceuserraw,
  ) async {
    if (forceuserraw.id == null) {
      throw ArgumentError.notNull('forceuserraw.id');
    }

    var $forceuserraw = forceuserraw.copyWith(masterId: null);
    await session.db.updateRow<ForceUserRaw>(
      $forceuserraw,
      columns: [ForceUserRaw.t.masterId],
    );
  }

  Future<void> apprentices(
    _i1.Session session,
    _i2.ForceUserRaw forceUserRaw,
  ) async {
    if (forceUserRaw.id == null) {
      throw ArgumentError.notNull('forceUserRaw.id');
    }

    var $forceUserRaw = forceUserRaw.copyWith(masterId: null);
    await session.db.updateRow<_i2.ForceUserRaw>(
      $forceUserRaw,
      columns: [_i2.ForceUserRaw.t.masterId],
    );
  }

  Future<void> hunterHuntedList(
    _i1.Session session,
    _i2.HunterHunted hunterHunted,
  ) async {
    if (hunterHunted.id == null) {
      throw ArgumentError.notNull('hunterHunted.id');
    }

    var $hunterHunted = hunterHunted.copyWith(forceUserId: null);
    await session.db.updateRow<_i2.HunterHunted>(
      $hunterHunted,
      columns: [_i2.HunterHunted.t.forceUserId],
    );
  }
}
