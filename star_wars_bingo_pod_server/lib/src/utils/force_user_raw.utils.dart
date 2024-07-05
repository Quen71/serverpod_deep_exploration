import 'package:serverpod/serverpod.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';

class ForceUserRawUtils {
  const ForceUserRawUtils._();

  static ForceUserRawInclude allInclude = ForceUserRaw.include(
    laserSaber: LaserSaber.include(),
    droids: Droid.includeList(
      include: Droid.include(),
    ),
    apprentices: ForceUserRaw.includeList(
      include: ForceUserRaw.include(
        laserSaber: LaserSaber.include(),
        droids: Droid.includeList(
          include: Droid.include(),
        ),
      ),
    ),
    master: ForceUserRaw.include(
      laserSaber: LaserSaber.include(),
      droids: Droid.includeList(
        include: Droid.include(),
      ),
    ),
  );

  static ForceUserRawIncludeList allIncludeList = ForceUserRaw.includeList(
    include: allInclude,
  );

  static Future<ForceUserRaw> get({
    required Session session,
    required int forceUserId,
    Transaction? transaction,
  }) async {
    final ForceUserRaw? res = await ForceUserRaw.db.findById(
      session,
      forceUserId,
      include: allInclude,
      transaction: transaction,
    );

    if (res == null) throw Error();

    return res;
  }

  static Future<List<ForceUserRaw>> getWhere({
    required Session session,
    Expression<dynamic> Function(ForceUserRawTable)? where,
    Transaction? transaction,
  }) async {
    final List<ForceUserRaw> res = await ForceUserRaw.db.find(
      session,
      where: where,
      include: allInclude,
      transaction: transaction,
    );

    return res;
  }
}
