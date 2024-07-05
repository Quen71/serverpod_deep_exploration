import 'package:flutter/material.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/presentation/preys/dialogs/add_apprentice_or_master.dialog.dart';
import 'package:star_wars_bingo_pod_flutter/main.dart';

class UpdateApprenticeBottomSheet extends StatefulWidget {
  const UpdateApprenticeBottomSheet({
    required this.forceUserApprentice,
    super.key,
  });

  final ForceUser forceUserApprentice;

  @override
  State<UpdateApprenticeBottomSheet> createState() =>
      _UpdateApprenticeBottomSheetState();
}

class _UpdateApprenticeBottomSheetState
    extends State<UpdateApprenticeBottomSheet> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _laserSaberNameController =
      TextEditingController();
  final TextEditingController _laserSaberColorController =
      TextEditingController();

  final TextEditingController _firstDroidNameController =
      TextEditingController();
  final TextEditingController _secondDroidNameController =
      TextEditingController();
  final TextEditingController _thirdDroidNameController =
      TextEditingController();

  ForceUser? _master;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.forceUserApprentice.name;
    _laserSaberNameController.text = widget.forceUserApprentice.laserSaber.name;
    _laserSaberColorController.text =
        widget.forceUserApprentice.laserSaber.color;
    if (widget.forceUserApprentice.droids.isNotEmpty) {
      _firstDroidNameController.text =
          widget.forceUserApprentice.droids[0].name;
    }
    if (widget.forceUserApprentice.droids.length >= 2) {
      _secondDroidNameController.text =
          widget.forceUserApprentice.droids[1].name;
    }
    if (widget.forceUserApprentice.droids.length >= 3) {
      _thirdDroidNameController.text =
          widget.forceUserApprentice.droids[2].name;
    }
    setState(() {
      _master = widget.forceUserApprentice.master;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.forceUserApprentice.type} information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (_master != null) Text('Master: ${_master!.name}'),
                if (_master == null) const SizedBox(height: 8),
                if (_master == null)
                  ElevatedButton(
                    onPressed: () async {
                      final ForceUser? master = await showDialog(
                        context: context,
                        builder: (context) => AddApprenticeOrMasterDialog(
                          forceUserType: widget.forceUserApprentice.type,
                        ),
                      );

                      setState(() {
                        _isLoading = true;
                        _master = master;
                      });

                      if (_master != null) {
                        await client.forceUser.addMasterToApprentice(
                          apprenticeId: widget.forceUserApprentice.id!,
                          masterId: _master!.id!,
                        );
                      }

                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: const Text('Add a master'),
                  ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Laser saber',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextField(
                  controller: _laserSaberNameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: _laserSaberColorController,
                  decoration: const InputDecoration(hintText: 'Color'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Droids',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextField(
                  controller: _firstDroidNameController,
                  decoration:
                      const InputDecoration(hintText: 'First droid name'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _secondDroidNameController,
                  decoration:
                      const InputDecoration(hintText: 'Second droid name'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _thirdDroidNameController,
                  decoration:
                      const InputDecoration(hintText: 'Third droid name'),
                ),
                const SizedBox(height: 16),
                if (!_isLoading)
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });

                      final ForceUser updatedApprentice =
                          widget.forceUserApprentice.copyWith(
                        name: _nameController.text,
                        master: _master,
                        laserSaber:
                            widget.forceUserApprentice.laserSaber.copyWith(
                          name: _laserSaberNameController.text,
                          color: _laserSaberColorController.text,
                        ),
                      );

                      await client.forceUser
                          .update(forceUser: updatedApprentice);

                      setState(() {
                        _isLoading = false;
                      });

                      Navigator.pop(context);
                    },
                    child: const Text('Update apprentice'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
