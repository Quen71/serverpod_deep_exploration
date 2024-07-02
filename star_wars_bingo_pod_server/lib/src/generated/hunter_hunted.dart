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

abstract class HunterHunted extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  HunterHunted._({
    int? id,
    required this.bountyHunterId,
    this.bountyHunter,
    required this.forceUserId,
    this.forceUser,
  }) : super(id);

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

  static final t = HunterHuntedTable();

  static const db = HunterHuntedRepository._();

  int bountyHunterId;

  _i2.BountyHunterRaw? bountyHunter;

  int forceUserId;

  _i2.ForceUserRaw? forceUser;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'bountyHunterId': bountyHunterId,
      if (bountyHunter != null)
        'bountyHunter': bountyHunter?.toJsonForProtocol(),
      'forceUserId': forceUserId,
      if (forceUser != null) 'forceUser': forceUser?.toJsonForProtocol(),
    };
  }

  static HunterHuntedInclude include({
    _i2.BountyHunterRawInclude? bountyHunter,
    _i2.ForceUserRawInclude? forceUser,
  }) {
    return HunterHuntedInclude._(
      bountyHunter: bountyHunter,
      forceUser: forceUser,
    );
  }

  static HunterHuntedIncludeList includeList({
    _i1.WhereExpressionBuilder<HunterHuntedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HunterHuntedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HunterHuntedTable>? orderByList,
    HunterHuntedInclude? include,
  }) {
    return HunterHuntedIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HunterHunted.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(HunterHunted.t),
      include: include,
    );
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

class HunterHuntedTable extends _i1.Table {
  HunterHuntedTable({super.tableRelation}) : super(tableName: 'hunter_hunted') {
    bountyHunterId = _i1.ColumnInt(
      'bountyHunterId',
      this,
    );
    forceUserId = _i1.ColumnInt(
      'forceUserId',
      this,
    );
  }

  late final _i1.ColumnInt bountyHunterId;

  _i2.BountyHunterRawTable? _bountyHunter;

  late final _i1.ColumnInt forceUserId;

  _i2.ForceUserRawTable? _forceUser;

  _i2.BountyHunterRawTable get bountyHunter {
    if (_bountyHunter != null) return _bountyHunter!;
    _bountyHunter = _i1.createRelationTable(
      relationFieldName: 'bountyHunter',
      field: HunterHunted.t.bountyHunterId,
      foreignField: _i2.BountyHunterRaw.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.BountyHunterRawTable(tableRelation: foreignTableRelation),
    );
    return _bountyHunter!;
  }

  _i2.ForceUserRawTable get forceUser {
    if (_forceUser != null) return _forceUser!;
    _forceUser = _i1.createRelationTable(
      relationFieldName: 'forceUser',
      field: HunterHunted.t.forceUserId,
      foreignField: _i2.ForceUserRaw.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ForceUserRawTable(tableRelation: foreignTableRelation),
    );
    return _forceUser!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        bountyHunterId,
        forceUserId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'bountyHunter') {
      return bountyHunter;
    }
    if (relationField == 'forceUser') {
      return forceUser;
    }
    return null;
  }
}

class HunterHuntedInclude extends _i1.IncludeObject {
  HunterHuntedInclude._({
    _i2.BountyHunterRawInclude? bountyHunter,
    _i2.ForceUserRawInclude? forceUser,
  }) {
    _bountyHunter = bountyHunter;
    _forceUser = forceUser;
  }

  _i2.BountyHunterRawInclude? _bountyHunter;

  _i2.ForceUserRawInclude? _forceUser;

  @override
  Map<String, _i1.Include?> get includes => {
        'bountyHunter': _bountyHunter,
        'forceUser': _forceUser,
      };

  @override
  _i1.Table get table => HunterHunted.t;
}

class HunterHuntedIncludeList extends _i1.IncludeList {
  HunterHuntedIncludeList._({
    _i1.WhereExpressionBuilder<HunterHuntedTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HunterHunted.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => HunterHunted.t;
}

class HunterHuntedRepository {
  const HunterHuntedRepository._();

  final attachRow = const HunterHuntedAttachRowRepository._();

  Future<List<HunterHunted>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HunterHuntedTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<HunterHuntedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HunterHuntedTable>? orderByList,
    _i1.Transaction? transaction,
    HunterHuntedInclude? include,
  }) async {
    return session.db.find<HunterHunted>(
      where: where?.call(HunterHunted.t),
      orderBy: orderBy?.call(HunterHunted.t),
      orderByList: orderByList?.call(HunterHunted.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<HunterHunted?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HunterHuntedTable>? where,
    int? offset,
    _i1.OrderByBuilder<HunterHuntedTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<HunterHuntedTable>? orderByList,
    _i1.Transaction? transaction,
    HunterHuntedInclude? include,
  }) async {
    return session.db.findFirstRow<HunterHunted>(
      where: where?.call(HunterHunted.t),
      orderBy: orderBy?.call(HunterHunted.t),
      orderByList: orderByList?.call(HunterHunted.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<HunterHunted?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    HunterHuntedInclude? include,
  }) async {
    return session.db.findById<HunterHunted>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<HunterHunted>> insert(
    _i1.Session session,
    List<HunterHunted> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<HunterHunted>(
      rows,
      transaction: transaction,
    );
  }

  Future<HunterHunted> insertRow(
    _i1.Session session,
    HunterHunted row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<HunterHunted>(
      row,
      transaction: transaction,
    );
  }

  Future<List<HunterHunted>> update(
    _i1.Session session,
    List<HunterHunted> rows, {
    _i1.ColumnSelections<HunterHuntedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<HunterHunted>(
      rows,
      columns: columns?.call(HunterHunted.t),
      transaction: transaction,
    );
  }

  Future<HunterHunted> updateRow(
    _i1.Session session,
    HunterHunted row, {
    _i1.ColumnSelections<HunterHuntedTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<HunterHunted>(
      row,
      columns: columns?.call(HunterHunted.t),
      transaction: transaction,
    );
  }

  Future<List<HunterHunted>> delete(
    _i1.Session session,
    List<HunterHunted> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<HunterHunted>(
      rows,
      transaction: transaction,
    );
  }

  Future<HunterHunted> deleteRow(
    _i1.Session session,
    HunterHunted row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HunterHunted>(
      row,
      transaction: transaction,
    );
  }

  Future<List<HunterHunted>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<HunterHuntedTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<HunterHunted>(
      where: where(HunterHunted.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<HunterHuntedTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<HunterHunted>(
      where: where?.call(HunterHunted.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class HunterHuntedAttachRowRepository {
  const HunterHuntedAttachRowRepository._();

  Future<void> bountyHunter(
    _i1.Session session,
    HunterHunted hunterHunted,
    _i2.BountyHunterRaw bountyHunter,
  ) async {
    if (hunterHunted.id == null) {
      throw ArgumentError.notNull('hunterHunted.id');
    }
    if (bountyHunter.id == null) {
      throw ArgumentError.notNull('bountyHunter.id');
    }

    var $hunterHunted = hunterHunted.copyWith(bountyHunterId: bountyHunter.id);
    await session.db.updateRow<HunterHunted>(
      $hunterHunted,
      columns: [HunterHunted.t.bountyHunterId],
    );
  }

  Future<void> forceUser(
    _i1.Session session,
    HunterHunted hunterHunted,
    _i2.ForceUserRaw forceUser,
  ) async {
    if (hunterHunted.id == null) {
      throw ArgumentError.notNull('hunterHunted.id');
    }
    if (forceUser.id == null) {
      throw ArgumentError.notNull('forceUser.id');
    }

    var $hunterHunted = hunterHunted.copyWith(forceUserId: forceUser.id);
    await session.db.updateRow<HunterHunted>(
      $hunterHunted,
      columns: [HunterHunted.t.forceUserId],
    );
  }
}
