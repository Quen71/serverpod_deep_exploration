import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/bounty_hunter.mapper.dart';

class BountyHunterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<BountyHunter> me(Session session) async {
    final int? userId = (await session.authenticated)?.userId;

    if (userId == null) throw Error();

    final BountyHunterRaw? res = await BountyHunterRaw.db.findFirstRow(
      session,
      include: BountyHunterRaw.include(
        userInfo: UserInfo.include(),
        hunterHuntedList: HunterHunted.includeList(
          include: HunterHunted.include(
            bountyHunter: BountyHunterRaw.include(),
            forceUser: ForceUserRaw.include(
              laserSaber: LaserSaber.include(),
              droids: Droid.includeList(
                include: Droid.include(),
              ),
            ),
          ),
        ),
      ),
      where: (bH) => bH.userInfoId.equals(userId),
    );

    print('Me raw find is: $res');

    if (res == null) throw Error();

    final BountyHunter me = BountyHunterMapper().toModel(rawModel: res);

    return me;
  }

  Future<BountyHunterRaw> meRaw(Session session) async {
    final int? userId = (await session.authenticated)?.userId;

    if (userId == null) throw Error();

    final BountyHunterRaw? res = await BountyHunterRaw.db.findFirstRow(
      session,
      include: BountyHunterRaw.include(
        userInfo: UserInfo.include(),
        hunterHuntedList: HunterHunted.includeList(
          include: HunterHunted.include(
            bountyHunter: BountyHunterRaw.include(),
            forceUser: ForceUserRaw.include(
              laserSaber: LaserSaber.include(),
              droids: Droid.includeList(
                include: Droid.include(),
              ),
            ),
          ),
        ),
      ),
      where: (bH) => bH.userInfoId.equals(userId),
    );

    if (res == null) throw Error();

    return res;
  }

  Future<BountyHunter> addForceUserToBingoBook(
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
}
