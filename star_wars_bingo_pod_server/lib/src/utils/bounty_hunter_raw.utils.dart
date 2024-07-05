import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/utils/force_user_raw.utils.dart';

class BountyHunterRawUtils {
  const BountyHunterRawUtils._();

  static BountyHunterRawInclude allInclude = BountyHunterRaw.include(
    userInfo: UserInfo.include(),
    hunterHuntedList: HunterHunted.includeList(
      include: HunterHunted.include(
        bountyHunter: BountyHunterRaw.include(),
        forceUser: ForceUserRawUtils.allInclude,
      ),
    ),
  );

  static BountyHunterRawIncludeList allIncludeList =
      BountyHunterRaw.includeList(
    include: allInclude,
  );

  static Future<BountyHunterRaw> getFirstWhere({
    required Session session,
    Expression<dynamic> Function(BountyHunterRawTable)? where,
    Transaction? transaction,
  }) async {
    final BountyHunterRaw? res = await BountyHunterRaw.db.findFirstRow(
      session,
      where: where,
      transaction: transaction,
      include: allInclude,
    );

    if (res == null) throw Exception();

    return res;
  }
}
