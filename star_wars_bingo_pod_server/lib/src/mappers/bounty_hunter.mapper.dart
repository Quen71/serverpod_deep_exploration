import 'package:star_wars_bingo_pod_server/src/generated/protocol.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/force_user.mapper.dart';
import 'package:star_wars_bingo_pod_server/src/mappers/mapper.dart';

class BountyHunterMapper extends Mapper<BountyHunterRaw, BountyHunter> {
  @override
  BountyHunter toModel({required BountyHunterRaw rawModel}) => BountyHunter(
        id: rawModel.id,
        userInfo: rawModel.userInfo!,
        forceUsers: _getForceUsers(rawModel.hunterHuntedList),
      );

  List<ForceUser> _getForceUsers(List<HunterHunted>? hunterHuntedList) {
    if (hunterHuntedList == null) return <ForceUser>[];

    List<ForceUser> forceUsersList = List<ForceUser>.empty(growable: true);
    for (HunterHunted hunterHunted in hunterHuntedList) {
      if (hunterHunted.forceUser != null) {
        forceUsersList.add(
          ForceUserMapper().toModel(rawModel: hunterHunted.forceUser!),
        );
      }
    }

    return forceUsersList;
  }
}
