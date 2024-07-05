import 'package:flutter/material.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/presentation/preys/dialogs/add_apprentice_or_master.dialog.dart';
import 'package:star_wars_bingo_pod_flutter/main.dart';

class UpdateMasterBottomSheet extends StatefulWidget {
  const UpdateMasterBottomSheet({
    required this.forceUserMaster,
    super.key,
  });

  final ForceUser forceUserMaster;

  @override
  State<UpdateMasterBottomSheet> createState() =>
      _UpdateMasterBottomSheetState();
}

class _UpdateMasterBottomSheetState extends State<UpdateMasterBottomSheet> {
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

  final List<ForceUser> _apprentices = List<ForceUser>.empty(growable: true);

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _apprentices.addAll(widget.forceUserMaster.apprentices);
    });

    _nameController.text = widget.forceUserMaster.name;
    _laserSaberNameController.text = widget.forceUserMaster.laserSaber.name;
    _laserSaberColorController.text = widget.forceUserMaster.laserSaber.color;
    if (widget.forceUserMaster.droids.isNotEmpty) {
      _firstDroidNameController.text = widget.forceUserMaster.droids[0].name;
    }
    if (widget.forceUserMaster.droids.length >= 2) {
      _secondDroidNameController.text = widget.forceUserMaster.droids[1].name;
    }
    if (widget.forceUserMaster.droids.length >= 3) {
      _thirdDroidNameController.text = widget.forceUserMaster.droids[2].name;
    }
  }

  List<Droid> getUpdatedDroids() {
    Droid? droidFirst;
    Droid? droidSecond;
    Droid? droidThird;

    widget.forceUserMaster.droids.asMap().map((index, droid) {
      if (index == 0) {
        droidFirst = droid.copyWith(name: _firstDroidNameController.text);
      }
      if (index == 1) {
        droidSecond = droid.copyWith(name: _firstDroidNameController.text);
      }
      if (index == 3) {
        droidThird = droid.copyWith(name: _firstDroidNameController.text);
      }
      return MapEntry(index, droid);
    });

    if (droidFirst == null && _firstDroidNameController.text.isNotEmpty) {
      droidFirst = Droid(
        name: _firstDroidNameController.text,
        forceUserMasterId: widget.forceUserMaster.id!,
      );
    }
    if (droidSecond == null && _secondDroidNameController.text.isNotEmpty) {
      droidSecond = Droid(
        name: _secondDroidNameController.text,
        forceUserMasterId: widget.forceUserMaster.id!,
      );
    }
    if (droidThird == null && _thirdDroidNameController.text.isNotEmpty) {
      droidThird = Droid(
        name: _thirdDroidNameController.text,
        forceUserMasterId: widget.forceUserMaster.id!,
      );
    }

    return [
      if (droidFirst != null) droidFirst!,
      if (droidSecond != null) droidSecond!,
      if (droidThird != null) droidThird!,
    ];
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
                  '${widget.forceUserMaster.type} information',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                if (_apprentices.isNotEmpty) const Text('Apprentices: '),
                if (_apprentices.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _apprentices.length,
                    itemBuilder: (context, index) => Text(
                      _apprentices[index].name,
                    ),
                  ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final ForceUser? apprentice = await showDialog(
                      context: context,
                      builder: (context) => AddApprenticeOrMasterDialog(
                        forceUserType: widget.forceUserMaster.type,
                      ),
                    );

                    setState(() {
                      _isLoading = true;
                    });

                    if (apprentice != null) {
                      _apprentices.add(apprentice);
                      await client.forceUser.addApprenticeToMaster(
                        masterId: widget.forceUserMaster.id!,
                        apprenticeId: apprentice.id!,
                      );
                    }

                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: const Text('Add an apprentice'),
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

                      final ForceUser updatedMaster =
                          widget.forceUserMaster.copyWith(
                        name: _nameController.text,
                        apprentices: _apprentices,
                        laserSaber: widget.forceUserMaster.laserSaber.copyWith(
                          name: _laserSaberNameController.text,
                          color: _laserSaberColorController.text,
                        ),
                        droids: getUpdatedDroids(),
                      );

                      await client.forceUser.update(forceUser: updatedMaster);

                      setState(() {
                        _isLoading = false;
                      });

                      Navigator.pop(context);
                    },
                    child: const Text('Update master'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
