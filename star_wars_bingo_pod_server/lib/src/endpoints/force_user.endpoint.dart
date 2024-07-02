import 'package:serverpod/server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/force_user.mapper.dart';

class ForceUserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<ForceUser> create(
    Session session,
    ForceUser forceUser,
  ) async {
    late ForceUserRaw forceUserRawRes;
    late LaserSaber laserSaberRes;
    late List<Droid> droidsRes;

    await session.db.transaction((transaction) async {
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

    final ForceUserRaw? res = await ForceUserRaw.db.findById(
      session,
      forceUserRawRes.id!,
      include: ForceUserRaw.include(
        laserSaber: LaserSaber.include(),
        droids: Droid.includeList(
          include: Droid.include(),
        ),
      ),
    );

    print('ForceUser created: $res');

    if (res == null) throw Error();

    return ForceUserMapper().toModel(rawModel: res);
  }
}

Future<ForceUser> update(
  Session session, {
  required ForceUser forceUser,
}) async {
  late ForceUserRaw forceUserRawRes;
  late LaserSaber laserSaberRes;
  late List<Droid> droidsRes;

  await session.db.transaction((transaction) async {
    laserSaberRes = await LaserSaber.db.updateRow(
      session,
      forceUser.laserSaber,
      transaction: transaction,
    );
    droidsRes = await Droid.db.update(
      session,
      forceUser.droids,
      transaction: transaction,
    );
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

  final ForceUserRaw? res = await ForceUserRaw.db.findById(
    session,
    forceUserRawRes.id!,
    include: ForceUserRaw.include(
      laserSaber: LaserSaber.include(),
      droids: Droid.includeList(
        include: Droid.include(),
      ),
    ),
  );

  print('ForceUser created: $res');

  if (res == null) throw Error();

  return ForceUserMapper().toModel(rawModel: res);
}
