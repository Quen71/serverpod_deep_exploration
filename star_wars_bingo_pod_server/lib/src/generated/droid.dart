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

abstract class Droid extends _i1.TableRow implements _i1.ProtocolSerialization {
  Droid._({
    int? id,
    required this.name,
    required this.forceUserMasterId,
    this.forceUserMaster,
  }) : super(id);

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

  static final t = DroidTable();

  static const db = DroidRepository._();

  String name;

  int forceUserMasterId;

  _i2.ForceUserRaw? forceUserMaster;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'forceUserMasterId': forceUserMasterId,
      if (forceUserMaster != null)
        'forceUserMaster': forceUserMaster?.toJsonForProtocol(),
    };
  }

  static DroidInclude include({_i2.ForceUserRawInclude? forceUserMaster}) {
    return DroidInclude._(forceUserMaster: forceUserMaster);
  }

  static DroidIncludeList includeList({
    _i1.WhereExpressionBuilder<DroidTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DroidTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DroidTable>? orderByList,
    DroidInclude? include,
  }) {
    return DroidIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Droid.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Droid.t),
      include: include,
    );
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

class DroidTable extends _i1.Table {
  DroidTable({super.tableRelation}) : super(tableName: 'droid') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    forceUserMasterId = _i1.ColumnInt(
      'forceUserMasterId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt forceUserMasterId;

  _i2.ForceUserRawTable? _forceUserMaster;

  _i2.ForceUserRawTable get forceUserMaster {
    if (_forceUserMaster != null) return _forceUserMaster!;
    _forceUserMaster = _i1.createRelationTable(
      relationFieldName: 'forceUserMaster',
      field: Droid.t.forceUserMasterId,
      foreignField: _i2.ForceUserRaw.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ForceUserRawTable(tableRelation: foreignTableRelation),
    );
    return _forceUserMaster!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        forceUserMasterId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'forceUserMaster') {
      return forceUserMaster;
    }
    return null;
  }
}

class DroidInclude extends _i1.IncludeObject {
  DroidInclude._({_i2.ForceUserRawInclude? forceUserMaster}) {
    _forceUserMaster = forceUserMaster;
  }

  _i2.ForceUserRawInclude? _forceUserMaster;

  @override
  Map<String, _i1.Include?> get includes =>
      {'forceUserMaster': _forceUserMaster};

  @override
  _i1.Table get table => Droid.t;
}

class DroidIncludeList extends _i1.IncludeList {
  DroidIncludeList._({
    _i1.WhereExpressionBuilder<DroidTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Droid.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Droid.t;
}

class DroidRepository {
  const DroidRepository._();

  final attachRow = const DroidAttachRowRepository._();

  Future<List<Droid>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DroidTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DroidTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DroidTable>? orderByList,
    _i1.Transaction? transaction,
    DroidInclude? include,
  }) async {
    return session.db.find<Droid>(
      where: where?.call(Droid.t),
      orderBy: orderBy?.call(Droid.t),
      orderByList: orderByList?.call(Droid.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Droid?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DroidTable>? where,
    int? offset,
    _i1.OrderByBuilder<DroidTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DroidTable>? orderByList,
    _i1.Transaction? transaction,
    DroidInclude? include,
  }) async {
    return session.db.findFirstRow<Droid>(
      where: where?.call(Droid.t),
      orderBy: orderBy?.call(Droid.t),
      orderByList: orderByList?.call(Droid.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Droid?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DroidInclude? include,
  }) async {
    return session.db.findById<Droid>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Droid>> insert(
    _i1.Session session,
    List<Droid> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Droid>(
      rows,
      transaction: transaction,
    );
  }

  Future<Droid> insertRow(
    _i1.Session session,
    Droid row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Droid>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Droid>> update(
    _i1.Session session,
    List<Droid> rows, {
    _i1.ColumnSelections<DroidTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Droid>(
      rows,
      columns: columns?.call(Droid.t),
      transaction: transaction,
    );
  }

  Future<Droid> updateRow(
    _i1.Session session,
    Droid row, {
    _i1.ColumnSelections<DroidTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Droid>(
      row,
      columns: columns?.call(Droid.t),
      transaction: transaction,
    );
  }

  Future<List<Droid>> delete(
    _i1.Session session,
    List<Droid> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Droid>(
      rows,
      transaction: transaction,
    );
  }

  Future<Droid> deleteRow(
    _i1.Session session,
    Droid row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Droid>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Droid>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DroidTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Droid>(
      where: where(Droid.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DroidTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Droid>(
      where: where?.call(Droid.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DroidAttachRowRepository {
  const DroidAttachRowRepository._();

  Future<void> forceUserMaster(
    _i1.Session session,
    Droid droid,
    _i2.ForceUserRaw forceUserMaster,
  ) async {
    if (droid.id == null) {
      throw ArgumentError.notNull('droid.id');
    }
    if (forceUserMaster.id == null) {
      throw ArgumentError.notNull('forceUserMaster.id');
    }

    var $droid = droid.copyWith(forceUserMasterId: forceUserMaster.id);
    await session.db.updateRow<Droid>(
      $droid,
      columns: [Droid.t.forceUserMasterId],
    );
  }
}
