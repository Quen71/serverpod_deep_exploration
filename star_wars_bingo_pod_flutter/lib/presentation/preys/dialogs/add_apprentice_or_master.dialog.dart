import 'package:flutter/material.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/main.dart';

class AddApprenticeOrMasterDialog extends StatefulWidget {
  const AddApprenticeOrMasterDialog({
    super.key,
    required this.forceUserType,
  });

  final ForceUserType forceUserType;

  @override
  State<AddApprenticeOrMasterDialog> createState() =>
      _AddApprenticeOrMasterDialogState();
}

class _AddApprenticeOrMasterDialogState
    extends State<AddApprenticeOrMasterDialog> {
  final List<ForceUser> _forceUsers = List.empty(growable: true);
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.forceUserType == ForceUserType.jediMaster ||
          widget.forceUserType == ForceUserType.sithMaster) {
        _forceUsers.addAll(
          await client.forceUser.withoutMasterApprentices(
            forceType: widget.forceUserType == ForceUserType.jediMaster
                ? ForceUserType.jediApprentice
                : ForceUserType.sithApprentice,
          ),
        );
      }
      if (widget.forceUserType == ForceUserType.jediApprentice ||
          widget.forceUserType == ForceUserType.sithApprentice) {
        _forceUsers.addAll(
          await client.forceUser.masters(
            forceType: widget.forceUserType == ForceUserType.jediApprentice
                ? ForceUserType.jediMaster
                : ForceUserType.sithMaster,
          ),
        );
      }
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isLoading) const CircularProgressIndicator(),
              if (!_isLoading)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _forceUsers.length,
                  itemBuilder: (context, index) {
                    final ForceUser forceUser = _forceUsers[index];

                    return ListTile(
                      title: Text(forceUser.name),
                      onTap: () async {
                        Navigator.pop(context, forceUser);
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
