import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/widgets/shared/app_action_button.dart';
import 'package:my_market/core/widgets/shared/app_actions_row.dart';
import 'package:my_market/core/widgets/shared/app_main_tabled_body.dart';
import 'package:my_market/core/widgets/shared/app_tabled_card.dart';
import 'package:my_market/features/users/presentation/widgets/add_user_dialog.dart';
import 'package:my_market/features/users/presentation/widgets/edit_user_dialog.dart';

class UsersTabBody extends HookConsumerWidget {
  const UsersTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final usersList = ['ahmed', 'wleed', 'messi'];
    final selectedItems = useState<List<String>>([]);
    final showActions = useState(false);
    final searchCtrl = useTextEditingController();
    useEffect(() {
      showActions.value = selectedItems.value.length == 1;
      return null;
    }, [selectedItems.value]);

    return Scaffold(
      body: AppMainTabledBody(
        title: 'Gestion Des Employes',
        primaryCards: const [],
        table: AppTabledCard(
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
          actions: AppActionsRow(
            showActions: showActions,
            searchCtrl: searchCtrl,
            onShow: (val) {},
            onSearch: () {},
            actions: [
              AppActionButton(
                color: colors.success,
                onPressed: () => AppDialogs.customDialog(
                    context: context, dialog: const AddUsereDialog()),
                iconData: Icons.add,
                text: 'Ajoutre',
              ),
              AppActionButton(
                color: colors.warning,
                onPressed: () => AppDialogs.customDialog(
                    context: context,
                    dialog: EditUsereDialog(
                      user: DummyData.localDbUser,
                    )),
                iconData: Icons.edit,
                text: 'Modify',
              ),
            ],
          ),
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
  'Date d\'inscription'
];
