import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/widgets/shared/app_main_tabled_body.dart';
import 'package:my_market/core/widgets/shared/app_tabled_card.dart';

class OldUsersTabBody extends HookConsumerWidget {
  const OldUsersTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersList = ['ahmed old', 'wleed old', 'messi old'];
    final selectedItems = useState<List<String>>([]);
    final showActions = useState(false);
    final searchCtrl = useTextEditingController();

    return Scaffold(
      body: AppMainTabledBody(
        title: 'Anciens employés',
        primaryCards: const [],
        table: (context) => AppTabledCard(
          showActions: showActions,
          selectedItems: selectedItems,
          cellValues: (index) => [
            usersList[index],
            usersList[index],
            usersList[index],
            usersList[index],
            usersList[index],
            usersList[index],
          ],
          items: usersList,
          headers: _headers,
          rowSelectionId: (index) => usersList[index],
          itemIdField: (index) => usersList[0],
          actions: const SizedBox.shrink(),
        ),
      ),
    );
  }
}

const List<String> _headers = [
  '',
  'Nom & Prenom',
  'N CIN',
  'Genre',
  'Role',
  'Numero de Telephone',
  'Date d\'inscription',
];
