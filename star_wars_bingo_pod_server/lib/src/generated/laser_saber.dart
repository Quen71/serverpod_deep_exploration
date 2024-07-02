/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class LaserSaber extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  LaserSaber._({
    int? id,
    required this.name,
    required this.color,
  }) : super(id);

  factory LaserSaber({
    int? id,
    required String name,
    required String color,
  }) = _LaserSaberImpl;

  factory LaserSaber.fromJson(Map<String, dynamic> jsonSerialization) {
    return LaserSaber(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      color: jsonSerialization['color'] as String,
    );
  }

  static final t = LaserSaberTable();

  static const db = LaserSaberRepository._();

  String name;

  String color;

  @override
  _i1.Table get table => t;

  LaserSaber copyWith({
    int? id,
    String? name,
    String? color,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'color': color,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'color': color,
    };
  }

  static LaserSaberInclude include() {
    return LaserSaberInclude._();
  }

  static LaserSaberIncludeList includeList({
    _i1.WhereExpressionBuilder<LaserSaberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LaserSaberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LaserSaberTable>? orderByList,
    LaserSaberInclude? include,
  }) {
    return LaserSaberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LaserSaber.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LaserSaber.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LaserSaberImpl extends LaserSaber {
  _LaserSaberImpl({
    int? id,
    required String name,
    required String color,
  }) : super._(
          id: id,
          name: name,
          color: color,
        );

  @override
  LaserSaber copyWith({
    Object? id = _Undefined,
    String? name,
    String? color,
  }) {
    return LaserSaber(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}

class LaserSaberTable extends _i1.Table {
  LaserSaberTable({super.tableRelation}) : super(tableName: 'laser_saber') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString color;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        color,
      ];
}

class LaserSaberInclude extends _i1.IncludeObject {
  LaserSaberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => LaserSaber.t;
}

class LaserSaberIncludeList extends _i1.IncludeList {
  LaserSaberIncludeList._({
    _i1.WhereExpressionBuilder<LaserSaberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LaserSaber.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => LaserSaber.t;
}

class LaserSaberRepository {
  const LaserSaberRepository._();

  Future<List<LaserSaber>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LaserSaberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LaserSaberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LaserSaberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LaserSaber>(
      where: where?.call(LaserSaber.t),
      orderBy: orderBy?.call(LaserSaber.t),
      orderByList: orderByList?.call(LaserSaber.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<LaserSaber?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LaserSaberTable>? where,
    int? offset,
    _i1.OrderByBuilder<LaserSaberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LaserSaberTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LaserSaber>(
      where: where?.call(LaserSaber.t),
      orderBy: orderBy?.call(LaserSaber.t),
      orderByList: orderByList?.call(LaserSaber.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<LaserSaber?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LaserSaber>(
      id,
      transaction: transaction,
    );
  }

  Future<List<LaserSaber>> insert(
    _i1.Session session,
    List<LaserSaber> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LaserSaber>(
      rows,
      transaction: transaction,
    );
  }

  Future<LaserSaber> insertRow(
    _i1.Session session,
    LaserSaber row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LaserSaber>(
      row,
      transaction: transaction,
    );
  }

  Future<List<LaserSaber>> update(
    _i1.Session session,
    List<LaserSaber> rows, {
    _i1.ColumnSelections<LaserSaberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LaserSaber>(
      rows,
      columns: columns?.call(LaserSaber.t),
      transaction: transaction,
    );
  }

  Future<LaserSaber> updateRow(
    _i1.Session session,
    LaserSaber row, {
    _i1.ColumnSelections<LaserSaberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LaserSaber>(
      row,
      columns: columns?.call(LaserSaber.t),
      transaction: transaction,
    );
  }

  Future<List<LaserSaber>> delete(
    _i1.Session session,
    List<LaserSaber> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LaserSaber>(
      rows,
      transaction: transaction,
    );
  }

  Future<LaserSaber> deleteRow(
    _i1.Session session,
    LaserSaber row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LaserSaber>(
      row,
      transaction: transaction,
    );
  }

  Future<List<LaserSaber>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LaserSaberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LaserSaber>(
      where: where(LaserSaber.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LaserSaberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LaserSaber>(
      where: where?.call(LaserSaber.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
