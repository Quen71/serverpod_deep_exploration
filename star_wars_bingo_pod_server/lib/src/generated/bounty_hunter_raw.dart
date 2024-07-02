/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'protocol.dart' as _i3;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class BountyHunterRaw extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  BountyHunterRaw._({
    int? id,
    required this.userInfoId,
    this.userInfo,
    this.hunterHuntedList,
  }) : super(id);

  factory BountyHunterRaw({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.HunterHunted>? hunterHuntedList,
  }) = _BountyHunterRawImpl;

  factory BountyHunterRaw.fromJson(Map<String, dynamic> jsonSerialization) {
    return BountyHunterRaw(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      hunterHuntedList: (jsonSerialization['hunterHuntedList'] as List?)
          ?.map((e) => _i3.HunterHunted.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = BountyHunterRawTable();

  static const db = BountyHunterRawRepository._();

  int userInfoId;

  _i2.UserInfo? userInfo;

  List<_i3.HunterHunted>? hunterHuntedList;

  @override
  _i1.Table get table => t;

  BountyHunterRaw copyWith({
    int? id,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.HunterHunted>? hunterHuntedList,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      if (hunterHuntedList != null)
        'hunterHuntedList':
            hunterHuntedList?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      if (hunterHuntedList != null)
        'hunterHuntedList':
            hunterHuntedList?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static BountyHunterRawInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.HunterHuntedIncludeList? hunterHuntedList,
  }) {
    return BountyHunterRawInclude._(
      userInfo: userInfo,
      hunterHuntedList: hunterHuntedList,
    );
  }

  static BountyHunterRawIncludeList includeList({
    _i1.WhereExpressionBuilder<BountyHunterRawTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BountyHunterRawTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BountyHunterRawTable>? orderByList,
    BountyHunterRawInclude? include,
  }) {
    return BountyHunterRawIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BountyHunterRaw.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BountyHunterRaw.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BountyHunterRawImpl extends BountyHunterRaw {
  _BountyHunterRawImpl({
    int? id,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    List<_i3.HunterHunted>? hunterHuntedList,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          userInfo: userInfo,
          hunterHuntedList: hunterHuntedList,
        );

  @override
  BountyHunterRaw copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    Object? userInfo = _Undefined,
    Object? hunterHuntedList = _Undefined,
  }) {
    return BountyHunterRaw(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      hunterHuntedList: hunterHuntedList is List<_i3.HunterHunted>?
          ? hunterHuntedList
          : this.hunterHuntedList?.clone(),
    );
  }
}

class BountyHunterRawTable extends _i1.Table {
  BountyHunterRawTable({super.tableRelation})
      : super(tableName: 'bounty_hunter_raw') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
  }

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  _i3.HunterHuntedTable? ___hunterHuntedList;

  _i1.ManyRelation<_i3.HunterHuntedTable>? _hunterHuntedList;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: BountyHunterRaw.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.HunterHuntedTable get __hunterHuntedList {
    if (___hunterHuntedList != null) return ___hunterHuntedList!;
    ___hunterHuntedList = _i1.createRelationTable(
      relationFieldName: '__hunterHuntedList',
      field: BountyHunterRaw.t.id,
      foreignField: _i3.HunterHunted.t.bountyHunterId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.HunterHuntedTable(tableRelation: foreignTableRelation),
    );
    return ___hunterHuntedList!;
  }

  _i1.ManyRelation<_i3.HunterHuntedTable> get hunterHuntedList {
    if (_hunterHuntedList != null) return _hunterHuntedList!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'hunterHuntedList',
      field: BountyHunterRaw.t.id,
      foreignField: _i3.HunterHunted.t.bountyHunterId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.HunterHuntedTable(tableRelation: foreignTableRelation),
    );
    _hunterHuntedList = _i1.ManyRelation<_i3.HunterHuntedTable>(
      tableWithRelations: relationTable,
      table: _i3.HunterHuntedTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _hunterHuntedList!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'hunterHuntedList') {
      return __hunterHuntedList;
    }
    return null;
  }
}

class BountyHunterRawInclude extends _i1.IncludeObject {
  BountyHunterRawInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.HunterHuntedIncludeList? hunterHuntedList,
  }) {
    _userInfo = userInfo;
    _hunterHuntedList = hunterHuntedList;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.HunterHuntedIncludeList? _hunterHuntedList;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'hunterHuntedList': _hunterHuntedList,
      };

  @override
  _i1.Table get table => BountyHunterRaw.t;
}

class BountyHunterRawIncludeList extends _i1.IncludeList {
  BountyHunterRawIncludeList._({
    _i1.WhereExpressionBuilder<BountyHunterRawTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BountyHunterRaw.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => BountyHunterRaw.t;
}

class BountyHunterRawRepository {
  const BountyHunterRawRepository._();

  final attach = const BountyHunterRawAttachRepository._();

  final attachRow = const BountyHunterRawAttachRowRepository._();

  final detach = const BountyHunterRawDetachRepository._();

  final detachRow = const BountyHunterRawDetachRowRepository._();

  Future<List<BountyHunterRaw>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BountyHunterRawTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BountyHunterRawTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BountyHunterRawTable>? orderByList,
    _i1.Transaction? transaction,
    BountyHunterRawInclude? include,
  }) async {
    return session.db.find<BountyHunterRaw>(
      where: where?.call(BountyHunterRaw.t),
      orderBy: orderBy?.call(BountyHunterRaw.t),
      orderByList: orderByList?.call(BountyHunterRaw.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<BountyHunterRaw?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BountyHunterRawTable>? where,
    int? offset,
    _i1.OrderByBuilder<BountyHunterRawTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BountyHunterRawTable>? orderByList,
    _i1.Transaction? transaction,
    BountyHunterRawInclude? include,
  }) async {
    return session.db.findFirstRow<BountyHunterRaw>(
      where: where?.call(BountyHunterRaw.t),
      orderBy: orderBy?.call(BountyHunterRaw.t),
      orderByList: orderByList?.call(BountyHunterRaw.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<BountyHunterRaw?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BountyHunterRawInclude? include,
  }) async {
    return session.db.findById<BountyHunterRaw>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<BountyHunterRaw>> insert(
    _i1.Session session,
    List<BountyHunterRaw> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BountyHunterRaw>(
      rows,
      transaction: transaction,
    );
  }

  Future<BountyHunterRaw> insertRow(
    _i1.Session session,
    BountyHunterRaw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BountyHunterRaw>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BountyHunterRaw>> update(
    _i1.Session session,
    List<BountyHunterRaw> rows, {
    _i1.ColumnSelections<BountyHunterRawTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BountyHunterRaw>(
      rows,
      columns: columns?.call(BountyHunterRaw.t),
      transaction: transaction,
    );
  }

  Future<BountyHunterRaw> updateRow(
    _i1.Session session,
    BountyHunterRaw row, {
    _i1.ColumnSelections<BountyHunterRawTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BountyHunterRaw>(
      row,
      columns: columns?.call(BountyHunterRaw.t),
      transaction: transaction,
    );
  }

  Future<List<BountyHunterRaw>> delete(
    _i1.Session session,
    List<BountyHunterRaw> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BountyHunterRaw>(
      rows,
      transaction: transaction,
    );
  }

  Future<BountyHunterRaw> deleteRow(
    _i1.Session session,
    BountyHunterRaw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BountyHunterRaw>(
      row,
      transaction: transaction,
    );
  }

  Future<List<BountyHunterRaw>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BountyHunterRawTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BountyHunterRaw>(
      where: where(BountyHunterRaw.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BountyHunterRawTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BountyHunterRaw>(
      where: where?.call(BountyHunterRaw.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BountyHunterRawAttachRepository {
  const BountyHunterRawAttachRepository._();

  Future<void> hunterHuntedList(
    _i1.Session session,
    BountyHunterRaw bountyHunterRaw,
    List<_i3.HunterHunted> hunterHunted,
  ) async {
    if (hunterHunted.any((e) => e.id == null)) {
      throw ArgumentError.notNull('hunterHunted.id');
    }
    if (bountyHunterRaw.id == null) {
      throw ArgumentError.notNull('bountyHunterRaw.id');
    }

    var $hunterHunted = hunterHunted
        .map((e) => e.copyWith(bountyHunterId: bountyHunterRaw.id))
        .toList();
    await session.db.update<_i3.HunterHunted>(
      $hunterHunted,
      columns: [_i3.HunterHunted.t.bountyHunterId],
    );
  }
}

class BountyHunterRawAttachRowRepository {
  const BountyHunterRawAttachRowRepository._();

  Future<void> userInfo(
    _i1.Session session,
    BountyHunterRaw bountyHunterRaw,
    _i2.UserInfo userInfo,
  ) async {
    if (bountyHunterRaw.id == null) {
      throw ArgumentError.notNull('bountyHunterRaw.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $bountyHunterRaw = bountyHunterRaw.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<BountyHunterRaw>(
      $bountyHunterRaw,
      columns: [BountyHunterRaw.t.userInfoId],
    );
  }

  Future<void> hunterHuntedList(
    _i1.Session session,
    BountyHunterRaw bountyHunterRaw,
    _i3.HunterHunted hunterHunted,
  ) async {
    if (hunterHunted.id == null) {
      throw ArgumentError.notNull('hunterHunted.id');
    }
    if (bountyHunterRaw.id == null) {
      throw ArgumentError.notNull('bountyHunterRaw.id');
    }

    var $hunterHunted =
        hunterHunted.copyWith(bountyHunterId: bountyHunterRaw.id);
    await session.db.updateRow<_i3.HunterHunted>(
      $hunterHunted,
      columns: [_i3.HunterHunted.t.bountyHunterId],
    );
  }
}

class BountyHunterRawDetachRepository {
  const BountyHunterRawDetachRepository._();

  Future<void> hunterHuntedList(
    _i1.Session session,
    List<_i3.HunterHunted> hunterHunted,
  ) async {
    if (hunterHunted.any((e) => e.id == null)) {
      throw ArgumentError.notNull('hunterHunted.id');
    }

    var $hunterHunted =
        hunterHunted.map((e) => e.copyWith(bountyHunterId: null)).toList();
    await session.db.update<_i3.HunterHunted>(
      $hunterHunted,
      columns: [_i3.HunterHunted.t.bountyHunterId],
    );
  }
}

class BountyHunterRawDetachRowRepository {
  const BountyHunterRawDetachRowRepository._();

  Future<void> hunterHuntedList(
    _i1.Session session,
    _i3.HunterHunted hunterHunted,
  ) async {
    if (hunterHunted.id == null) {
      throw ArgumentError.notNull('hunterHunted.id');
    }

    var $hunterHunted = hunterHunted.copyWith(bountyHunterId: null);
    await session.db.updateRow<_i3.HunterHunted>(
      $hunterHunted,
      columns: [_i3.HunterHunted.t.bountyHunterId],
    );
  }
}
