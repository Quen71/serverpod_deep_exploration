import 'package:flutter/material.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/main.dart';

class AddForceUserBottomSheet extends StatefulWidget {
  const AddForceUserBottomSheet({super.key});

  @override
  State<AddForceUserBottomSheet> createState() =>
      _AddForceUserBottomSheetState();
}

class _AddForceUserBottomSheetState extends State<AddForceUserBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  ForceUserType _selectedForceUserType = ForceUserType.jediMaster;

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

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Force user information',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              SegmentedButton<ForceUserType>(
                segments: const <ButtonSegment<ForceUserType>>[
                  ButtonSegment<ForceUserType>(
                      value: ForceUserType.jediMaster,
                      label: Text('Jedi Master')),
                  ButtonSegment<ForceUserType>(
                      value: ForceUserType.jediApprentice,
                      label: Text('Jedi Apprentice')),
                  ButtonSegment<ForceUserType>(
                      value: ForceUserType.sithMaster,
                      label: Text('Sith Master')),
                  ButtonSegment<ForceUserType>(
                      value: ForceUserType.sithApprentice,
                      label: Text('Sith Apprentice')),
                ],
                selected: <ForceUserType>{_selectedForceUserType},
                onSelectionChanged: (Set<ForceUserType> newSelection) {
                  setState(() {
                    _selectedForceUserType = newSelection.first;
                  });
                },
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
                decoration: const InputDecoration(hintText: 'First droid name'),
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
                decoration: const InputDecoration(hintText: 'Third droid name'),
              ),
              const SizedBox(height: 16),
              if (!_isLoading)
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });

                    final ForceUser forceUser = ForceUser(
                      type: _selectedForceUserType,
                      name: _nameController.text,
                      laserSaber: LaserSaber(
                        name: _laserSaberNameController.text,
                        color: _laserSaberColorController.text,
                      ),
                      apprentices: [],
                      droids: [
                        if (_firstDroidNameController.text.isNotEmpty)
                          Droid(
                            name: _firstDroidNameController.text,
                            forceUserMasterId: 1,
                          ),
                        if (_secondDroidNameController.text.isNotEmpty)
                          Droid(
                            name: _secondDroidNameController.text,
                            forceUserMasterId: 1,
                          ),
                        if (_thirdDroidNameController.text.isNotEmpty)
                          Droid(
                            name: _thirdDroidNameController.text,
                            forceUserMasterId: 1,
                          ),
                      ],
                    );

                    final ForceUser res =
                        await client.forceUser.create(forceUser);
                    await client.bountyHunter.addForceUserToPreysList(res.id!);

                    setState(() {
                      _isLoading = false;
                    });

                    Navigator.pop(context);
                  },
                  child: const Text('Add force user'),
                ),
              if (_isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
