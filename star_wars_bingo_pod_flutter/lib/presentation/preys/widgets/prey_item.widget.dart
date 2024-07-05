import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/presentation/preys/bottom_sheets/update_apprentice.bottom_sheet.dart';
import 'package:star_wars_bingo_pod_flutter/presentation/preys/bottom_sheets/update_master.bottom_sheet.dart';
import 'package:star_wars_bingo_pod_flutter/main.dart';

class PreyItemWidget extends StatelessWidget {
  const PreyItemWidget({
    required this.forceUser,
    super.key,
  });

  final ForceUser forceUser;

  @override
  Widget build(BuildContext context) {
    log(name: 'FORCE_USER', '$forceUser');
    return ListTile(
      title: Text(forceUser.name),
      subtitle: Text(forceUser.type.toString()),
      trailing: IconButton(
        onPressed: () async {
          await client.bountyHunter.withdrawForceUserFromPreysList(
            forceUserId: forceUser.id!,
          );
          sessionManager.refreshSession();
        },
        icon: const Icon(Icons.delete),
      ),
      onTap: () async {
        if (forceUser.type == ForceUserType.jediMaster ||
            forceUser.type == ForceUserType.sithMaster) {
          await showModalBottomSheet(
            context: context,
            builder: (context) =>
                UpdateMasterBottomSheet(forceUserMaster: forceUser),
          );
        }
        if (forceUser.type == ForceUserType.jediApprentice ||
            forceUser.type == ForceUserType.sithApprentice) {
          await showModalBottomSheet(
            context: context,
            builder: (context) =>
                UpdateApprenticeBottomSheet(forceUserApprentice: forceUser),
          );
        }

        await sessionManager.refreshSession();
      },
    );
  }
}
