import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_market/core/extensions/build_context_extension.dart';
import 'package:my_market/core/widgets/shared/app_text.dart';

class OrderActions extends ConsumerWidget {
  const OrderActions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        OrderAction(
          color: context.appColors.primary,
          label: 'Credit',
          onTap: () {},
        ),
        OrderAction(
          color: context.appColors.primary,
          label: 'Retour d\'article',
          onTap: () {},
        ),
        OrderAction(
          color: context.appColors.primary,
          label: 'Nouveau',
          onTap: () {},
        ),
        OrderAction(
          color: context.appColors.error,
          label: 'Supprimer l\'article',
          onTap: () {},
        ),
        OrderAction(
          color: context.appColors.warning,
          label: 'Ticket d\'attente',
          onTap: () {},
        ),
        OrderAction(
          color: context.appColors.success,
          label: 'Ajouter',
          onTap: () {},
        ),
      ],
    );
  }
}

class OrderAction extends StatelessWidget {
  const OrderAction({
    super.key,
    required this.color,
    required this.onTap,
    required this.label,
  });
  final Color color;
  final VoidCallback onTap;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 100,
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: Center(
                child: AppText(
              text: label,
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ),
    );
  }
}
