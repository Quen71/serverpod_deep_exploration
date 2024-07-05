import 'package:serverpod/serverpod.dart';
import 'package:star_wars_bingo_pod_server/src/endpoints/bounty_hunter.endpoint.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/force_user.mapper.dart';
import 'package:star_wars_bingo_pod_server/src/utils/force_user_raw.utils.dart';

class ForceUserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final BountyHunterEndpoint bountyHunterEndpoint = BountyHunterEndpoint();

  Future<ForceUser> get(
    Session session, {
    required int id,
  }) async {
    final ForceUserRaw res = await ForceUserRawUtils.get(
      session: session,
      forceUserId: id,
    );

    final ForceUser model = ForceUserMapper().toModel(rawModel: res);

    return model;
  }

  Future<ForceUser> create(
    Session session,
    ForceUser forceUser,
  ) async {
    late ForceUserRaw forceUserRawRes;
    late LaserSaber laserSaberRes;
    late List<Droid> droidsRes;

    await session.db.transaction((transaction) async {
      print('Create laser saber: ${forceUser.laserSaber}');

      laserSaberRes = await LaserSaber.db.insertRow(
        session,
        forceUser.laserSaber,
        transaction: transaction,
      );
      droidsRes = await Droid.db.insert(
        session,
        forceUser.droids,
        transaction: transaction,
      );
      forceUserRawRes = await ForceUserRaw.db.insertRow(
        session,
        ForceUserRaw(
          type: forceUser.type,
          name: forceUser.name,
        ),
        transaction: transaction,
      );
    });

    await ForceUserRaw.db.attachRow.laserSaber(
      session,
      forceUserRawRes,
      laserSaberRes,
    );
    await ForceUserRaw.db.attach.droids(
      session,
      forceUserRawRes,
      droidsRes,
    );

    final ForceUserRaw res = await ForceUserRawUtils.get(
      session: session,
      forceUserId: forceUserRawRes.id!,
    );

    return ForceUserMapper().toModel(rawModel: res);
  }

  Future<ForceUser> update(
    Session session, {
    required ForceUser forceUser,
  }) async {
    late ForceUserRaw forceUserRawRes;
    late LaserSaber laserSaberRes;
    List<Droid> droidsRes = List<Droid>.empty(growable: true);

    print('\nForce User Update: $forceUser \n');

    await session.db.transaction((transaction) async {
      laserSaberRes = await LaserSaber.db.updateRow(
        session,
        forceUser.laserSaber,
        transaction: transaction,
      );

      for (Droid droid in forceUser.droids) {
        print('Droid in map for create or update: $droid');
        if (droid.id == null) {
          print('\nCreate droid force FU update: $droid \n');
          final Droid res = await Droid.db.insertRow(
            session,
            droid,
            transaction: transaction,
          );
          droidsRes.add(res);
        } else {
          print('\nUpdate droid force FU update: $droid \n');
          final Droid res = await Droid.db.updateRow(
            session,
            droid,
            transaction: transaction,
          );
          droidsRes.add(res);
        }
      }

      forceUserRawRes = await ForceUserRaw.db.updateRow(
        session,
        ForceUserRaw(
          id: forceUser.id,
          type: forceUser.type,
          name: forceUser.name,
        ),
      );
    });

    await ForceUserRaw.db.attachRow.laserSaber(
      session,
      forceUserRawRes,
      laserSaberRes,
    );

    await ForceUserRaw.db.attach.droids(
      session,
      forceUserRawRes,
      droidsRes,
    );

    if ((forceUser.type == ForceUserType.jediMaster ||
            forceUser.type == ForceUserType.sithMaster) &&
        forceUser.apprentices.isNotEmpty) {
      forceUser.apprentices.map(
        (apprentice) async => await addApprenticeToMaster(
          session,
          masterId: forceUser.id!,
          apprenticeId: apprentice.id!,
        ),
      );
    }

    if ((forceUser.type == ForceUserType.jediApprentice ||
            forceUser.type == ForceUserType.sithApprentice) &&
        forceUser.master != null) {
      await addMasterToApprentice(
        session,
        apprenticeId: forceUser.id!,
        masterId: forceUser.master!.id!,
      );
    }

    final ForceUserRaw res = await ForceUserRawUtils.get(
      session: session,
      forceUserId: forceUserRawRes.id!,
    );

    return ForceUserMapper().toModel(rawModel: res);
  }

  Future<int> delete(
    Session session, {
    required int forceUserId,
  }) async =>
      await session.db.transaction<int>((transaction) async {
        final ForceUserRaw forceUserRawRes = await ForceUserRawUtils.get(
          session: session,
          forceUserId: forceUserId,
          transaction: transaction,
        );

        final List<HunterHunted> hunterHuntedListRes =
            await HunterHunted.db.find(
          session,
          where: (hH) => hH.forceUserId.equals(forceUserId),
          transaction: transaction,
        );

        await HunterHunted.db.delete(
          session,
          hunterHuntedListRes,
          transaction: transaction,
        );

        final ForceUserRaw deletedForceUserRes =
            await ForceUserRaw.db.deleteRow(
          session,
          forceUserRawRes,
          transaction: transaction,
        );

        if (deletedForceUserRes.id == null) throw Error();

        if (forceUserRawRes.laserSaber != null) {
          await LaserSaber.db.deleteRow(
            session,
            forceUserRawRes.laserSaber!,
            transaction: transaction,
          );
        }

        if (forceUserRawRes.droids != null) {
          await Droid.db.delete(
            session,
            forceUserRawRes.droids!,
            transaction: transaction,
          );
        }

        return Future<int>.value(deletedForceUserRes.id);
      });

  Future<List<ForceUser>> withoutMasterApprentices(
    Session session, {
    required ForceUserType forceType,
  }) async {
    if (forceType == ForceUserType.jediMaster ||
        forceType == ForceUserType.sithMaster) {
      throw Error();
    }

    final List<ForceUserRaw> res = await ForceUserRawUtils.getWhere(
      session: session,
      where: (fU) => fU.type.equals(forceType) & fU.masterId.equals(null),
    );

    return res
        .map(
          (apprentice) => ForceUserMapper().toModel(rawModel: apprentice),
        )
        .toList();
  }

  Future<List<ForceUser>> masters(
    Session session, {
    required ForceUserType forceType,
  }) async {
    if (forceType == ForceUserType.jediApprentice ||
        forceType == ForceUserType.sithApprentice) {
      throw Error();
    }

    final List<ForceUserRaw> res = await ForceUserRawUtils.getWhere(
      session: session,
      where: (fU) => fU.type.equals(forceType),
    );

    return res
        .map(
          (master) => ForceUserMapper().toModel(rawModel: master),
        )
        .toList();
  }

  Future<ForceUser> addApprenticeToMaster(
    Session session, {
    required int masterId,
    required int apprenticeId,
  }) async {
    final ForceUserRaw masterRes = await ForceUserRawUtils.get(
      session: session,
      forceUserId: masterId,
    );
    final ForceUserRaw apprenticeRes = await ForceUserRawUtils.get(
      session: session,
      forceUserId: apprenticeId,
    );

    if (masterRes.type != ForceUserType.jediMaster &&
        masterRes.type != ForceUserType.sithMaster) {
      throw Error();
    }
    if (apprenticeRes.type != ForceUserType.jediApprentice &&
        apprenticeRes.type != ForceUserType.sithApprentice) {
      throw Error();
    }
    if ((masterRes.type == ForceUserType.sithMaster &&
            apprenticeRes.type == ForceUserType.jediApprentice) ||
        (masterRes.type == ForceUserType.jediMaster &&
            apprenticeRes.type == ForceUserType.sithApprentice)) {
      throw Error();
    }

    await ForceUserRaw.db.attachRow.apprentices(
      session,
      masterRes,
      apprenticeRes,
    );

    return ForceUserMapper().toModel(
      rawModel: await ForceUserRawUtils.get(
        session: session,
        forceUserId: masterId,
      ),
    );
  }

  Future<ForceUser> addMasterToApprentice(
    Session session, {
    required int apprenticeId,
    required int masterId,
  }) async {
    final ForceUserRaw apprenticeRes = await ForceUserRawUtils.get(
      session: session,
      forceUserId: apprenticeId,
    );
    final ForceUserRaw masterRes = await ForceUserRawUtils.get(
      session: session,
      forceUserId: masterId,
    );

    if (masterRes.type != ForceUserType.jediMaster &&
        masterRes.type != ForceUserType.sithMaster) {
      throw Error();
    }
    if (apprenticeRes.type != ForceUserType.jediApprentice &&
        apprenticeRes.type != ForceUserType.sithApprentice) {
      throw Error();
    }
    if ((masterRes.type == ForceUserType.sithMaster &&
            apprenticeRes.type == ForceUserType.jediApprentice) ||
        (masterRes.type == ForceUserType.jediMaster &&
            apprenticeRes.type == ForceUserType.sithApprentice)) {
      throw Error();
    }

    await ForceUserRaw.db.attachRow.master(
      session,
      apprenticeRes,
      masterRes,
    );

    return ForceUserMapper().toModel(
      rawModel: await ForceUserRawUtils.get(
        session: session,
        forceUserId: apprenticeId,
      ),
    );
  }

  Future<List<ForceUser>> allNotHunted(
    Session session,
  ) async {
    final BountyHunter meRes = await bountyHunterEndpoint.me(session);
    final Set<int> meHuntedForceUsersId = meRes.forceUsers
        .map(
          (fU) => fU.id!,
        )
        .toSet();

    final List<ForceUserRaw> notHuntedForceUsersRes =
        await ForceUserRaw.db.find(
      session,
      include: ForceUserRaw.include(
        laserSaber: LaserSaber.include(),
        droids: Droid.includeList(
          include: Droid.include(),
        ),
      ),
      where: (fU) => fU.id.notInSet(meHuntedForceUsersId),
    );

    print('notHuntedForceUsersRes: $notHuntedForceUsersRes');

    return notHuntedForceUsersRes
        .map((fURaw) => ForceUserMapper().toModel(rawModel: fURaw))
        .toList();
  }
}
