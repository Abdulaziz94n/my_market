import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:my_market/core/constants/sizes.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_rounded_box.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';
import 'package:my_market/core/widgets/shared/app_text_field.dart';
import 'package:my_market/core/widgets/shared/spacing_widgets.dart';
import 'package:my_market/features/client/domain/credit_client_model.dart';

class ClientSelectionDialog extends HookWidget {
  const ClientSelectionDialog({
    super.key,
    required this.clients,
    required this.onSelect,
  });
  final List<CreditClientModel> clients;
  final ValueChanged<CreditClientModel> onSelect;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final selectedClient = useState<CreditClientModel?>(null);
    final searchCtrl = useTextEditingController();

    return SizedBox(
      width: 400,
      child: Padding(
        padding: Sizes.defaultDialogPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: AppText(text: 'Liste de clients'),
            ),
            const VerticalSpacingWidget(Sizes.p8),
            AppTextField.withController(
              width: 100,
              controller: searchCtrl,
              hint: 'Recherche',
            ),
            const VerticalSpacingWidget(Sizes.p8),
            Row(
              children: [
                Expanded(
                  child: AppRoundedBox(
                    color: colors.active,
                    child: const AppText(text: 'Code'),
                  ),
                ),
                const HorizontalSpacingWidget(Sizes.p8),
                Expanded(
                  flex: 3,
                  child: AppRoundedBox(
                    color: colors.active,
                    child: const AppText(text: 'User Name'),
                  ),
                ),
              ],
            ),
            const VerticalSpacingWidget(Sizes.p8),
            ...List.generate(clients.length, (index) {
              final client = clients[index];
              final isSelected = selectedClient.value == client;
              final itemColor = isSelected ? colors.primary : colors.background;
              return Padding(
                padding: const EdgeInsets.only(bottom: Sizes.p8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppRoundedBox(
                          color: itemColor,
                          onTap: isSelected
                              ? null
                              : () => selectedClient.value = client,
                          child: AppText(text: client.code)),
                    ),
                    const HorizontalSpacingWidget(Sizes.p8),
                    Expanded(
                      flex: 3,
                      child: AppRoundedBox(
                          color: itemColor,
                          onTap: isSelected
                              ? null
                              : () => selectedClient.value = client,
                          child: AppText(text: client.code)),
                    ),
                  ],
                ),
              );
            }),
            const VerticalSpacingWidget(Sizes.p32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: colors.success),
                  onPressed: selectedClient.value == null
                      ? null
                      : () {
                          onSelect(selectedClient.value!);
                          context.pop();
                        },
                  child: const AppText(text: 'Confirmer'),
                ),
                const HorizontalSpacingWidget(Sizes.p8),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: colors.error),
                  onPressed: context.pop,
                  child: const AppText(text: 'Annuler'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
