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
import 'package:my_market/features/client/presentation/widgets/add_company_client_dialog.dart';
import 'package:my_market/features/client/presentation/widgets/edit_company_client_dialog.dart';

class CompanyClientTabBody extends HookConsumerWidget {
  const CompanyClientTabBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.appColors;
    final clientsList = DummyData.companyClients;
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
          icon: Icons.abc,
          title: 'title',
          subTitle: 'subTitle',
        ),
        AppPrimaryCard(
          icon: Icons.abc,
          title: 'title',
          subTitle: 'subTitle',
        ),
        AppPrimaryCard(
          icon: Icons.abc,
          title: 'title',
          subTitle: 'subTitle',
        ),
        AppPrimaryCard(
          icon: Icons.abc,
          title: 'title',
          subTitle: 'subTitle',
        ),
      ],
      table: AppTabledCard(
        showActions: showActions,
        selectedItems: selectedItems,
        cellValues: (index) => [
          clientsList[index].id,
          clientsList[index].fullName,
          clientsList[index].companyName,
          clientsList[index].phoneNumber,
          clientsList[index].email,
          clientsList[index].createdBy,
          'Date',
        ],
        items: clientsList,
        headers: _headers,
        rowSelectionId: (index) => clientsList[index].id,
        itemIdField: (item) => item.id,
        actions: AppActionsRow(
          showActions: showActions,
          onChanged: (val) => showActions.value = !val,
          searchCtrl: searchCtrl,
          onSearch: () {},
          actions: [
            AppActionButton(
              color: colors.success,
              onPressed: () => AppDialogs.customDialog(
                context: context,
                dialog: const AddCompanyClienttDialog(),
              ),
              iconData: Icons.add,
              text: 'Ajouter Nouveau Client',
            ),
            AppActionButton(
              color: colors.blue,
              onPressed: () {},
              iconData: Icons.remove_red_eye_outlined,
              text: 'Facturation',
            ),
            AppActionButton(
              color: colors.warning,
              onPressed: () => AppDialogs.customDialog(
                context: context,
                dialog: EditCompanyClienttDialog(
                  client: DummyData.companyClients[0],
                ),
              ),
              iconData: Icons.edit,
              text: 'Modifier',
            ),
            AppActionButton(
              color: colors.error,
              onPressed: () {},
              iconData: Icons.close,
              text: 'Supprimer un client',
            ),
            AppActionButton(
              color: colors.blue,
              onPressed: () {},
              iconData: Icons.arrow_drop_down,
              text: 'Exporter',
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
  'Nom du Societe',
  'Telephone',
  'E-mail',
  'Ajoute par',
  'Date',
];
