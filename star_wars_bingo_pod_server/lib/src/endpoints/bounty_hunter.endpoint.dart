import 'package:serverpod/serverpod.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/bounty_hunter.mapper.dart';
import 'package:star_wars_bingo_pod_server/src/utils/bounty_hunter_raw.utils.dart';

class BountyHunterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<BountyHunterRaw> meRaw(Session session) async {
    final int? userId = (await session.authenticated)?.userId;

    if (userId == null) throw Error();

    final BountyHunterRaw res = await BountyHunterRawUtils.getFirstWhere(
      session: session,
      where: (bH) => bH.userInfoId.equals(userId),
    );

    return res;
  }

  Future<BountyHunter> me(Session session) async {
    final BountyHunterRaw res = await meRaw(session);

    return BountyHunterMapper().toModel(rawModel: res);
  }

  Future<BountyHunter> addForceUserToPreysList(
    Session session,
    int forceUserId,
  ) async {
    final BountyHunterRaw loggedBountyHunter = await meRaw(session);
    late ForceUserRaw? forceUserRaw;
    late HunterHunted hunterHunted;

    await session.db.transaction(
      (transaction) async {
        forceUserRaw = await ForceUserRaw.db.findFirstRow(
          session,
          where: (fU) => fU.id.equals(forceUserId),
          transaction: transaction,
        );

        if (forceUserRaw == null) throw Error();

        hunterHunted = await HunterHunted.db.insertRow(
          session,
          HunterHunted(
              bountyHunterId: loggedBountyHunter.id!, forceUserId: forceUserId),
        );
      },
    );

    await BountyHunterRaw.db.attachRow.hunterHuntedList(
      session,
      loggedBountyHunter,
      hunterHunted,
    );
    await ForceUserRaw.db.attachRow.hunterHuntedList(
      session,
      forceUserRaw!,
      hunterHunted,
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

    final BountyHunterRaw meRawRes = await meRaw(session);

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
}
