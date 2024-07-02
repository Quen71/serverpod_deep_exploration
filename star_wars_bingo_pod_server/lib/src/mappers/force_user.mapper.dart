import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/mapper.dart';

class ForceUserMapper extends Mapper<ForceUserRaw, ForceUser> {
  @override
  ForceUser toModel({required ForceUserRaw rawModel}) => ForceUser(
        id: rawModel.id,
        type: rawModel.type,
        name: rawModel.name,
        laserSaber: rawModel.laserSaber!,
        master: rawModel.master == null
            ? null
            : toModel(rawModel: rawModel.master!),
        apprentices: _getApprentices(rawModel.apprentices),
        droids: rawModel.droids ?? <Droid>[],
      );

  List<ForceUser> _getApprentices(
    List<ForceUserRaw>? rawApprentices,
  ) {
    if (rawApprentices == null) return <ForceUser>[];

    List<ForceUser> apprentices = List<ForceUser>.empty(growable: true);

    for (ForceUserRaw forceUserRaw in rawApprentices) {
      apprentices.add(toModel(rawModel: forceUserRaw));
    }

    return apprentices;
  }
}
