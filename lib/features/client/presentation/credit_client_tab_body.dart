import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/constants/dummy_data.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/utils/app_dialogs.dart';
import 'package:my_market/core/widgets/shared/app_action_button.dart';
import 'package:my_market/core/widgets/shared/app_actions_row.dart';
import 'package:my_market/core/widgets/shared/app_main_tabled_body.dart';
import 'package:my_market/core/widgets/shared/app_primary_card.dart';
import 'package:my_market/core/widgets/shared/app_tabled_card.dart';
import 'package:my_market/features/client/presentation/widgets/add_credit_client_dialog.dart';
import 'package:my_market/features/client/presentation/widgets/edit_credit_client_dialog.dart';

class CreditClientTabBody extends HookConsumerWidget {
  const CreditClientTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final clientsList = DummyData.creditClients;
    final selectedItems = useState<List<String>>([]);
    final showActions = useState(false);
    final searchCtrl = useTextEditingController();
    useEffect(() {
      showActions.value = selectedItems.value.length == 1;
      return null;
    }, [selectedItems.value]);

    return AppMainTabledBody(
      title: 'Clients & Credits',
      primaryCards: const [
        AppPrimaryCard(
          icon: Icons.add,
          title: 'title',
          subTitle: 'subTitle',
        ),
        AppPrimaryCard(
          icon: Icons.add,
          title: 'title',
          subTitle: 'subTitle',
        ),
        AppPrimaryCard(
          icon: Icons.add,
          title: 'title',
          subTitle: 'subTitle',
        ),
        AppPrimaryCard(
          icon: Icons.add,
          title: 'title',
          subTitle: 'subTitle',
        ),
      ],
      table: AppTabledCard(
        headers: _headers,
        showActions: showActions,
        selectedItems: selectedItems,
        cellValues: (index) => [
          clientsList[index].id,
          clientsList[index].fullName,
          '800.00 MAD',
          '12',
          clientsList[index].phoneNumber,
          clientsList[index].createdBy,
          'Date is here',
        ],
        items: clientsList,
        itemIdField: (item) => item.id,
        rowSelectionId: (index) => clientsList[index].id,
        actions: AppActionsRow(
          showActions: showActions,
          searchCtrl: searchCtrl,
          onSearch: () {},
          actions: [
            AppActionButton(
              onPressed: () => AppDialogs.customDialog(
                context: context,
                dialog: const AddCreditClienttDialog(),
              ),
              iconData: Icons.add,
              text: 'Ajouter Nouveau Client',
              color: colors.success,
            ),
            AppActionButton(
              onPressed: () {},
              iconData: Icons.remove_red_eye_sharp,
              text: 'Reglements',
              color: colors.blue,
            ),
            AppActionButton(
              onPressed: () => AppDialogs.customDialog(
                  context: context,
                  dialog: EditCreditClienttDialog(
                    client: DummyData.creditClients.first,
                  )),
              iconData: Icons.edit,
              text: 'Modifier',
              color: colors.warning,
            ),
            AppActionButton(
              onPressed: () {},
              iconData: Icons.close,
              text: 'Supprimer un client',
              color: colors.error,
            ),
            AppActionButton(
              onPressed: () {},
              iconData: Icons.arrow_drop_down_outlined,
              text: 'Exporter',
              color: colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> _headers = [
  '',
  'ID',
  'Nom Du Client',
  'Total Credit',
  'Tickets',
  'Telephone',
  'Ajoute par',
  'Date',
];
