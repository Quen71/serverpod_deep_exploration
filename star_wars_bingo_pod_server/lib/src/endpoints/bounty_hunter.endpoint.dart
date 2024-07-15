import 'package:serverpod/serverpod.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/bounty_hunter.mapper.dart';
import 'package:star_wars_bingo_pod_server/src/utils/bounty_hunter_raw.utils.dart';

class BountyHunterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<BountyHunter> me(Session session) async {
    final BountyHunterRaw res = await _meRaw(session);

    return BountyHunterMapper().toModel(rawModel: res);
  }

  Future<BountyHunter> addForceUserToPreysList(
    Session session,
    int forceUserId,
  ) async {
    final BountyHunterRaw loggedBountyHunter = await _meRaw(session);

    await session.db.transaction(
      (transaction) async {
        ForceUserRaw? forceUserRaw = await ForceUserRaw.db.findFirstRow(
          session,
          where: (fU) => fU.id.equals(forceUserId),
          transaction: transaction,
        );

        if (forceUserRaw == null) throw Error();

        await HunterHunted.db.insertRow(
          session,
          HunterHunted(
              bountyHunterId: loggedBountyHunter.id!, forceUserId: forceUserId),
        );
      },
    );

    return await me(session);
  }

  Future<BountyHunter> withdrawForceUserFromPreysList(
    Session session, {
    required int forceUserId,
  }) async {
    final ForceUserRaw? forceUserRaw =
        await ForceUserRaw.db.findById(session, forceUserId);

    if (forceUserRaw == null) throw Exception();

    final BountyHunterRaw meRawRes = await _meRaw(session);

    final HunterHunted? hunterHuntedRes = await HunterHunted.db.findFirstRow(
      session,
      where: (hH) =>
          hH.forceUserId.equals(forceUserRaw.id) &
          hH.bountyHunterId.equals(meRawRes.id),
    );

    if (hunterHuntedRes == null) throw Exception();

    HunterHunted.db.deleteRow(session, hunterHuntedRes);

    return await me(session);
  }

  Future<BountyHunterRaw> _meRaw(Session session) async {
    final int? userId = (await session.authenticated)?.userId;

    if (userId == null) throw Error();

    final BountyHunterRaw res = await BountyHunterRawUtils.getFirstWhere(
      session: session,
      where: (bH) => bH.userInfoId.equals(userId),
    );

    return res;
  }
}
