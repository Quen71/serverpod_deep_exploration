import 'package:flutter/material.dart';
import 'package:star_wars_bingo_pod_client/star_wars_bingo_pod_client.dart';
import 'package:star_wars_bingo_pod_flutter/main.dart';

class PreysShopDialog extends StatefulWidget {
  const PreysShopDialog({super.key});

  @override
  State<PreysShopDialog> createState() => _PreysShopDialogState();
}

class _PreysShopDialogState extends State<PreysShopDialog> {
  bool _isLoading = true;
  final List<ForceUser> _forceUsers = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _forceUsers.addAll(await client.forceUser.allNotHunted());
      _isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isLoading) const CircularProgressIndicator(),
              if (!_isLoading)
                Text(
                  'Add preys to your Bingo Book',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _forceUsers.length,
                itemBuilder: (context, index) {
                  final ForceUser forceUser = _forceUsers[index];

                  return ListTile(
                    title: Text(forceUser.name),
                    subtitle: Text(forceUser.type.toString()),
                    trailing: IconButton(
                      onPressed: () async {
                        _isLoading = true;
                        setState(() {});

                        await client.bountyHunter
                            .addForceUserToPreysList(forceUser.id!);
                        _forceUsers.remove(forceUser);

                        _isLoading = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.add),
                    ),
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
